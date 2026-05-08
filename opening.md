# Opening Database (ДЕБЮТ) Format Analysis

## Overview

The original BESM-6 Pascal Kalah program includes a sophisticated pre-computed opening book database called "ДЕБЮТ" (Russian: "debut" or "opening"). This document describes the expected format and structure of this database.

## Storage Location

- **Zone address**: `(0, 400153C)` (octal)
- **Signature**: `'!ДЕБЮТ'` at word 35 (`bufptr@[35].a`)
- **Purpose**: Pre-computed opening theory for levels 3-4 (Participant and Master)
- **Used by**: Only difficulty levels 3 (Участник) and 4 (Эфенди)

## Database Structure

The database uses a **tree-indexed structure** where move sequences are encoded as indices into a compact data structure.

### Index Ranges

```pascal
if index > 8415 then 
  // End of database, no more theory
else if index > 1547 then
  word_index := index - 224
else
  word_index := index
```

**Key numbers:**
- `1547`: Boundary for direct vs adjusted indexing
- `8415`: Maximum moves in opening theory (approximately 14-15 moves deep)
- `224`: Offset adjustment for extended positions

### Data Encoding

#### Word Structure

Each word in the zone is divided into **8 sections of 6 bits each**:

```
Word (48 bits) = [sec7][sec6][sec5][sec4][sec3][sec2][sec1][sec0]
                  ↑                                           ↑
                 6 bits                                    6 bits
                 
Bit positions:    42    36    30    24    18    12     6     0
```

#### Section Calculation

```pascal
section_index := (7 - (word_index MOD 8)) * 6
mask := sel(bufptr@[word_index div 8], section_index, 6)
```

**Breakdown:**
- `word_index div 8`: Which word in the buffer
- `word_index MOD 8`: Which section within that word (0-7)
- `section_index * 6`: Bit position (0, 6, 12, 18, 24, 30, 36, 42)

#### Bitset Encoding

The 6-bit value represents a **bitset** of legal/good moves:

```
Bit 0 = Move 1 is good
Bit 1 = Move 2 is good
Bit 2 = Move 3 is good
Bit 3 = Move 4 is good
Bit 4 = Move 5 is good
Bit 5 = Move 6 is good
```

**Examples:**
- `000111B` (octal 7) = moves 1, 2, 3 are recommended
- `111111B` (octal 77) = all moves are legal/good
- `100000B` (octal 40) = only move 6 is recommended
- `010010B` (octal 22) = moves 2 and 5 are good

### Tree Navigation

#### Move to Index Mapping

The database represents a 6-ary tree where each move leads to a new position:

```pascal
new_index := current_index * 6 + move_number
```

Where:
- Current position has index `i`
- Playing move `m` (1-6) leads to position `i * 6 + m`
- This creates a **6-ary tree** (6 children per node)

#### Example Tree Structure

```
Position 0 (starting position)
  ├─ Move 1 → Index 1    (0*6 + 1)
  ├─ Move 2 → Index 2    (0*6 + 2)
  ├─ Move 3 → Index 3    (0*6 + 3)
  ├─ Move 4 → Index 4    (0*6 + 4)
  ├─ Move 5 → Index 5    (0*6 + 5)
  └─ Move 6 → Index 6    (0*6 + 6)

Position 1 (after opening with move 1)
  ├─ Move 1 → Index 7    (1*6 + 1)
  ├─ Move 2 → Index 8    (1*6 + 2)
  ├─ Move 3 → Index 9    (1*6 + 3)
  ├─ Move 4 → Index 10   (1*6 + 4)
  ├─ Move 5 → Index 11   (1*6 + 5)
  └─ Move 6 → Index 12   (1*6 + 6)

Position 2 (after opening with move 2)
  ├─ Move 1 → Index 13   (2*6 + 1)
  ├─ Move 2 → Index 14   (2*6 + 2)
  └─ ...

And so on...
```

#### Depth Calculation

```
Depth 0: Index 0 (1 position)
Depth 1: Indices 1-6 (6 positions)
Depth 2: Indices 7-42 (36 positions)
Depth 3: Indices 43-258 (216 positions)
Depth 4: Indices 259-1554 (1,296 positions)
...
Maximum: Index 8415 ≈ Depth 14-15
```

### Recursive Consultation Algorithm

The `consult()` function recursively explores the opening tree:

