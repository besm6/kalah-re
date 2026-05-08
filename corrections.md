# Corrections Database (КОРРЕКЦИИ) Format Analysis

## Overview

The original BESM-6 Pascal Kalah program includes a learning system called "КОРРЕКЦИИ" (Russian: "corrections"). This adaptive system stores adjustments to the AI's move selection based on game outcomes, allowing the program to learn from past games and improve its play over time.

## Storage Location

- **Zone address**: `(0, 660635C)` (octal)
- **Signature**: `'!СОRR!'` at word 0 (`bufptr@[0].a`)
- **Purpose**: Store move corrections learned from gameplay
- **Usage**: Activated after exiting opening book (move 15+) or when opening book not available

## When Corrections Are Used

### Activation Conditions

The corrections system is enabled when:

1. **After opening book exhausted**: When game position index exceeds 8415
   ```pascal
   if l2v70z > 8415 then
     l2v25z := false;  // Disable opening book
     l2v28z := true;   // Enable corrections
   ```

2. **When opening book not available**: For levels 1-2 (Novice, Candidate)
   ```pascal
   if level < 3 then
     l2v25z := false;
     l2v28z := true;
   ```

3. **During move selection**: Only for first 15-17 moves (while `l2v66z < 17C`)
   ```pascal
   if l2v28z and (l2v66z < 17C) then
     nextMove := correction(nextMove);
   ```

### Tracking Variables

- **`l2v28z`**: Boolean flag indicating corrections are enabled
- **`l2v66z`**: Current move number (ply) in the game (0-16)
- **`l2v67z`**: Start index for binary search in database
- **`l2v68z`**: End index for binary search in database
- **`l2v71z`**: Position signature (15-bit hash of move sequence)

## Database Structure

### Header Format

```
Word 0: Signature '!СОRR!' (6 characters)
Word 1: Number of entries (integer)
Word 2..N: Correction entries (one per word)
```

### Entry Format (48-bit word)

Each correction entry encodes:
- **Position signature** (15 bits): Identifies the game position
- **Move corrections** (16 × 3 = 48 bits total): Correction for each ply
- **Usage counter** (3 bits): How many times this correction was applied

#### Bit Layout

```
Bits 0-2:   Move 16 correction (3 bits)
Bits 3-5:   Move 15 correction (3 bits)
Bits 6-8:   Move 14 correction (3 bits)
Bits 9-11:  Move 13 correction (3 bits)
Bits 12-14: Move 12 correction (3 bits)
Bits 15-17: Move 11 correction (3 bits)
Bits 18-20: Move 10 correction (3 bits)
Bits 21-23: Move 9 correction (3 bits)
Bits 24-26: Move 8 correction (3 bits)
Bits 27-29: Move 7 correction (3 bits)
Bits 30-44: Position signature (15 bits)
Bits 45-47: Usage counter (3 bits)
```

### Position Signature Calculation

The position signature is a 15-bit hash of the move sequence:

```pascal
l2v71z := 0;  // Initialize

// For each move (up to first 6 moves):
if l2v66z < 6 then
  l2v71z := (l2v71z * 8) + nextMove;

// Result: 15-bit value (up to 2^15 = 32768 unique positions)
```

**Encoding:**
- Each move (1-6) is represented by 3 bits
- Up to 5 moves can be stored: 5 × 3 = 15 bits
- Calculation: `signature = ((...((m1 * 8 + m2) * 8 + m3) * 8 + m4) * 8 + m5)`

**Example:**
```
Move sequence: 3, 1, 4, 2
Signature = (((3 * 8 + 1) * 8 + 4) * 8 + 2)
          = ((25 * 8 + 4) * 8 + 2)
          = (204 * 8 + 2)
          = 1634 (decimal) = 3142 (octal)
```

## Correction Algorithm

### The `correction()` Function

