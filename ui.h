#ifndef UI_H
#define UI_H

#include "kalah.h"
#include <ncurses.h>
#include <string>
#include <vector>

class KalahUI {
public:
    KalahUI();
    ~KalahUI();
    
    void initialize();
    void cleanup();
    
    void drawBoard(const Position& pos, const std::string& jinnName, 
                   const std::string& userName);
    void drawTitle();
    void drawStats(const GameStats& stats, Level level);
    void displayMessage(const std::string& msg, int color = 0);
    void displayError(const std::string& msg);
    
    int getUserMove();
    char getUserCommand();
    std::string getUserInput(const std::string& prompt);
    
    void animateMove(const Position& before, const Position& after, 
                     Player player, int pitIndex);
    
    void showWelcome();
    Level selectLevel();
    std::string getUserName();
    Gender selectGender();
    
    bool confirm(const std::string& question);
    
    void clearMessageArea();
    void waitForKey();
    
private:
    WINDOW* boardWin;
    WINDOW* messageWin;
    WINDOW* statsWin;
    
    int boardHeight;
    int boardWidth;
    int messageHeight;
    int statsHeight;
    
    void drawPit(int y, int x, int stones, bool highlight = false);
    void drawKalah(int y, int x, int stones, bool isJinn);
    void centerText(WINDOW* win, int y, const std::string& text, int attr = 0);
    
    std::pair<int, int> getPitCoordinates(Player player, int pitIndex);
};

#endif // UI_H