```pascal
function consult(pos: Position; index: integer): integer
begin
  if index > 8415 then 
    return 1;  // Beyond database, exit book
  
  // Calculate word and bit position
  if index > 1547 then
    word_idx := index - 224
  else
    word_idx := index;
  
  // Extract 6-bit move mask
  bit_pos := (7 - (word_idx MOD 8)) * 6;
  mask := extract_bits(buffer[word_idx div 8], bit_pos, 6);
  
  if mask = empty then
    error("Opening book corrupted");
  
  ret := 0;
  for each bit set in mask do
    move := bit_number - 41 + 1;  // Convert to pit (1-6)
    new_pos := make_move(pos, move);
    
    if move_result = EXTRA_TURN then
      ret := ret + 1;
    else
      ret := ret + consult(new_pos, index*6 + move);
      exit;  // Only explore first continuation
    end;
  end;
  
  return ret;
end;
```

### Move Encoding Detail

Moves in the bitset use an **offset of 41 (octal)**:

```pascal
move := minel(mask.s)      // Get bit position from set
mask.s := mask.s - [move]  // Remove from set
move := move - 41          // Convert to pit number (1-6)
```

**Bit to Move Mapping:**
```
Bit 41 (octal) → Pit 1
Bit 42 (octal) → Pit 2
Bit 43 (octal) → Pit 3
Bit 44 (octal) → Pit 4
Bit 45 (octal) → Pit 5
Bit 46 (octal) → Pit 6
```

This encoding scheme allows the bitset to use bits 41-46 (octal) = 33-38 (decimal) within a 48-bit word.

## Database Size Estimation

### Capacity Analysis

- **Maximum positions**: 8,415 indexed positions
- **Bits per position**: 6 bits
- **Positions per word**: 8 positions (48 bits / 6 bits)
- **Words needed**: `8415 / 8 ≈ 1,052 words` minimum
- **With signature and metadata**: Approximately 1,100-1,200 words
- **Total size**: ~4-5 KB in the zone

### Storage Efficiency

The database is highly space-efficient:
- **6 bits per position** (only need to store which moves are good)
- **No position evaluation scores** (binary: good/not recommended)
- **Tree structure implicit** (index-based, no pointers)
- **Compact packing**: 8 positions per 48-bit word

## Usage in Game

### When Opening Book is Used

The database is consulted only at difficulty levels 3-4:

```pascal
if l2v25z then  // Opening book enabled (levels 3-4)
  if l2v70z > 8415 then
    l2v25z := false;  // Exit opening book
    l2v28z := true;   // Enable corrections system instead
  else
    // Lookup position l2v70z in database
    moves := get_legal_moves_from_book(l2v70z);
    // Select from recommended moves
  end;
else
  // Use regular minimax search
end;
```

### Game Flow with Opening Book

```
1. Game starts (l2v70z = 0, l2v25z = true for levels 3-4)

2. AI's turn:
   - Check if l2v70z <= 8415
   - Look up bitset of good moves in database
   - Select from recommended moves
   - Update l2v70z := l2v70z * 6 + selected_move

3. User's turn:
   - User selects move
   - Update l2v70z := l2v70z * 6 + user_move

4. Continue until:
   - l2v70z > 8415 (exit book), OR
   - Position not in book (empty bitset), OR
   - Game reaches move ~14-15

5. After exiting book:
   - Switch to minimax search
   - Optionally enable correction system
```

### Move Selection from Book

When multiple moves are recommended:

```pascal
// Get all good moves from book
good_moves := extract_bitset(database[l2v70z]);

// Calculate weights for each move
for each move in good_moves do
  if move gives extra turn then
    // Recursively consult book for continuations
    weight[move] := consult(position, l2v70z * 6 + move);
  else
    weight[move] := 1;
  end;
end;

// Select move probabilistically based on weights
selected := weighted_random_choice(good_moves, weights);
```

## Error Checking and Validation

### Database Validation

The program performs several checks:

#### 1. Signature Verification

```pascal
readZone(0, 400153C);
if bufptr@[35].a <> '!ДЕБЮТ' then
  writeln('ИСПОРЧЕНЫ ДЕБЮТЫ - "ЧП" !!');
  abort;
end;
```

#### 2. Empty Bitset Check

```pascal
procedure assertOpenings(moves: bitset);
begin
  if moves = [] then
    writeln('"ЧП" ДЕБЮТОВ !!');
    abort;
  end;
end;
```

#### 3. Move Legality Check

```pascal
if move_result = INVALID then
  writeln('ПУСТАЯ ЛУНКА В ДЕБЮТАХ - "ЧП" !');
  writeln('ИСТОРИЯ ', l2v70z);
  abort;
end;
```

### Error Messages

- **`ИСПОРЧЕНЫ ДЕБЮТЫ`**: "Openings are corrupted" - signature mismatch
- **`"ЧП" ДЕБЮТОВ`**: "Emergency: openings!" - empty move set
- **`ПУСТАЯ ЛУНКА В ДЕБЮТАХ`**: "Empty pit in openings" - illegal move in book

