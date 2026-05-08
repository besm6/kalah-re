#include "kalah.h"
#include <algorithm>
#include <ctime>
#include <cmath>

KalahGame::KalahGame(Level level, const std::string& userName)
    : level(level), userName(userName), gender(Gender::UNKNOWN),
      movesThisGame(0), lastJinnKalah(0), lastUserKalah(0), aiSilent(false)
{
    rng.seed(std::time(nullptr));
    initializePhrases();
    phrasesUsed.resize(phrases.size(), false);
}

void KalahGame::initializeBoard() {
    for (int player = 0; player < 2; ++player) {
        for (int i = 0; i < PITS_PER_SIDE; ++i) {
            position.sides[player][i] = INITIAL_STONES;
        }
        position.sides[player][KALAH_INDEX] = 0;
    }
    position.currentPlayer = Player::USER;
    movesThisGame = 0;
    lastJinnKalah = 0;
    lastUserKalah = 0;
    std::fill(phrasesUsed.begin(), phrasesUsed.end(), false);
}

MoveResult KalahGame::makeMove(Player player, int pitIndex, bool animate) {
    if (pitIndex < 0 || pitIndex >= PITS_PER_SIDE) {
        return MoveResult::INVALID;
    }
    
    OneSide& currentSide = position[player];
    int stones = currentSide[pitIndex];
    
    if (stones == 0) {
        return MoveResult::INVALID;
    }
    
    currentSide[pitIndex] = 0;
    
    Player currentP = player;
    int currentPit = pitIndex;
    Player opponent = position.opponent(player);
    
    while (stones > 0) {
        currentPit++;
        
        if (currentPit >= TOTAL_PITS) {
            currentP = position.opponent(currentP);
            currentPit = 0;
        }
        
        if (currentPit == KALAH_INDEX && currentP == opponent) {
            continue;
        }
        
        position[currentP][currentPit]++;
        stones--;
        
        if (stones == 0) {
            if (currentPit == KALAH_INDEX && currentP == player) {
                return MoveResult::EXTRA_TURN;
            }
            
            if (currentP == player && currentPit < PITS_PER_SIDE && 
                position[currentP][currentPit] == 1) {
                int oppositePit = PITS_PER_SIDE - 1 - currentPit;
                int capturedStones = position[opponent][oppositePit];
                
                if (capturedStones > 0) {
                    position[player][KALAH_INDEX] += capturedStones + 1;
                    position[currentP][currentPit] = 0;
                    position[opponent][oppositePit] = 0;
                }
            }
        }
    }
    
    position.currentPlayer = opponent;
    movesThisGame++;
    return MoveResult::SWITCH_TURN;
}

EvaluationWeights KalahGame::getWeights() const {
    EvaluationWeights weights;
    
    switch (level) {
        case Level::NOVICE:
            weights = {10, 5, 2, 1, 3, 1, 1};
            break;
        case Level::CANDIDATE:
            weights = {15, 8, 3, 2, 5, 2, 2};
            break;
        case Level::PARTICIPANT:
            weights = {20, 10, 5, 3, 8, 3, 3};
            break;
        case Level::MASTER:
            weights = {25, 12, 6, 4, 10, 4, 4};
            break;
    }
    
    return weights;
}

int KalahGame::diffScore(const Position& pos) {
    int jinnTotal = pos[Player::JINN].getKalah();
    int userTotal = pos[Player::USER].getKalah();
    
    for (int i = 0; i < TOTAL_PITS; ++i) {
        jinnTotal += pos[Player::JINN][i];
        userTotal += pos[Player::USER][i];
    }
    
    int diff = jinnTotal - userTotal;
    if (diff > 0) return 100000;
    if (diff < 0) return -100000;
    return 0;
}

int KalahGame::evaluatePosition(const Position& pos) {
    if (pos.isGameOver()) {
        return diffScore(pos);
    }
    
    EvaluationWeights w = getWeights();
    
    int jinnScore = pos[Player::JINN].getKalah() * w.kalahWeight;
    int userScore = pos[Player::USER].getKalah() * w.kalahWeight;
    
    for (int i = 0; i < PITS_PER_SIDE; ++i) {
        int jinnStones = pos[Player::JINN][i];
        int userStones = pos[Player::USER][i];
        
        if (jinnStones > 0) {
            int distance = KALAH_INDEX - i;
            jinnScore += jinnStones * w.mobilityWeight;
            jinnScore += (KALAH_INDEX - distance) * w.distanceWeight;
            
            if (jinnStones == distance) {
                jinnScore += w.extraTurnBonus;
            }
            
            if (jinnStones == PITS_PER_SIDE + 1 + i) {
                userScore += w.captureValue;
            }
        } else {
            int oppositePit = PITS_PER_SIDE - 1 - i;
            if (pos[Player::USER][oppositePit] > 0) {
                userScore += w.emptyPitValue;
            }
        }
        
        if (userStones > 0) {
            int distance = KALAH_INDEX - i;
            userScore += userStones * w.mobilityWeight;
            userScore += (KALAH_INDEX - distance) * w.distanceWeight;
            
            if (userStones == distance) {
                userScore += w.extraTurnBonus;
            }
            
            if (userStones == PITS_PER_SIDE + 1 + i) {
                jinnScore += w.captureValue;
            }
        } else {
            int oppositePit = PITS_PER_SIDE - 1 - i;
            if (pos[Player::JINN][oppositePit] > 0) {
                jinnScore += w.emptyPitValue;
            }
        }
    }
    
    return jinnScore - userScore;
}