```pascal
function correction(original_move: integer): integer
var
  start_idx, end_idx, bit_pos: integer;
  entry_ptr: pointer;
begin
  correction := original_move;  // Default: no change
  
  // Calculate bit position for current move number
  bit_pos := (15 - move_number) * 3;
  
  // Load database if not already loaded
  if not_loaded then
    readZone(0, 660635C);
    verify_signature('!СОRR!');
    start_idx := 2;
    end_idx := bufptr[1].i;  // Number of entries
  end;
  
  // Binary search: narrow down by position signature (bits 30-44)
  for i := start_idx to end_idx do
    if extract_bits(bufptr[i], 30, 15) = position_sig then
      start_idx := i;
      exit loop;
    else
      start_idx := i + 1;
  end;
  
  for i := end_idx downto start_idx do
    if extract_bits(bufptr[i], 30, 15) = position_sig then
      end_idx := i;
      exit loop;
    else
      end_idx := i - 1;
  end;
  
  // Binary search: narrow down by move at current ply (3 bits)
  for i := start_idx to end_idx do
    if extract_bits(bufptr[i], bit_pos, 3) = original_move then
      start_idx := i;
      exit loop;
    else
      start_idx := i + 1;
  end;
  
  for i := end_idx downto start_idx do
    if extract_bits(bufptr[i], bit_pos, 3) = original_move then
      end_idx := i;
      exit loop;
    else
      end_idx := i - 1;
  end;
  
  // No matching entry found
  if start_idx > end_idx then
    disable_corrections();
    return original_move;
  end;
  
  // Exact match found
  if start_idx = end_idx then
    entry_ptr := @bufptr[start_idx];
    
    // Check if should apply correction:
    // - Always at move 16 (0x16 octal = 14 decimal)
    // - Or if previous move corrections are unused (0)
    if (move_number = 16) or (extract_bits(entry, bit_pos - 3, 3) = 0) then
      // Apply correction
      correction := entry mod 8;  // Corrected move (0-7, use 1-6)
      
      // Update usage counter
      counter := shift_right(entry, 45) + 1;  // Bits 45-47
      if counter < 8 then  // Max 7 uses
        insert_bits(entry, counter, 45, 3);
        writeZone(0, 660635C);  // Save updated database
      end;
    end;
  end;
end;
```

### Key Algorithm Features

1. **Two-level binary search**:
   - First level: Find entries matching position signature (15 bits)
   - Second level: Find entries matching original move at current ply (3 bits)

2. **Selective application**:
   - Only applies correction at move 16 (late game)
   - Or if earlier move's correction slot is empty (value 0)
   - This prevents cascading corrections

3. **Usage tracking**:
   - Each applied correction increments 3-bit counter (0-7)
   - After 7 uses, no further updates (counter saturates)

4. **Disable on miss**:
   - If no matching entry found, disables corrections for rest of game
   - Avoids repeated expensive searches

## Database Entry Creation

### When Entries Are Created

Entries would be created (though creation code not visible in provided source):

1. **After game completion**: Analyze game to identify critical positions
2. **Loss analysis**: Find moves that led to losing positions
3. **Win analysis**: Reinforce moves that led to winning positions
4. **Pattern recognition**: Identify recurring position types

### Entry Generation Process

Hypothetical creation algorithm:

```pascal
procedure add_correction(move_sequence: array, ply: integer, 
                        bad_move: integer, good_move: integer)
begin
  // Calculate position signature from first 5 moves
  signature := calculate_signature(move_sequence[0..4]);
  
  // Create new entry
  entry := 0;
  insert_bits(entry, signature, 30, 15);
  
  // Set correction at specific ply
  bit_pos := (15 - ply) * 3;
  insert_bits(entry, good_move, bit_pos, 3);
  
  // Initialize usage counter to 0
  insert_bits(entry, 0, 45, 3);
  
  // Add to database
  append_entry(entry);
  
  // Sort database by position signature for binary search
  sort_database();
end;
```

## Move Encoding

### 3-Bit Move Representation

Moves are encoded as 3-bit values (0-7):