## Creating an Opening Database

### Theoretical Approach

To create a compatible opening database:

1. **Generate Game Tree**
   - Start from initial position (index 0)
   - For each position, try all 6 moves
   - Track position index: `new_index = current_index * 6 + move`
   - Build tree up to depth ~14 or until index 8415

2. **Evaluate Positions**
   - Use minimax or Monte Carlo simulations
   - Determine which moves are "good" (above threshold)
   - Mark good moves in bitset (bits 0-5)

3. **Encode Database**
   - For each index 0-8415:
     - Calculate word: `index / 8`
     - Calculate section: `(7 - (index % 8)) * 6`
     - Store 6-bit bitset at that position
   - Add signature `'!ДЕБЮТ'` at word 35

4. **Write to Zone File**
   - Format as BESM-6 zone format
   - Include proper headers
   - Write to zone (0, 400153C)

### Practical Considerations

**Challenges:**
- BESM-6 zone file format is proprietary
- 48-bit word architecture is uncommon
- Octal numbering and bit manipulation
- No modern tools for BESM-6 format

**Modern Alternative:**
- Use similar tree structure in modern format
- Store in SQLite or binary file
- Keep 6-bit bitsets for compatibility
- Convert indices to 32/64-bit architecture

## Comparison with Modern Opening Books

### Traditional Opening Books (Chess)

| Feature | BESM-6 Kalah | Modern Chess |
|---------|--------------|--------------|
| **Structure** | 6-ary tree | Hash table |
| **Index** | Sequential | Position hash |
| **Moves stored** | Bitset (6 bits) | Full moves + scores |
| **Evaluation** | Binary (good/not) | Numeric scores |
| **Size** | ~5 KB | Megabytes to Gigabytes |
| **Access** | O(1) array lookup | O(1) hash lookup |
| **Depth** | 14-15 moves | 20-30+ moves |

### Advantages of This Format

✅ **Extremely compact**: 6 bits per position
✅ **Fast access**: Direct array indexing
✅ **Simple structure**: Easy to navigate
✅ **Efficient for 6-move games**: Perfect for Kalah
✅ **No collisions**: Tree structure ensures unique paths

### Limitations

❌ **Fixed structure**: Can't handle transpositions
❌ **No move ordering**: All good moves equal weight
❌ **No evaluation scores**: Binary good/not-good
❌ **Limited depth**: ~14 moves vs modern 30+
❌ **Linear growth**: 6^n positions per depth

## Implementation Notes

### In C++ Recreation

The C++ version of Kalah **does not implement** the opening book because:

1. **Format complexity**: BESM-6 zone files are platform-specific
2. **Generation effort**: Creating the book requires extensive analysis
3. **Playability**: The minimax AI is already strong enough
4. **Portability**: Would require binary format or large data files

### Potential Modern Implementation

To add opening book support:

```cpp
class OpeningBook {
    std::vector<uint8_t> moves; // 6 bits per position
    
    uint8_t lookup(int index) {
        if (index > 8415) return 0;
        int word = (index > 1547) ? index - 224 : index;
        int byte_pos = word / 8;
        int bit_pos = (7 - (word % 8)) * 6;
        // Extract 6 bits from byte_pos at bit_pos
        return extract_bits(moves[byte_pos], bit_pos, 6);
    }
    
    std::vector<int> getGoodMoves(int index) {
        uint8_t mask = lookup(index);
        std::vector<int> moves;
        for (int i = 0; i < 6; i++) {
            if (mask & (1 << i)) {
                moves.push_back(i + 1);
            }
        }
        return moves;
    }
};
```

## Historical Context

This opening book format demonstrates:

- **1970s optimization techniques**: Bit-packing for minimal storage
- **Mainframe constraints**: Every byte mattered
- **Chess influence**: Similar to early chess opening books
- **Sophisticated design**: Well-thought-out tree indexing
- **Practical approach**: Binary classification instead of complex evaluation

The format is a clever solution for the limited memory and storage of 1970s mainframe systems, while still providing strong opening play.

## References

### Code Locations in kalah.pas

- **Database loading**: Lines 2234-2240
- **Consultation logic**: Lines 1211-1240 (`consult` function)
- **Move extraction**: Lines 1260-1272 (in `F5206`)
- **Move selection**: Lines 1294-1313
- **Error checking**: Lines 1203-1209, 1301-1304

### Related Documentation

- `comments.txt`: General program analysis
- `PROJECT_SUMMARY.md`: Implementation comparison
- `README.md`: Game overview

---

**Note**: This analysis is based on reverse engineering the Pascal source code. The actual database file format and content were not available for examination.