int KalahGame::minimax(Position& pos, int depth, int alpha, int beta, bool maximizing) {
    if (depth == 0 || pos.isGameOver()) {
        return evaluatePosition(pos);
    }
    
    Player currentPlayer = maximizing ? Player::JINN : Player::USER;
    
    if (maximizing) {
        int maxEval = -1000000;
        
        for (int pit = 0; pit < PITS_PER_SIDE; ++pit) {
            if (pos[currentPlayer][pit] == 0) continue;
            
            Position savedPos = position;
            position = pos;
            
            MoveResult result = makeMove(currentPlayer, pit, false);
            Position newPos = position;
            
            position = savedPos;
            
            int eval;
            if (result == MoveResult::EXTRA_TURN) {
                eval = minimax(newPos, depth, alpha, beta, true);
            } else {
                eval = minimax(newPos, depth - 1, alpha, beta, false);
            }
            
            maxEval = std::max(maxEval, eval);
            alpha = std::max(alpha, eval);
            
            if (beta <= alpha) {
                break;
            }
        }
        
        return maxEval;
    } else {
        int minEval = 1000000;
        
        for (int pit = 0; pit < PITS_PER_SIDE; ++pit) {
            if (pos[currentPlayer][pit] == 0) continue;
            
            Position savedPos = position;
            position = pos;
            
            MoveResult result = makeMove(currentPlayer, pit, false);
            Position newPos = position;
            
            position = savedPos;
            
            int eval;
            if (result == MoveResult::EXTRA_TURN) {
                eval = minimax(newPos, depth, alpha, beta, false);
            } else {
                eval = minimax(newPos, depth - 1, alpha, beta, true);
            }
            
            minEval = std::min(minEval, eval);
            beta = std::min(beta, eval);
            
            if (beta <= alpha) {
                break;
            }
        }
        
        return minEval;
    }
}

int KalahGame::selectAIMove() {
    int depth = (level == Level::NOVICE || level == Level::CANDIDATE) ? 2 : 4;
    
    struct MoveEval {
        int pit;
        int score;
    };
    
    std::vector<MoveEval> moves;
    
    for (int pit = 0; pit < PITS_PER_SIDE; ++pit) {
        if (position[Player::JINN][pit] == 0) continue;
        
        Position savedPos = position;
        
        MoveResult result = makeMove(Player::JINN, pit, false);
        Position newPos = position;
        
        position = savedPos;
        
        int score;
        if (result == MoveResult::EXTRA_TURN) {
            score = minimax(newPos, depth, -1000000, 1000000, true);
        } else {
            score = minimax(newPos, depth - 1, -1000000, 1000000, false);
        }
        
        moves.push_back({pit, score});
    }
    
    if (moves.empty()) {
        return -1;
    }
    
    int maxScore = moves[0].score;
    for (const auto& m : moves) {
        maxScore = std::max(maxScore, m.score);
    }
    
    std::vector<MoveEval> bestMoves;
    for (const auto& m : moves) {
        if (m.score >= maxScore - 50) {
            bestMoves.push_back(m);
        }
    }
    
    if (level >= Level::PARTICIPANT && randomInt(100) < 20) {
        int idx = randomInt(bestMoves.size());
        return bestMoves[idx].pit;
    }
    
    return bestMoves[0].pit;
}

void KalahGame::updateStats(Player winner) {
    stats.gamesPlayed++;
    
    if (winner == Player::JINN) {
        stats.jinnScore++;
        stats.jinnWins++;
    } else if (winner == Player::USER) {
        stats.userScore++;
        stats.userWins++;
    } else {
        stats.draws++;
    }
}

int KalahGame::randomInt(int max) {
    std::uniform_int_distribution<int> dist(0, max - 1);
    return dist(rng);
}

void KalahGame::initializePhrases() {
    phrases = {
        "Thinking carefully...",
        "Interesting move!",
        "This is getting challenging.",
        "I see your strategy.",
        "A wise choice.",
        "You're playing well!",
        "Let me consider this...",
        "Hmm, tough decision.",
        "I must be careful here.",
        "Good game so far!",
        "Your skills are improving.",
        "This position is complex.",
        "I'm enjoying this match.",
        "Well played!",
        "An unexpected move.",
        "I should have seen that coming.",
        "The game is close.",
        "One of us will win soon.",
        "Every move counts now.",
        "The endgame approaches.",
        "You're giving me a challenge!",
        "I need to think deeper.",
        "A clever play.",
        "The tide is turning.",
        "Fortune favors the bold.",
        "Patience is key in Kalah.",
        "Strategy over speed.",
        "Each pit tells a story.",
        "The stones will decide.",
        "May the best player win!"
    };
}

std::string KalahGame::getPhrase(int moveNumber) {
    if (aiSilent || phrases.empty()) {
        return "";
    }
    
    if (randomInt(100) < 70) {
        return "";
    }
    
    std::vector<int> available;
    for (size_t i = 0; i < phrases.size(); ++i) {
        if (!phrasesUsed[i]) {
            available.push_back(i);
        }
    }
    
    if (available.empty()) {
        std::fill(phrasesUsed.begin(), phrasesUsed.end(), false);
        available.resize(phrases.size());
        for (size_t i = 0; i < phrases.size(); ++i) {
            available[i] = i;
        }
    }
    
    int idx = available[randomInt(available.size())];
    phrasesUsed[idx] = true;
    
    return phrases[idx];
}