```
000 (0) = Not set / no correction
001 (1) = Move pit 1
010 (2) = Move pit 2
011 (3) = Move pit 3
100 (4) = Move pit 4
101 (5) = Move pit 5
110 (6) = Move pit 6
111 (7) = Invalid / special marker
```

The corrected move is extracted via `entry mod 8`, which gets the lowest 3 bits.

## Database Size Estimation

### Capacity

- **Maximum entries**: Limited by zone size (typically ~1024 words)
- **Entries per position**: Multiple entries for different move sequences
- **Total positions**: Up to 2^15 = 32,768 unique signatures
- **Effective capacity**: ~1,000-2,000 correction entries

### Storage Efficiency

Each entry stores:
- 1 position signature (15 bits)
- 16 move corrections (16 × 3 = 48 bits, shared with signature)
- 1 usage counter (3 bits)

Total: **48 bits per entry** (1 word)

This is extremely space-efficient:
- Can store corrections for 1,000+ critical positions
- Each position can have corrections for all 16 plies
- Minimal overhead

## Usage Example

### Game Flow with Corrections

```
Game starts:
  move_number = 0
  position_sig = 0
  corrections_enabled = false (using opening book)

Move 1: User plays pit 3
  position_sig = 3
  
Move 2: AI exits opening book at index 8420
  corrections_enabled = true
  
Move 3: AI selects move 4 from minimax
  Calls correction(4):
    - Search for entries with signature=3
    - Search for entry with move=4 at ply=2
    - If found: return corrected move (e.g., 2)
    - If not found: return original move (4)
    
  AI plays corrected move (2 or 4)
  Update signature: position_sig = 3 * 8 + 2 = 26

Continue for moves 4-16...
  Each move checks corrections database
  Corrections gradually adjust AI behavior
  
Move 17+: Corrections disabled (beyond ply 16)
  Only minimax used
```

## Error Handling and Validation

### Database Integrity Checks

1. **Signature verification**:
   ```pascal
   if bufptr@[0].a <> '!СОRR!' then
     writeln('"ЧП" - ИСПОРЧЕНЫ КОРРЕКЦИИ');
     abort;
   ```

2. **Entry count validation**:
   ```pascal
   num_entries := bufptr@[1].i;
   if num_entries < 0 or num_entries > 1023 then
     error;
   ```

3. **Binary search bounds**:
   - Checks that `start_idx <= end_idx`
   - If violated, disables corrections

### Error Messages

- **`"ЧП" - ИСПОРЧЕНЫ КОРРЕКЦИИ`**: "Emergency - corrupted corrections"
  - Triggered when signature check fails
  - Database is invalid or not initialized

## Comparison with Modern Techniques

### Traditional Approach (BESM-6 Corrections)

| Feature | Implementation |
|---------|----------------|
| **Learning** | Offline, pre-computed |
| **Storage** | Compact binary format |
| **Lookup** | Binary search O(log n) |
| **Granularity** | Per-ply, per-position |
| **Adaptivity** | Static after creation |
| **Size** | ~1KB for 1000 entries |

### Modern Alternatives

#### 1. Transposition Tables
```cpp
struct TTEntry {
    uint64_t hash;      // Zobrist hash
    int16_t eval;       // Position evaluation
    int8_t depth;       // Search depth
    int8_t move;        // Best move
    uint8_t flags;      // Bound type
};
```
- **Advantage**: Dynamic, updated during search
- **Disadvantage**: Larger memory footprint

#### 2. Neural Networks
```python
def evaluate_position(position):
    features = extract_features(position)
    return neural_net.forward(features)
```
- **Advantage**: Learns complex patterns
- **Disadvantage**: Requires training data and compute

#### 3. Opening Books (Modern)
```cpp
struct BookEntry {
    uint64_t position_hash;
    std::vector<ScoredMove> moves;
    int games_played;
    float win_rate;
};
```
- **Advantage**: Rich statistics
- **Disadvantage**: Much larger storage

## Advantages of This Format

