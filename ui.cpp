#include "ui.h"
#include <algorithm>
#include <sstream>

KalahUI::KalahUI() 
    : boardWin(nullptr), messageWin(nullptr), statsWin(nullptr),
      boardHeight(15), boardWidth(70), messageHeight(5), statsHeight(3) {
}

KalahUI::~KalahUI() {
    cleanup();
}

void KalahUI::initialize() {
    initscr();
    start_color();
    cbreak();
    noecho();
    keypad(stdscr, TRUE);
    curs_set(0);
    
    init_pair(1, COLOR_YELLOW, COLOR_BLACK);  // Jinn
    init_pair(2, COLOR_CYAN, COLOR_BLACK);    // User
    init_pair(3, COLOR_GREEN, COLOR_BLACK);   // Highlights
    init_pair(4, COLOR_RED, COLOR_BLACK);     // Errors
    init_pair(5, COLOR_WHITE, COLOR_BLUE);    // Title
    init_pair(6, COLOR_MAGENTA, COLOR_BLACK); // Kalah
    
    int maxY, maxX;
    getmaxyx(stdscr, maxY, maxX);
    
    int startY = (maxY - (boardHeight + messageHeight + statsHeight)) / 2;
    int startX = (maxX - boardWidth) / 2;
    
    if (startY < 0) startY = 0;
    if (startX < 0) startX = 0;
    
    statsWin = newwin(statsHeight, boardWidth, startY, startX);
    boardWin = newwin(boardHeight, boardWidth, startY + statsHeight, startX);
    messageWin = newwin(messageHeight, boardWidth, 
                       startY + statsHeight + boardHeight, startX);
    
    box(boardWin, 0, 0);
    box(messageWin, 0, 0);
    box(statsWin, 0, 0);
    
    refresh();
}

void KalahUI::cleanup() {
    if (boardWin) delwin(boardWin);
    if (messageWin) delwin(messageWin);
    if (statsWin) delwin(statsWin);
    endwin();
}

void KalahUI::drawTitle() {
    werase(statsWin);
    box(statsWin, 0, 0);
    wattron(statsWin, COLOR_PAIR(5) | A_BOLD);
    centerText(statsWin, 1, "*** K A L A H ***");
    wattroff(statsWin, COLOR_PAIR(5) | A_BOLD);
    wrefresh(statsWin);
}

void KalahUI::centerText(WINDOW* win, int y, const std::string& text, int attr) {
    int width = getmaxx(win);
    int x = (width - text.length()) / 2;
    if (x < 1) x = 1;
    
    if (attr) wattron(win, attr);
    mvwprintw(win, y, x, "%s", text.c_str());
    if (attr) wattroff(win, attr);
}

void KalahUI::drawPit(int y, int x, int stones, bool highlight) {
    if (highlight) {
        wattron(boardWin, COLOR_PAIR(3) | A_BOLD);
    }
    
    mvwprintw(boardWin, y, x, "(%2d)", stones);
    
    if (highlight) {
        wattroff(boardWin, COLOR_PAIR(3) | A_BOLD);
    }
}

void KalahUI::drawKalah(int y, int x, int stones, bool isJinn) {
    wattron(boardWin, COLOR_PAIR(6) | A_BOLD);
    mvwprintw(boardWin, y, x, "[%2d]", stones);
    wattroff(boardWin, COLOR_PAIR(6) | A_BOLD);
}

void KalahUI::drawBoard(const Position& pos, const std::string& jinnName, 
                        const std::string& userName) {
    werase(boardWin);
    box(boardWin, 0, 0);
    
    wattron(boardWin, COLOR_PAIR(1) | A_BOLD);
    mvwprintw(boardWin, 1, 3, "DJINN");
    wattroff(boardWin, COLOR_PAIR(1) | A_BOLD);
    
    for (int i = 0; i < PITS_PER_SIDE; ++i) {
        mvwprintw(boardWin, 2, 15 + (PITS_PER_SIDE - 1 - i) * 7, "  %d", PITS_PER_SIDE - i);
    }
    
    for (int i = 0; i < PITS_PER_SIDE; ++i) {
        int pitIdx = PITS_PER_SIDE - 1 - i;
        drawPit(3, 14 + i * 7, pos[Player::JINN][pitIdx]);
    }
    
    drawKalah(6, 3, pos[Player::JINN].getKalah(), true);
    
    drawKalah(6, 60, pos[Player::USER].getKalah(), false);
    
    for (int i = 0; i < PITS_PER_SIDE; ++i) {
        drawPit(9, 14 + i * 7, pos[Player::USER][i]);
    }
    
    for (int i = 0; i < PITS_PER_SIDE; ++i) {
        mvwprintw(boardWin, 10, 15 + i * 7, "  %d", i + 1);
    }
    
    wattron(boardWin, COLOR_PAIR(2) | A_BOLD);
    mvwprintw(boardWin, 12, 3, "%s", userName.c_str());
    wattroff(boardWin, COLOR_PAIR(2) | A_BOLD);
    
    wrefresh(boardWin);
}

void KalahUI::drawStats(const GameStats& stats, Level level) {
    werase(statsWin);
    box(statsWin, 0, 0);
    
    std::string levelStr;
    switch (level) {
        case Level::NOVICE: levelStr = "Novice"; break;
        case Level::CANDIDATE: levelStr = "Candidate"; break;
        case Level::PARTICIPANT: levelStr = "Participant"; break;
        case Level::MASTER: levelStr = "Master"; break;
    }
    
    std::ostringstream oss;
    oss << "Level: " << levelStr << "  |  Score - Djinn: " 
        << stats.jinnScore << "  User: " << stats.userScore;
    
    centerText(statsWin, 1, oss.str());
    wrefresh(statsWin);
}

