# Kalah / Mancala Game - C++ Implementation

A modern C++ implementation of the classic Kalah (Mancala) board game with an AI opponent, based on the original BESM-6 Pascal program from the 1970s-80s.

## Overview

This is a faithful recreation of a sophisticated mainframe game, featuring:
- **AI opponent** using minimax search with alpha-beta pruning
- **Four difficulty levels** from Novice to Master
- **ncurses-based terminal UI** with animated moves
- **Tournament scoring system** tracking wins across multiple games
- **Conversational AI** that comments during gameplay

## Game Rules

Kalah is a two-player strategy game played on a board with:
- 6 pits per player (each starting with 6 stones)
- 1 Kalah (store) per player for captured stones

### How to Play

1. **Choose a pit** (1-6) on your side containing stones
2. **Distribute stones** counter-clockwise, one per pit
3. **Special rules:**
   - Landing in your Kalah grants an extra turn
   - Landing in an empty pit on your side captures the opposite pit's stones
   - Skip your opponent's Kalah when distributing
4. **Game ends** when one side has no stones in their pits
5. **Winner** has the most stones in their Kalah

## Building

### Requirements

- C++17 compatible compiler (g++ 7+ or clang++ 5+)
- ncurses library

### Installation

**Ubuntu/Debian:**
```bash
sudo apt-get install g++ libncurses5-dev
```

**Fedora/RHEL/CentOS:**
```bash
sudo yum install gcc-c++ ncurses-devel
```

**macOS:**
```bash
brew install ncurses
```

### Compile

```bash
make
```

## Running

```bash
./kalah
```

Or:
```bash
make run
```

## Game Controls

- **1-6**: Select pit to play
- **h**: Show help
- **q**: Quit game
- **y/n**: Confirm prompts

## Difficulty Levels

### 1. Novice (Easy)
- Search depth: 2 ply
- Good for learning the game
- Makes occasional mistakes

### 2. Candidate (Medium)
- Search depth: 2 ply
- Better position evaluation
- More consistent play

### 3. Participant (Hard)
- Search depth: 4 ply
- Strategic planning
- Challenging opponent

### 4. Master (Expert)
- Search depth: 4 ply
- Optimal evaluation
- Near-perfect play

## AI Architecture

### Search Algorithm
- **Minimax** with alpha-beta pruning
- Variable depth based on difficulty level
- Extra turn handling in search tree
- Cutoff optimization for efficiency

### Position Evaluation
The AI evaluates positions using weighted factors:
- **Material balance**: Stones in Kalah (highest weight)
- **Mobility**: Available moves and stone distribution
- **Captures**: Empty pits opposite opponent stones
- **Extra turns**: Moves landing in Kalah
- **Distance**: Proximity of stones to Kalah
- **Multi-lap potential**: Stones that traverse the board

### Strategy Weights
Each difficulty level uses different weight configurations:
```cpp
Novice:      {kalah: 10, extra: 5, capture: 3, mobility: 1}
Candidate:   {kalah: 15, extra: 8, capture: 5, mobility: 2}
Participant: {kalah: 20, extra: 10, capture: 8, mobility: 3}
Master:      {kalah: 25, extra: 12, capture: 10, mobility: 4}
```

## Code Structure

```
kalah-re/
├── kalah.h         - Game logic header (Position, GameStats, AI)
├── kalah.cpp       - Game implementation (minimax, evaluation)
├── ui.h            - UI interface header
├── ui.cpp          - ncurses UI implementation
├── main.cpp        - Game controller and main loop
├── Makefile        - Build configuration
├── README.md       - This file
└── comments.txt    - Original Pascal analysis
```

### Key Classes

**KalahGame**: Core game logic
- Board state management
- Move validation and execution
- AI opponent (minimax search)
- Position evaluation
- Statistics tracking

**KalahUI**: Terminal interface
- ncurses-based display
- Animated board updates
- User input handling
- Message display
- Color-coded elements

**GameController**: Game flow
- Game loop coordination
- Turn management
- Win/loss detection
- Multi-game sessions

## Differences from Original

This C++ version modernizes the original BESM-6 Pascal program:

### Preserved Features
- ✅ Core game rules and mechanics
- ✅ Minimax AI with alpha-beta pruning
- ✅ Four difficulty levels
- ✅ Position evaluation heuristics
- ✅ Tournament scoring system
- ✅ Conversational AI commentary

### Simplified/Removed
- ❌ Opening book database (BESM-6 zone files)
- ❌ Correction learning system (persistent storage)
- ❌ Multi-user mainframe features
- ❌ Time-of-day scheduling
- ❌ Game save/resume (persistent zones)
- ❌ Cyrillic/Russian text (English interface)
- ❌ Islamic cultural references

### Modernized
- ✨ C++17 with STL containers
- ✨ Portable ncurses UI
- ✨ Standard random number generation
- ✨ RAII resource management
- ✨ Object-oriented design
- ✨ Simplified control flow (no goto)

## Tips for Playing

1. **Plan ahead**: Think 2-3 moves in advance
2. **Value extra turns**: Moves landing in your Kalah are powerful
3. **Setup captures**: Create empty pits opposite opponent stones
4. **Control endgame**: Force opponent to empty their side first
5. **Count stones**: Track totals to know when you're winning

## Performance

The AI searches thousands of positions per move:
- Novice: ~100-500 nodes
- Candidate: ~500-2000 nodes
- Participant: ~5000-20000 nodes
- Master: ~10000-50000 nodes

Response time is typically under 1 second even at Master level.

## Development Notes

### Original Program (kalah.pas)
The original BESM-6 Pascal program was written circa 1975-1985 for Soviet mainframe computers. Key characteristics:
- 2700+ lines of Pascal
- Sophisticated AI for its era
- Rich conversational personality
- Multi-user shared environment
- Persistent tournament system

### This Implementation
Created May 2026 as a modern C++ recreation:
- ~1500 lines of C++
- Maintains core AI algorithms
- Simplified architecture
- Portable across Unix-like systems
- Focus on single-player experience

## License

This implementation is inspired by the original BESM-6 Kalah program. The original program's authorship and licensing status from the 1970s-80s Soviet era are unknown.

This C++ recreation is provided for educational and recreational purposes.

## Credits

- Original Pascal implementation: Unknown author(s), circa 1975-1985
- C++ recreation: 2026
- Game rules: Ancient (believed to be 6th-7th century origins)

## References

- Original program: `kalah.pas` (BESM-6 Pascal dialect)
- Analysis: `comments.txt` (detailed program documentation)
- Kalah rules: https://en.wikipedia.org/wiki/Kalah
- Mancala family: https://en.wikipedia.org/wiki/Mancala

---

Enjoy the game! May the best strategist win! 🎮
