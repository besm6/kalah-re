#ifndef KALAH_H
#define KALAH_H

#include <array>
#include <vector>
#include <string>
#include <random>
#include <memory>

constexpr int PITS_PER_SIDE = 6;
constexpr int KALAH_INDEX = 6;
constexpr int TOTAL_PITS = 7;
constexpr int INITIAL_STONES = 6;
constexpr int WINNING_SCORE = 37;

enum class Player {
    JINN = 0,
    USER = 1
};

enum class MoveResult {
    INVALID = 0,
    SWITCH_TURN = 1,
    EXTRA_TURN = 2
};

enum class Level {
    NOVICE = 1,    // Юноша (Youth)
    CANDIDATE = 2, // Кандидат
    PARTICIPANT = 3, // Участник
    MASTER = 4     // Эфенди
};

enum class Gender {
    UNKNOWN = 0,
    MALE = 1,
    FEMALE = 2
};

struct OneSide {
    std::array<int, TOTAL_PITS> pits;
    
    OneSide() {
        pits.fill(0);
    }
    
    int& operator[](size_t idx) { return pits[idx]; }
    const int& operator[](size_t idx) const { return pits[idx]; }
    
    int getKalah() const { return pits[KALAH_INDEX]; }
    void setKalah(int value) { pits[KALAH_INDEX] = value; }
    
    int getTotalInPits() const {
        int sum = 0;
        for (int i = 0; i < PITS_PER_SIDE; ++i) {
            sum += pits[i];
        }
        return sum;
    }
};

struct Position {
    std::array<OneSide, 2> sides;
    Player currentPlayer;
    
    Position() : currentPlayer(Player::USER) {}
    
    OneSide& operator[](Player p) { return sides[static_cast<int>(p)]; }
    const OneSide& operator[](Player p) const { return sides[static_cast<int>(p)]; }
    
    Player opponent(Player p) const {
        return (p == Player::JINN) ? Player::USER : Player::JINN;
    }
    
    bool isGameOver() const {
        return sides[0].getTotalInPits() == 0 || sides[1].getTotalInPits() == 0;
    }
    
    void collectRemaining() {
        for (int i = 0; i < PITS_PER_SIDE; ++i) {
            sides[0].pits[KALAH_INDEX] += sides[0].pits[i];
            sides[0].pits[i] = 0;
            sides[1].pits[KALAH_INDEX] += sides[1].pits[i];
            sides[1].pits[i] = 0;
        }
    }
};

struct EvaluationWeights {
    int kalahWeight;      // Weight for stones in kalah
    int extraTurnBonus;   // Bonus for landing in kalah
    int emptyPitValue;    // Value of empty pits (capture setup)
    int multiLapBonus;    // Bonus for stones that go multiple laps
    int captureValue;     // Value of capture opportunities
    int mobilityWeight;   // Weight for mobile stones
    int distanceWeight;   // Weight for distance to kalah
};

struct GameStats {
    int jinnScore = 0;
    int userScore = 0;
    int gamesPlayed = 0;
    int jinnWins = 0;
    int userWins = 0;
    int draws = 0;
};

class KalahGame {
public:
    KalahGame(Level level = Level::NOVICE, const std::string& userName = "Player");
    
    void initializeBoard();
    MoveResult makeMove(Player player, int pitIndex, bool animate = true);
    int selectAIMove();
    
    Position& getPosition() { return position; }
    const Position& getPosition() const { return position; }
    
    Level getLevel() const { return level; }
    void setLevel(Level l) { level = l; }
    
    const GameStats& getStats() const { return stats; }
    void updateStats(Player winner);
    
    std::string getUserName() const { return userName; }
    void setUserName(const std::string& name) { userName = name; }
    
    Gender getGender() const { return gender; }
    void setGender(Gender g) { gender = g; }
    
    std::string getPhrase(int moveNumber);
    
private:
    Position position;
    Level level;
    std::string userName;
    Gender gender;
    GameStats stats;
    std::mt19937 rng;
    
    int movesThisGame;
    int lastJinnKalah;
    int lastUserKalah;
    bool aiSilent;
    
    EvaluationWeights getWeights() const;
    int evaluatePosition(const Position& pos);
    int minimax(Position& pos, int depth, int alpha, int beta, bool maximizing);
    int diffScore(const Position& pos);
    
    std::vector<std::string> phrases;
    std::vector<bool> phrasesUsed;
    void initializePhrases();
    int randomInt(int max);
};

#endif // KALAH_H