void KalahUI::displayMessage(const std::string& msg, int color) {
    werase(messageWin);
    box(messageWin, 0, 0);
    
    if (color > 0) {
        wattron(messageWin, COLOR_PAIR(color));
    }
    
    int y = 1;
    int x = 2;
    int maxWidth = getmaxx(messageWin) - 4;
    
    std::istringstream iss(msg);
    std::string line;
    while (std::getline(iss, line) && y < messageHeight - 1) {
        if (line.length() > static_cast<size_t>(maxWidth)) {
            line = line.substr(0, maxWidth);
        }
        mvwprintw(messageWin, y++, x, "%s", line.c_str());
    }
    
    if (color > 0) {
        wattroff(messageWin, COLOR_PAIR(color));
    }
    
    wrefresh(messageWin);
}

void KalahUI::displayError(const std::string& msg) {
    displayMessage("ERROR: " + msg, 4);
}

void KalahUI::clearMessageArea() {
    werase(messageWin);
    box(messageWin, 0, 0);
    wrefresh(messageWin);
}

int KalahUI::getUserMove() {
    displayMessage("Your move (1-6), or 'h' for help, 'q' to quit: ");
    echo();
    curs_set(1);
    
    int ch = wgetch(messageWin);
    
    curs_set(0);
    noecho();
    
    if (ch >= '1' && ch <= '6') {
        return ch - '1';
    }
    
    if (ch == 'q' || ch == 'Q') {
        return -2;
    }
    
    if (ch == 'h' || ch == 'H') {
        return -3;
    }
    
    return -1;
}

char KalahUI::getUserCommand() {
    int ch = wgetch(messageWin);
    return static_cast<char>(ch);
}

std::string KalahUI::getUserInput(const std::string& prompt) {
    displayMessage(prompt);
    echo();
    curs_set(1);
    
    char buffer[256];
    mvwgetnstr(messageWin, 2, 2, buffer, 255);
    
    curs_set(0);
    noecho();
    
    return std::string(buffer);
}

void KalahUI::showWelcome() {
    clear();
    
    int y = LINES / 2 - 5;
    int centerX = COLS / 2;
    
    attron(COLOR_PAIR(5) | A_BOLD);
    mvprintw(y++, centerX - 15, "******************************");
    mvprintw(y++, centerX - 15, "*                            *");
    mvprintw(y++, centerX - 15, "*    KALAH / MANCALA GAME    *");
    mvprintw(y++, centerX - 15, "*                            *");
    mvprintw(y++, centerX - 15, "******************************");
    attroff(COLOR_PAIR(5) | A_BOLD);
    
    y += 2;
    mvprintw(y++, centerX - 20, "A classic strategy game of skill and planning");
    y++;
    mvprintw(y++, centerX - 15, "Press any key to continue...");
    
    refresh();
    getch();
}

Level KalahUI::selectLevel() {
    clear();
    
    int y = LINES / 2 - 4;
    int x = COLS / 2 - 20;
    
    mvprintw(y++, x, "Select Difficulty Level:");
    y++;
    mvprintw(y++, x, "1. Novice      (Easy)");
    mvprintw(y++, x, "2. Candidate   (Medium)");
    mvprintw(y++, x, "3. Participant (Hard)");
    mvprintw(y++, x, "4. Master      (Expert)");
    y++;
    mvprintw(y, x, "Enter choice (1-4): ");
    
    refresh();
    
    while (true) {
        int ch = getch();
        if (ch >= '1' && ch <= '4') {
            return static_cast<Level>(ch - '0');
        }
    }
}

std::string KalahUI::getUserName() {
    clear();
    
    int y = LINES / 2 - 2;
    int x = COLS / 2 - 15;
    
    mvprintw(y++, x, "Enter your name: ");
    
    echo();
    curs_set(1);
    
    char buffer[256];
    getnstr(buffer, 255);
    
    curs_set(0);
    noecho();
    
    std::string name(buffer);
    if (name.empty()) {
        name = "Player";
    }
    
    return name;
}

Gender KalahUI::selectGender() {
    clear();
    
    int y = LINES / 2 - 2;
    int x = COLS / 2 - 15;
    
    mvprintw(y++, x, "Select gender:");
    y++;
    mvprintw(y++, x, "1. Male");
    mvprintw(y++, x, "2. Female");
    mvprintw(y++, x, "3. Prefer not to say");
    y++;
    mvprintw(y, x, "Enter choice (1-3): ");
    
    refresh();
    
    while (true) {
        int ch = getch();
        if (ch == '1') return Gender::MALE;
        if (ch == '2') return Gender::FEMALE;
        if (ch == '3') return Gender::UNKNOWN;
    }
}

bool KalahUI::confirm(const std::string& question) {
    displayMessage(question + " (y/n): ");
    
    while (true) {
        int ch = wgetch(messageWin);
        if (ch == 'y' || ch == 'Y') return true;
        if (ch == 'n' || ch == 'N') return false;
    }
}

void KalahUI::waitForKey() {
    displayMessage("Press any key to continue...");
    wgetch(messageWin);
}

void KalahUI::animateMove(const Position& before, const Position& after, 
                         Player player, int pitIndex) {
    napms(300);
    drawBoard(after, "DJINN", "USER");
    napms(200);
}

std::pair<int, int> KalahUI::getPitCoordinates(Player player, int pitIndex) {
    if (player == Player::JINN) {
        int x = 14 + (PITS_PER_SIDE - 1 - pitIndex) * 7;
        return {3, x};
    } else {
        int x = 14 + pitIndex * 7;
        return {9, x};
    }
}