✅ **Extremely compact**: 48 bits per correction entry
✅ **Fast lookup**: Binary search O(log n)
✅ **Position-specific**: Different corrections for different positions
✅ **Ply-aware**: Different corrections for different move numbers
✅ **Usage tracking**: Knows which corrections are effective
✅ **Selective application**: Doesn't over-correct

## Limitations

❌ **Static**: Created offline, doesn't learn during play
❌ **Limited positions**: Only 32,768 unique signatures
❌ **Collision risk**: Multiple positions may have same signature
❌ **Shallow history**: Only considers first 5 moves
❌ **Binary nature**: Suggests one alternative, no confidence score
❌ **Hard to create**: Requires post-game analysis tooling

## Implementation Notes

### In C++ Recreation

The C++ version **does not implement** the corrections system because:

1. **No training data**: Would need database of analyzed games
2. **Complexity**: Requires game analysis and correction generation
3. **Questionable benefit**: Modern minimax is already strong
4. **Format specificity**: BESM-6 zone format not portable

### Potential Modern Implementation

To add corrections support in C++:

```cpp
struct CorrectionEntry {
    uint16_t position_sig;           // 15 bits
    std::array<uint8_t, 16> moves;   // 3 bits each, stored as bytes
    uint8_t usage_count;             // 3 bits
};

class CorrectionsDB {
    std::vector<CorrectionEntry> entries;
    
public:
    void load(const std::string& filename) {
        // Parse binary format
        // Sort by position_sig for binary search
    }
    
    std::optional<int> getCorrection(
        uint16_t position_sig, 
        int ply, 
        int original_move
    ) {
        // Binary search for position_sig
        auto range = std::equal_range(
            entries.begin(), entries.end(), position_sig,
            [](const auto& e, auto sig) { 
                return e.position_sig < sig; 
            }
        );
        
        // Linear search within range for matching move
        for (auto it = range.first; it != range.second; ++it) {
            if (it->moves[ply] == original_move) {
                return it->moves[ply];  // Return correction
            }
        }
        
        return std::nullopt;  // No correction found
    }
};
```

## Creating a Corrections Database

### Hypothetical Workflow

1. **Play many games** (1000+) at various skill levels

2. **Analyze losses**:
   ```
   For each losing game:
     - Identify critical mistakes (large eval drops)
     - Find better moves via deeper search
     - Record: position_sig, ply, bad_move, good_move
   ```

3. **Analyze wins**:
   ```
   For each winning game:
     - Identify key winning moves
     - Reinforce: position_sig, ply, good_move
   ```

4. **Generate entries**:
   ```
   For each correction:
     - Calculate 15-bit position signature
     - Set 3-bit move correction at appropriate ply
     - Initialize usage counter to 0
   ```

5. **Optimize database**:
   ```
   - Remove redundant entries
   - Merge entries for same position
   - Sort by position signature
   - Write to zone file format
   ```

6. **Test effectiveness**:
   ```
   - Play with corrections enabled
   - Measure win rate improvement
   - Iterate if needed
   ```

## Historical Significance

This corrections system demonstrates:

1. **Early machine learning**: Learning from past games (1970s!)
2. **Resource optimization**: Minimal storage for maximum impact
3. **Practical AI**: Augments search with experience
4. **Offline learning**: Pre-computed corrections, no runtime cost
5. **Hybrid approach**: Combines search (minimax) with learning (corrections)

The system is sophisticated for its era, showing that Soviet computer scientists were exploring adaptive AI techniques decades before modern machine learning became mainstream.

## References

### Code Locations in kalah.pas

- **Correction function**: Lines 1396-1458
- **Activation logic**: Lines 1260-1264, 2587-2590
- **Application**: Lines 2566-2567
- **Signature calculation**: Lines 2585-2586
- **Move tracking**: Line 2594 (`l2v66z` increment)

### Related Documentation

- `opening.md`: Opening book database format
- `comments.txt`: General program analysis
- `PROJECT_SUMMARY.md`: Implementation comparison

---

**Note**: This analysis is based on reverse engineering the Pascal source code. The actual corrections database creation process and optimal correction values were not available for examination.
