#include "kalah.h"
#include "ui.h"
#include <iostream>
#include <sstream>
#include <thread>
#include <chrono>

class GameController {
public:
    GameController() : game(Level::NOVICE, "Player"), ui(), gameRunning(true) {}
    
    void run() {
	    ui.initialize();
        ui.showWelcome();
        
        std::string userName = ui.getUserName();
        game.setUserName(userName);
        
        Gender gender = ui.selectGender();
        game.setGender(gender);
        
        Level level = ui.selectLevel();
        game.setLevel(level);
        
        ui.initialize();
        
        while (gameRunning) {
            playGame();
            
            if (!ui.confirm("Play another game?")) {
                break;
            }
        }
        
        showFinalStats();
    }
    
private:
    KalahGame game;
    KalahUI ui;
    bool gameRunning;
    
    void playGame() {
        game.initializeBoard();
        
        ui.drawTitle();
        ui.drawStats(game.getStats(), game.getLevel());
        ui.drawBoard(game.getPosition(), "DJINN", game.getUserName());
        
        Player currentPlayer = Player::USER;
        bool extraTurn = false;
        
        while (!game.getPosition().isGameOver()) {
            if (currentPlayer == Player::USER) {
                if (!handleUserTurn(extraTurn)) {
                    return;
                }
            } else {
                handleAITurn(extraTurn);
            }
            
            if (!extraTurn) {
                currentPlayer = game.getPosition().opponent(currentPlayer);
            }
            
            ui.drawBoard(game.getPosition(), "DJINN", game.getUserName());
            ui.drawStats(game.getStats(), game.getLevel());
        }
        
        finishGame();
    }
    
    bool handleUserTurn(bool& extraTurn) {
        while (true) {
            ui.clearMessageArea();
            
            if (extraTurn) {
                ui.displayMessage("Extra turn! Choose pit (1-6): ", 3);
            }
            
            int move = ui.getUserMove();
            
            if (move == -2) {
                if (ui.confirm("Are you sure you want to quit?")) {
                    gameRunning = false;
                    return false;
                }
                continue;
            }
            
            if (move == -3) {
                showHelp();
                continue;
            }
            
            if (move < 0 || move >= PITS_PER_SIDE) {
                ui.displayError("Invalid input. Choose pit 1-6.");
                ui.waitForKey();
                continue;
            }
            
            if (game.getPosition()[Player::USER][move] == 0) {
                ui.displayError("That pit is empty. Choose another.");
                ui.waitForKey();
                continue;
            }
            
            MoveResult result = game.makeMove(Player::USER, move, true);
            
            extraTurn = (result == MoveResult::EXTRA_TURN);
            
            ui.drawBoard(game.getPosition(), "DJINN", game.getUserName());
            
            if (extraTurn) {
                ui.displayMessage("You got an extra turn!", 3);
                std::this_thread::sleep_for(std::chrono::milliseconds(800));
            }
            
            return true;
        }
    }
    
    void handleAITurn(bool& extraTurn) {
        ui.displayMessage("Djinn is thinking...", 1);
        ui.drawBoard(game.getPosition(), "DJINN", game.getUserName());
        
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
        
        int move = game.selectAIMove();
        
        if (move < 0) {
            extraTurn = false;
            return;
        }
        
        std::string phrase = game.getPhrase(0);
        if (!phrase.empty()) {
            ui.displayMessage("Djinn: " + phrase, 1);
            std::this_thread::sleep_for(std::chrono::milliseconds(1000));
        }
        
        MoveResult result = game.makeMove(Player::JINN, move, true);
        
        extraTurn = (result == MoveResult::EXTRA_TURN);
        
        std::ostringstream oss;
        oss << "Djinn plays pit " << (PITS_PER_SIDE - move);
        
        if (extraTurn) {
            oss << " - Extra turn!";
        }
        
        ui.displayMessage(oss.str(), 1);
        ui.drawBoard(game.getPosition(), "DJINN", game.getUserName());
        
        std::this_thread::sleep_for(std::chrono::milliseconds(800));
    }
    
    void finishGame() {
        Position& pos = game.getPosition();
        pos.collectRemaining();
        
        ui.drawBoard(pos, "DJINN", game.getUserName());
        
        int jinnTotal = pos[Player::JINN].getKalah();
        int userTotal = pos[Player::USER].getKalah();
        
        std::ostringstream oss;
        oss << "GAME OVER!\n\n";
        oss << "Final Score:\n";
        oss << "  Djinn: " << jinnTotal << "\n";
        oss << "  " << game.getUserName() << ": " << userTotal << "\n\n";
        
        Player winner;
        if (jinnTotal > userTotal) {
            oss << "Djinn wins!";
            winner = Player::JINN;
        } else if (userTotal > jinnTotal) {
            oss << game.getUserName() << " wins!";
            winner = Player::USER;
        } else {
            oss << "It's a draw!";
            winner = static_cast<Player>(-1);
        }
        
        if (winner != static_cast<Player>(-1)) {
            game.updateStats(winner);
        }
        
        ui.displayMessage(oss.str(), 3);
        ui.drawStats(game.getStats(), game.getLevel());
        ui.waitForKey();
    }
    
    void showHelp() {
        std::ostringstream oss;
        oss << "KALAH RULES:\n";
        oss << "- Choose a pit (1-6) on your side\n";
        oss << "- Stones are distributed counter-clockwise\n";
        oss << "- Landing in your Kalah gives extra turn\n";
        oss << "- Landing in empty pit captures opposite\n";
        oss << "- Game ends when one side is empty\n";
        oss << "- Player with most stones wins!";
        
        ui.displayMessage(oss.str());
        ui.waitForKey();
    }
    
    void showFinalStats() {
        const GameStats& stats = game.getStats();
        
        std::ostringstream oss;
        oss << "FINAL STATISTICS:\n\n";
        oss << "Games Played: " << stats.gamesPlayed << "\n";
        oss << "Djinn Wins: " << stats.jinnWins << "\n";
        oss << game.getUserName() << " Wins: " << stats.userWins << "\n";
        oss << "Draws: " << stats.draws << "\n\n";
        oss << "Thanks for playing!";
        
        ui.displayMessage(oss.str(), 3);
        ui.waitForKey();
    }
};

int main() {
    try {
        GameController controller;
        controller.run();
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}
