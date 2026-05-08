# Kalah Quick Start Guide

## Installation in 3 Steps

```bash
# 1. Install dependencies (Ubuntu/Debian)
sudo apt-get install g++ libncurses5-dev

# 2. Build
make

# 3. Run
./kalah
```

## First Game

1. **Welcome Screen**: Press any key
2. **Enter Name**: Type your name, press Enter
3. **Gender**: Select 1 (Male), 2 (Female), or 3 (No preference)
4. **Difficulty**: Select 1-4
   - 1 = Easy (Novice)
   - 2 = Medium (Candidate)
   - 3 = Hard (Participant)
   - 4 = Expert (Master)

## How to Play

### The Board
```
        DJINN
     6   5   4   3   2   1
   (6) (6) (6) (6) (6) (6)
[0]                       [0]   <- Kalahs (stores)
   (6) (6) (6) (6) (6) (6)
     1   2   3   4   5   6
        PLAYER
```

### Basic Rules

1. **Your Turn**: Type a number 1-6 to select a pit
2. **Distribution**: Stones move counter-clockwise, one per pit
3. **Extra Turn**: Landing in your Kalah gives another turn
4. **Capture**: Landing in your empty pit captures opposite stones
5. **Game End**: When one side is empty
6. **Winner**: Most stones in Kalah wins

### Controls During Game

- **1-6**: Select pit to play
- **h**: Show help
- **q**: Quit (with confirmation)

## Strategy Tips

### Beginners
1. Try to land in your Kalah for extra turns
2. Count stones to see which pits reach your Kalah
3. Don't leave single stones opposite opponent's stones

### Intermediate
1. Create empty pits to setup captures
2. Force opponent to give you extra turns
3. Control the endgame - make opponent empty first

### Advanced
1. Look 2-3 moves ahead
2. Calculate total stones remaining
3. Position stones for maximum captures
4. Use extra turns to chain multiple moves

## Example First Move

```
Initial board:
   (6) (6) (6) (6) (6) (6)
[0]                       [0]
   (6) (6) (6) (6) (6) (6)
    1   2   3   4   5   6

You play: 1
Result:
   (6) (6) (6) (6) (6) (7)  <- Djinn got one stone
[0]                       [1]  <- You got one stone (Kalah)
   (0) (7) (7) (7) (7) (7)
    1   2   3   4   5   6

You get extra turn because you landed in Kalah!
```

## Difficulty Levels Explained

### Level 1: Novice
- **Search depth**: 2 moves ahead
- **Playstyle**: Makes basic moves, occasional mistakes
- **Good for**: Learning the rules

### Level 2: Candidate
- **Search depth**: 2 moves ahead
- **Playstyle**: Consistent, avoids bad moves
- **Good for**: Practicing strategy

### Level 3: Participant
- **Search depth**: 4 moves ahead
- **Playstyle**: Strategic, plans captures
- **Good for**: Competitive games

### Level 4: Master
- **Search depth**: 4 moves ahead
- **Playstyle**: Near-optimal, tough to beat
- **Good for**: Expert challenge

## Winning Your First Game

### Against Novice (Level 1)

1. **Move 1**: Play pit 3 or 4 to practice
2. **Look for**: Moves that land in your Kalah
3. **Avoid**: Leaving single stones
4. **Strategy**: Extra turns are your friend!

### Sample Winning Strategy

```
Early game: Focus on extra turns
- Play pits that land in Kalah (count stones)
- Build up your Kalah score

Mid game: Setup captures
- Create empty pits
- Position stones for big captures

End game: Control the finish
- Count remaining stones
- Force opponent to empty first
- Secure the win!
```

## Common Mistakes

### Don't Do This:
❌ Playing random pits without counting
❌ Ignoring extra turn opportunities
❌ Not looking at opponent's threats
❌ Giving opponent easy captures

### Do This Instead:
✅ Count stones before each move
✅ Always check for Kalah moves
✅ Look at opponent's empty pits
✅ Plan 2-3 moves ahead

## Quick Reference

| Action | Command |
|--------|---------|
| Select pit | 1-6 |
| Help | h |
| Quit | q |
| Confirm | y |
| Deny | n |

## Scoring

- **Win**: +1 to your score
- **Loss**: +1 to Djinn's score
- **Draw**: No points

Play multiple games to see who's the better player!

## Terminal Tips

- **Larger is better**: 80x24 minimum, bigger is nicer
- **Colors**: Use a terminal with color support
- **Font**: Monospace font works best
- **Stuck?**: Press Ctrl+C to force quit, then type `reset`

## Next Steps

1. Win your first game at Novice level
2. Move up to Candidate level
3. Try to beat Participant level
4. Challenge Master level
5. Read README.md for advanced strategies

## Getting Help

During game:
- Press **h** for in-game help
- Check README.md for detailed rules
- Check BUILDING.md if game won't compile

Have fun playing Kalah! 🎮
