(*=p-,t-,l+,Д+*)_program КАЛАХ;
_label 12561, 12566, 12633, 12636;
_const list = 64000B; jinn = 0; user = 1;
nu = 66B; z236 = 2400236B; zoneSchedule = 1005B; zonePlayers = 1013B;
z730 = 1660730B; zoneOpeningBook = 400153B; zoneCorrections = 660635B; zoneLog = 1012B;
logStartZone = 660600B; logEndZone = 660611B; friday = 4; c5 = 5; c25 = 25;
charEtx = '{377'; userEntryLen = 62; c1008 = 1008; space = ' '; dot = '.';
c13 = 13; c10 = 10; c11 = 11; lf = '{214'; cr = '{175'; c212 = 21;
spaces = '      '; arrow = ' =++> '; adminId = '417700'; sleep = 'sle   ';
fin = '(FIN){175'; colon = ':'; oparen = '('; cparen = ')'; excl = '!'; qmark = '?';
c49 = 49; c45 = 45; c47 = 47; c36 = 36; c50 = 50; femEnding = 'A'; c61 = 61;
K = 'K'; c51 = 51; c60 = 60; z = 'z'; c9 = 9; e10p1 = 1777B; c6 = 6;
c7 = 7; c2 = 2; c12=12; c30=30; c39=39;
UNKSEX = 0; MASC = 1; FEM = 2;
_type
bitset = _set _of 0..47;
letter = 'a' .. 'z';
digit = '0' .. '9';
sixchars = _array[1..6] _of char;
word = _record _case integer _of
0:(i:integer);
1:(c:char);
2:(b:boolean);
5:(a:alfa);
7:(s:bitset)
_end;
zone = _array [0..1023] _of word;
largeset = _array [0..5] _of bitset;
SlotRec = _record i:integer;
  ls:largeset;
  date, expires: integer;
  log: _array [1..12] _of alfa
_end;
player = integer;
contents = _record val:integer _end;
OneSide = _record move:word; pits:_array [1..7] _of contents _end;
gndr = integer;
Region = _record
  userId:integer;
  tempSet:bitset;
  u2,u3,u4,u5,u6,u7,timeoutTicks:integer;
  userBirthDate,unknData,userAccount:alfa;
  userGender:gndr;
  permFlags,unknFlags:bitset;
  systemFlags:bitset;
  u16,u17:word;
  echo:boolean;
  u19,u20,u21:integer;
  statsArray:_array [0..7] _of integer;
  unused:_array [0..31] _of integer
_end;

_var
gl10z,
commandEntered, tambov:alfa;
gl13z,gl14z,cursorCol,logIndex,charIndex:integer;gameActive,isNightTime,isAdmin, cmdResult:boolean;
startRemTime,startWallClock,statVal,statVersion,msDelay,animSpeed,animDelay:integer;zoneBuffer:@zone;
userName:sixchars;
curLogWord:sixchars;
logPacked:_array [1..30] _of alfa;
userData:Region;
INP:text;gl420z:integer;
_function remainingCPUTime:integer;
_( code(Э0634=,); remainingCPUTime := ; _);

_function wallClockTicks:integer;
_( code(Э05310=,); wallClockTicks := ; _);
_procedure unused; _( code(=14ПВ76255,) _);
_procedure writeJinnName;
_( write('ДЖИН ') _);

_procedure writeUserName;
_var i:integer;
_(
 _for i := 1 _to 5 _do write(userName[i]);
_);

_procedure readTerminalInput(top:boolean);
_label 1570;
_var v1, v2: integer;
_(
  _if top _then  BIND(' ==* {172') _else  BIND(' =-* {172');
  _if userData.echo _then  _(
    code(СЧ76013=УИ7,);
    v1 := 2;
    code(ЗЧ76013=,);
    _if top _then write(' ==* ') _else write(' =-* ');
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> charEtx _do _(
    _if userData.echo _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      rewrite(INP);
      gameActive := false;
      write(INP,'SLЕ  {377');
      userData.systemFlags := userData.systemFlags + [47];
      _goto 1570
    _);
    write(INP,input@);
    get(input);
  _); (* while *)
  write(INP, charEtx);
  1570:
  reset(INP);
  _if userData.echo _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _)
_);

_function checkRemainingTime:boolean;
_var remTime:integer;
_(
  checkRemainingTime := false;
  code(Э0634=,);
  remTime := ;
  _if userData.timeoutTicks - remTime < 120 _then _(
    rewrite(output);
    rewrite(INP);
    writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
    gameActive := false;
    write(INP,'КОН  {377');
    checkRemainingTime := true;
    exit
  _)
_);
_procedure checkNegativeResponse;
_var resp:alfa;
_(
  writeLN;
  code(сч77015=); resp := ;
 _if resp = 'Н{3770000' _then _GOTO 12561;
_);

_function getDigit(i:integer):integer;
_( code(=14ПВ77463,) _);

_procedure updateStatistics(index:integer);
_var currentValue, increment, divisor, tempValue:integer;
_(
  currentValue := userData.statsArray[index];
  tempValue := ;
  currentValue := sel(tempValue, 24, 6) + statVal;
  code(СД/6/=2ЗЧ5,МР=СД/-6/,МР=2ЗЧ4,);
  ins(tempValue, currentValue, 24, 6);
  userData.statsArray[index] := ;
  _if increment > 0 _then _(
    statVal := increment;
    updateStatistics(index - 1);
    statVal := 1;
  _);
  _if statVersion = 1 _then _(
    divisor := 36;
  _) _else _(
    divisor := 22;
  _);
  _if (index <= divisor) _and (index > 0) _then updateStatistics(0);
_);

_function getTimeStr:alfa;
_var tickCount, tensDigit:integer;
timeChars:sixchars; packedTime:alfa;
_(
  code(Э05310=,);
  tickCount := ;
  tickCount := tickCount _div 3000;
  timeChars[1] := ' ';
  timeChars[4] := '.';
  tensDigit := tickCount _div 600;
  timeChars[2] := ;
  (*=m-*)
  tickCount := tickCount - tensDigit * 600;
  tensDigit := tickCount _div 60;
  timeChars[3] := ;
  tickCount := tickCount - tensDigit * 60;
  tensDigit := tickCount _div 10;
  timeChars[5] := ;
  timeChars[6] := chr(tickCount - tensDigit * 10);
  pck(timeChars[1], packedTime);
  getTimeStr := packedTime;
_);

_procedure printDecimal(a:integer);
_var v:integer;
_(
  v := trunc(a/10); write(v:1, (a - v*10):1);
  _);

_procedure readDiskZone(a, b: integer);
_( code(=14ПВ77451,) _);

_procedure writeDiskZone(a, b: integer);
_( code(=14ПВ77457,) _);

_procedure lockZone66;
_var i:integer;
_(
  i := nu;
  code(СД/-14/=Э050105,Э050115=,)
_);
_procedure unlockZone66;
_var i:integer;
_(
  i := nu;
  code(СД/-14/=Э050105,Э050116=,)
_);

_function extractMinElement(_var a1: integer; _var a2: bitset):boolean;
_(
  _if a2 = [] _then extractMinElement := false _else _(
    a1 := minel(a2);
    a2 := a2 - [a1];
    extractMinElement := true;
  _)
_);

_procedure clearLargeSet(_var a: largeset);
_var i: integer;
_(
  _for i := 0 _to 5 _do _(
    a[i] := [];
  _)
_);

_procedure addToLargeSet(a1: integer; _var a2: largeset);
_var i:integer;
_(
  i := a1 _div 48;
  a2[i] := a2[i] + [a1-i*48];
_);

_function isInLargeSet(a1: integer; _var a2: largeset):boolean;
_var i:integer;
_(
  i := a1 _div 48;
  isInLargeSet := (a1-i*48) _in a2[i];
_);


_function getDateStr: alfa;
_var k:integer;l:alfa;
_(
  k:=00003777776Т;l:='3 1   ';
  СОDЕ(Э050114=,2СБ4=2РБ5,СД120=2ЗЧ4,МР=СД70,2ЗЧ5=МР,2СМ5=СД140,17ЛС=2СМ4,СД60=17ЛС,2ЗЧ3=)
_);

_function dateStringToInt(a:alfa):integer;
_type date = _record d10, d1, m10, m1, y10, y1: integer _end;
_var datePtr:@date; dateChars:sixchars;
_(
  unpck(dateChars[1], a);
  datePtr := ref(dateChars);
  _with datePtr@ _do dateStringToInt := ((y10 * 10 + y1) * 100 + m10 * 10 + m1) * 100 + d10 * 10 + d1;
_);

_function getDaysInt:integer;
_(
  getDaysInt := dateStringToInt(   getDateStr  );
_);

_function julianDate(d, m, y:integer):integer;
_var v1:integer; v2: integer;
_(
  code(2СЧ5=УИ7,ТУТ:7ПБТУТ=,);
  code(7ПА0=ПБВЫХ,);
  code(7ПА37=ПБВЫХ,);
  code(7ПА73=ПБВЫХ,);
  code(7ПА132=ПБВЫХ,);
  code(7ПА170=ПБВЫХ,);
  code(7ПА227=ПБВЫХ,);
  code(7ПА265=ПБВЫХ,);
  code(7ПА324=ПБВЫХ,);
  code(7ПА363=ПБВЫХ,);
  code(7ПА421=ПБВЫХ,);
  code(7ПА460=ПБВЫХ,);
  code(7ПА516=,ВЫХ:ВИ7=);
  v1 := ;
  v2 := ord((y _mod 4 = 0) _and (m > 2));
  julianDate := (y-1) * 365 + (y-1) _div 4 + v2 + v1 + d;
_);

_function dateToEpochDays(a: integer):integer;
_var y, m, d:integer;
_(
 y := a _DIV 10000;
 a := a _MOD 10000;
 m := a _DIV 100;
 d := a _MOD 100;
 dateToEpochDays :=   julianDate( d, m, y );
_);

_function epochDaysToDate(a:integer):integer;
_var v1, v2, v3: integer; v4:boolean;
_(
  a := a - 1;
 v3 := (a _DIV 1461) * 4  + 1;
 a := a _MOD 1461;
 v2 := a _DIV 365;
 a := a _MOD 365 + 1;
 _if v2 = 4 _then _(
   v2 := 3;
   a := 366;
 _);

 _if v2 = 3 _then v4 := true _else v4 := false;

 v3 := v3 + v2;

 _if (a = 60) _and v4 _then _(
 v2 := 2;
 v1 := 35C;
  _) _else _(
 _if (a > 60) _and  v4 _then a := a - 1;

  _select
  a > 334: _(v2 := 12; v1 := 334; _);
  a > 304: _(v2 := 11; v1 := 304; _);
  a > 273: _(v2 := 10; v1 := 273; _);
  a > 243: _(v2 := 9;  v1 := 243; _);
  a > 212: _(v2 := 8;  v1 := 212; _);
  a > 181: _(v2 := 7;  v1 := 181; _);
  a > 151: _(v2 := 6;  v1 := 151; _);
  a > 120: _(v2 := 5;  v1 := 120; _);
  a > 90 : _(v2 := 4;  v1 := 90; _);
  a > 59 : _(v2 := 3;  v1 := 59; _);
  a > 31 : _(v2 := 2;  v1 := 31; _);
  true   : _(v2 := 1;  v1 := 0; _)
  _end;
  v1 := a - v1;
  _);
  epochDaysToDate := (v3 * 100 + v2) * 100 + v1;
_);

_function addDaysToDate(date, days:integer):integer;
_(
  addDaysToDate := epochDaysToDate( dateToEpochDays(date) + days );
_);

_function dayOfWeek(day, month, year:integer):integer;
_(
 _if month < 3 _then year := year - 1;
 month := month + 9;
 _if month > 11 _then month := month - 12;
 month := month + 1;
 dayOfWeek := (day + year + year _div 4 + (13 * month - 1) _DIV 5 - 28) _MOD 7;
_);

_procedure checkGameSchedule;
_label 1, 2;
_var hour, halfHour, day, month, year:integer;
alfaTime:alfa;
time:sixchars;
isOpen:bitset;
_(
  _if 32 _IN userData.permFlags _then _( userData.permFlags := userData.permFlags - [32]; exit _);
  _if userData.tempSet * [3] = [3] _then exit;

  _if 26 _IN userData.systemFlags _then _(
1:
    writeln('КАЛАХ ЗАКРЫТ');
    _GOTO 12561;
  _);
  _if userData.tempSet * [2] = [2] _then _(
    write('ДЛЯ ВАС '); _goto 1;
  _);
  _if 30 _IN userData.permFlags _then _(
    writeln('БОЛЬШЕ ИГРАТЬ НЕ БУДУ.');
    _goto 2
  _);
  day := getDaysInt;
  year := day _DIV 10000;
  day := day - year * 10000;
  month := day _DIV 100;
  day := day - month * 100;
  _if dayOfWeek( day, month, year) > friday _then exit;
  readDiskZone( nu, zoneSchedule );
  isOpen := zoneBuffer@[5].s;
  alfaTime :=   getTimeStr;
  unpck(time[1], alfaTime);
  halfHour := (ord(time[2]) * 10 + ord(time[3])) * 2 + (ord(time[5]) * 10 + ord(time[6])) _DIV 30;
  _if _not (halfHour _IN isOpen) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      halfHour := halfHour + 1;
      _if halfHour _IN isOpen _then _(
        write('ОТКРОЕТСЯ В ');
        hour := halfHour _div 2;
        halfHour := (halfHour - hour * 2) * 30;
        printDecimal( hour );
        write(dot);
        printDecimal( halfHour );
        writeln(' - СЕЙЧАС', getTimeStr);
2:
        rewrite(INP);
        write(INP,'ВЫХ  {377');
        gameActive := false;
        _GOTO 12633;
      _);
    _until halfHour >= 47;
    writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
    _goto 2
  _);
  isNightTime := (halfHour < 13) _or (halfHour > 41); (* < 6:30 or > 20:30 *)
_);

_function readCommand(_var a:alfa; b:integer):boolean;
_var l:_array[1..7] _of word;
_( code(=14ПВ77400,) _);

_procedure packPitState(_var side:OneSide; _var packedWord:word);
_var pitIndex:integer;
_( code(2ИК3=СЧ,СД/-6/=17ЗЧ,);
  _for pitIndex := 1 _to 6 _do
    code(2СЧ5=УИ7,2ИК3=7СЧ,17ЛС=СД/-6/,17ЗЧ=);

  code(17СЧ=СД/-3/,2ИК3=ЛС7,);
  packedWord :=;
_);

_procedure unpPitState(_var side:OneSide; state:word);
_var pit:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  side.move := ;
  _for pit := 1 _to 6 _do _(
    % side.pits[pit] := next 6 bits of state
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=)
  _);
  code(2СЧ4=СД/-11/,МР=);
  side.pits[7] := ;
_);
_procedure getUserName(_var first, second:alfa);
_var a:sixchars; absent: boolean; i:integer;
c:char; id, fromOS:alfa;
_(
  id := first;
  code(7ПАРАЗ=,7СБ=СД/40/,7ЗЧ1=7СА1,ВИ7=Э050104,7СЧ=7ПБ2,C;РАЗ:360741703600000,0,0,К;);
  fromOS := ;
  unpck(a[1], fromOS);
  absent := false;
  _for i := 1 _to 6 _do _(
    c := a[i];
    _if _not ((c _in letter) _or (c = ' ') _or (c = '.')) _then
      absent := true;
  _);
  _if absent _then _(
    first := 'НЕТ ТА';
    second := 'КОГО  ';
    exit
  _);
  first := fromOS;
  code(7CЧ1=);
  second := ;
_);

_procedure writeTerminalOutput;
_(
  _if userData.echo _then checkNegativeResponse _else _(
    write('{172     ');
    code(CЧ75205=УИ7,СЧ76401=ЛСисэ71,17ЗЧ1=17Э0711,Э07176402=,);
    rewrite(output); exit;
    code(С;ИСЭ71:3000000024000321,К;)
  _);
_);

_procedure flushOutput;
_var len, cnt, goal: integer;
_(
  code(СЧ75224=АВ75205,);
  goal := ;
  len := cursorCol - goal + 1;
  _for cnt := 1 _to len _do write(spaces);
  cursorCol := goal;
  writeTerminalOutput;
_);
_procedure dsplBoard(_var pckPits:_array [0..1] _of word);
_var pitIndex, stoneCount:integer;unpackedSide:OneSide;
_procedure drawPit(pit:integer);
_(
  write(oparen:2);
  stoneCount := unpackedSide.pits[pit].val;
  _if stoneCount = 0 _then
    write(space:2)
  _else
    write(stoneCount:2);
  write(cparen);
_);
_( (* dsplBoard *)
  write('ДЖИН':13);
  write(space:7);
  unpPitState(unpackedSide, pckpits[0]);
  _for pitIndex := 6 _downto 1 _do
    write(pitIndex:5);
  writeTerminalOutput;
  write(space:21);
  _for pitIndex := 6 _downto 1 _do
   drawPits( pitIndex );
  writeTerminalOutput;
  write(К:15);
  drawPits( 7 );
  unpPitState(unpackedSide, pckpits[1]);
  write(space:32);
  drawPits( 7 );
  write(К:2);
  writeTerminalOutput;
  write(space:21);
  _for pitIndex := 1 _to 6 _do
    drawPits( pitIndex );
  writeTerminalOutput;
  write(space:20);
  _for pitIndex := 1 _to 6 _do
   write(pitIndex:5);
  write(space:9);
  writeUserName;
  writeTerminalOutput;
_);

_procedure dsplTitle;
_(
  write('К    А    Л    А    Х':46);
  writeTerminalOutput;
  write('^^^^^^^^^^^^^^^^^^^^^^^':48);
  writeTerminalOutput;
_);

_procedure verifyAdminPrivileges;
_(
  _if _not isAdmin _then _(
    writeln('ВАМ НЕЛЬЗЯ');
    _GOTO 12561;
  _)
_);

_procedure logWord(arg:alfa);
_(
  _if logIndex > 30 _then exit;
 logPacked[logIndex] := arg;
 logIndex := logIndex + 1;
_);
_procedure logChar(arg:char);
_var w:alfa;
_(
  curLogWord[charIndex] := arg;
  charIndex := charIndex + 1;
  _if charIndex = 7 _then _(
    charIndex := 1;
    pck(curLogWord[1], w);
    logWord(w);
  _)
_);

_procedure initializeLog;
_var acct:alfa; unp:sixchars;
_(
  logPacked[1] := 'САLАН+';
  logPacked[2] := getDateStr;
  logPacked[3] := getTimeStr;
  acct := userData.userAccount;
  code(СД/10/=);
  acct := ;
  unpck(unp[1], acct);
  unp[1] := space;
  unp[6] := '{175';
  pck(unp[1], logPacked[4]);
  logIndex := 5;
_);

_procedure saveLogToZone;
_label 3247;
_var header, dst, idx, curZone:integer; scoreEntry: alfa;
_procedure P3203(data:alfa);
_label 1;
_(
  _if dst > 1023 _then _goto 1;
  zoneBuffer@[dst].a := data;
  scoreEntry := ;
  dst := dst + 1;
  _if scoreEntry = fin _then _(
1:  code(2СЧ3=СД/-14/,2ЛС4=);
    zoneBuffer@[0].i := (* header << 12 | dst *);
    _GOTO 3247;
  _)
_);
_( (* saveLogToZone *)
  _if logIndex > 30 _then exit;
  logWord( fin );
  readDiskZone( nu, zoneLog );
  scoreEntry := zoneBuffer@[0].a;
  code(СД/14/=); header := ; code(МР=СД/44/,);
  dst := ;
  _if (dst <= 896) _or (logStartZone <> 0) _then _(
    idx := 1;
    (loop) _(
      P3203( logPacked[idx] );
      idx := idx + 1;
      _goto loop
    _);
3247:
    _if (dst > 928) _and (logStartZone > 0) _then _(
      curZone := zoneBuffer@[1].i;
      _if (curZone > 0) _and (curZone <= logEndZone) _and (curZone >= logStartZone) _then _(
        writeDiskZone(0, curZone );
        zoneBuffer@[1].i := curZone + 1;
        zoneBuffer@[0].i := (sel(zoneBuffer@[0].i, 12, 12) + 1) * 4096 + 2;
      _)
    _);
    writeDiskZone( nu, zoneLog );
  _)
_);
_procedure playGameSession;
_label 10266, 999, 12341, 11426, 11616, 11531, 11027, 12032, 12162,
11225, 11252, 11772, 11142, 12013, 12240, 12244, 10773;
_const billion = 1000000000; hundredMillion = 100000000;
minusHundredMillion = 37777202417400C; lakh = 100000;
minusLakh = 37777777474540C; million = 1000000;
bookSize = 8415; cbb = 72; erase = '{162'; right = '{171'; left = '{146';
up = '{176'; down = '{177'; delay = '{142';
_type
Position = _array [jinn..user] _of OneSide;
pckboth = _array [jinn..user] _of word;
eightwords = _record f0, kalah, extraTurn, emptyOpp, multiLap, capture, mobility, distance:integer _end;
_var
mask1:alfa;                         % First packing mask for string operations
mask2:alfa;                         % Second packing mask for string operations
mask3:alfa;                         % Third packing mask for string operations
acctCopy:alfa;                      % Copy of userData.userAccount for comparisons
scoreEntry:alfa;                    % Score zone data entry read/write buffer
scoreCheck:alfa;                    % Comparison value for score validation
cmdString:alfa;                     % Command string buffer
inputCmd:alfa;                      % Parsed user input command
resultChar:char;                    % Game result character (N/+/-/C)
hasScore:boolean;                   % True if player has score entry in table
isResumedGame:boolean;              % True if resuming a saved game
isNewGame:boolean;                  % True if starting a new game
isTrainingGame:boolean;             % True if in training mode
movesPending:boolean;               % True if moves in input buffer
isFirstGame:boolean;                % True if first game of session
testMode:boolean;                   % True if in test mode (B command)
gameIsDecided:boolean;              % True if game outcome is certain
aiSilent:boolean;                   % True if AI should not speak
userSilent:boolean;                 % True if user is silent
isMasterLevel:boolean;              % True if difficulty level is 4 (Efendi)
postponeFlag:boolean;               % True if game should be postponed
hasWarned:boolean;                  % True if warned about early exit
gndrMismatch:boolean;               % True if name/gender mismatch detected
allowExit:boolean;                  % True if exit is allowed
useOpeningBook:boolean;             % True if using opening book
bookIsActive:boolean;               % True if currently in opening book
enableLogging:boolean;              % True if game logging is enabled
useCorrections:boolean;             % True if using corrections database
echoSaved:boolean;                  % Saved userData.echo flag for restore
packedData:word;                    % Packed game state data
difficultyLevel:integer;            % Game difficulty (1=Junior, 2=Candidate, 3=Participant, 4=Efendi)
resumeCount:integer;                % Count of game resumptions
userTotalScore:integer;             % User total score in tournament
jinnTotalScore:integer;             % Jinn total score in tournament
gamesPlayedToday:integer;           % Number of games played today
levelChoice:integer;                % User-selected difficulty level
savedLevel:integer;                 % Saved difficulty level
rndnessFactor:integer;              % Randomness factor for move selection
chosenMove:integer;                 % AI chosen move pit number
wordsSinceLastSpeak:integer;        % Words since last AI speech
insertPos:integer;                  % Position to insert score entry
scorePos:integer;                   % Position in score table
maxNodesToSearch:integer;           % Maximum nodes to search in minimax
alphaBetaCutoffs:integer;           % Count of alpha-beta cutoffs
deepenCount:integer;                % Count of search deepening
extraDepth:integer;                 % Extra search depth added
prevNodes:integer;                  % Previous node count
jinnWins:integer;                   % Jinn wins this game
userWins:integer;                   % User wins this game
startPlayer:integer;                % Starting player (0=jinn, 1=user)
savedGameSlot:integer;              % Saved game slot index
loopIndex:integer;                  % General loop counter
currentPlayer:integer;              % Current player (0=jinn, 1=user)
seledMove:integer;                  % Selected move pit number
numScoreEntries:integer;            % Number of score entries in table
userFinalKalah:integer;             % User final kalah count
jinnFinalKalah:integer;             % Jinn final kalah count
lastJinnKalah:integer;              % Jinn kalah count at last AI phrase
lastUserKalah:integer;              % User kalah count at last AI phrase
startTickCount:integer;             % CPU ticks at game start
searchDepth:integer;                % Base minimax search depth
actualDepth:integer;                % Actual search depth used
entryIndex:integer;                 % Index in score table
inputLength:integer;                % Length of input string
totalMovesPlayed:integer;           % Total moves played in game
curMoveNumber:integer;              % Current move number (for corrections)
corrStartIdx:integer;               % Corrections start index
corrEndIdx:integer;                 % Corrections end index
oldHandler:integer;                 % Saved interrupt handler
openingBookIndex:integer;           % Current position in opening book
posSignature:integer;               % Position signature (for corrections)
uncertaintyBits:integer;            % Move uncertainty in decisibits
nodesSearched:integer;              % Total nodes searched
nodesBefore:integer;                % Nodes searched count before minimax call
jinnThinkingTime:integer;           % Jinn total thinking time in ticks
userThinkingTime:integer;           % User total thinking time in ticks
inputTicks:integer;                 % Wall clock ticks at input start
movesInBuffer:integer;              % Number of moves in input buffer
upLines:integer;                    % Number of cursor up lines (5 or 1)
nodesThisMove:integer;              % Nodes searched for current move
userAge:integer;                    % User age in years
curThinkTime:integer;               % Current move thinking time
curPosition:Position;               % Current game position
posBeforeMove:Position;             % Position before move execution
pckPosition:_array [0..1] _of word; % Packed position representation
knownGender:gndr;                   % Known user gender
unpLog:sixchars;                    % Unpacked log entry
dataPtr:@sixchars;                  % Pointer to packedData for unpacking
moveResult:integer;                 % Result of exMvAnimated (0=invalid, 1=normal, 2=extra turn)
lastMoveResult:integer;             % Result of last move
usedSlots:bitset;                   % Used saved game slots
freeSlots:bitset;                   % Free saved game slots
totalEntropy:real;                  % Total move entropy
moveEntropy:real;                   % Current move entropy
oneOverLN2:real;                    % Constant 1/ln(2) for entropy calculation
slotPtr:@SlotRec;                   % Pointer to saved game record
weights:eightwords;                 % AI evaluation weights (working copy)
posEnc:_array[1..12] _of char;      % Position state encoding buffer for saved game
statsPtr:@zone;                     % Pointer to statistics accumulator zone
moveBuffer:_array [1..10] _of char; % Input move buffer
defWeights:eightwords;              % Default AI weights [kalah, extraTurn, emptyOpp, multiLap, capture, mobility, distance]
moveValues:_array [0..6] _of integer;    % Evaluation scores for each move
moveExecuted:_array [0..6] _of integer;  % Non-zero if move was executed
haveSaid:_array[0..30] _of bitset;       % Bitset tracking which phrases have been said
_FUNСТI RАNDОМ:RЕАL;(* СЛУЧАЙНОЕ ЧИСЛО В (0,1) *)
_(
  СОDЕ(К;ВР77=17ЗЧ1,РА3=СЧХRАND,АУАRАND=МР,
ЦССRАND=ЛУЕВПИЛ,ЛСЕСОРВ=ЗЧХRАND,РА=АС,17РК1=ПБЮЮR,
С;ХRАND:0,АRАND:4004142135623735,
СRАND:0003303130564677,ЕВПИЛ:0017777777777777,Л;ЕСОРВ:В1/57,
К;ЮЮR:ЗЧ=,);RАNDОМ:=;_);(*ЕND RАNDОМ*)

_РRОСЕD RАND0;(* НАЧАЛЬНАЯ УСТАНОВКА RАNDОМ *)
_(СОDЕ(К;Э05310=,СД/-31/=ЗЧХRАND,Э050114=,
СД/-5/=ЦСХRАND,ЛУЕВПИЛ=ЛСЕСОРВ,ЗЧХRАND=,)_);(*ЕND RАND0*)

_function randint(arg:integer):integer;
_(
  randint := trunc(RANDOM * arg);
_);

_function matchNchars(arg:alfa):boolean;
_(
  code(тут2:7патут2=пбдавай,
c;7760000000000000,7777740000000000,7777777700000000,
7777777777600000,7777777777777400,377,15,17,
к;давай:3сч4=7лу6,уи6=1сч12,3ср4=6иа,7лу=3зч4,);
  matchNchars := arg = '000000';
_);

_function matchesCommand(command:alfa):boolean;
_var a: alfa; unpCommand,oneChar:sixchars;
_(
  matchesCommand := false;
  _if command = inputCmd _then _( matchesCommand := true; exit _);
  unpck(unpCommand[1], command);
  a := '      ';
  unpck (oneChar[1], a);
  oneChar[1] := unpCommand[1];
  pck(oneChar[1], a);
  _if a = inputCmd _then matchesCommand := true;
_);

_function decodePos(word1, word2: alfa):alfa;
_var mask1, mask2, mask3: alfa;
_(
  mask1 := '{007{077{077{077{077{077';
  mask2 := '{077{3770000';
  mask3 := '{375{3760000';
% Repack from byte-encoded counts to 6-bit
  code(3сч4=3сб6,3см5=3сб7,3рб10=сд/-17/,мр=17лс,);
  decodePos := ;
_);
_procedure writeCharNTimes(character:char; repeatCount:integer);
_var counter:integer;
_(
  _for counter := 1 _to repeatCount _do write(character);
_);

_procedure packPosition(_var pos:Position; _var packedBoth:pckboth);
_(
  packPitState(pos[jinn], packedBoth[jinn]);
  packPitState(pos[user], packedBoth[user]);
_);

_procedure unpPosition(_var pos:Position; _var packedBoth:pckboth);
_(
  unpPitState(pos[jinn], packedBoth[jinn]);
  unpPitState(pos[user], packedBoth[user]);
_);

_function exMvLogic(_var pos:Position; pitIndex:integer):integer;
_label 3520;
_type fake = _array [0..15] _of contents;
_var curPlayer:player;
curPit,stoneIndex:integer;
maxPit:integer;
originalPlayer:player;
stonesToMove:integer;
pitValue:integer;
opponentPlayer:player;
capturedStones:integer;
boardPtr:@fake;
oppositePitPtr,kalahPtr,pitPtr:@integer;
_(
  curPlayer := pos[user].move.i;
  originalPlayer := ;
  boardPtr := ref(pos);
  stonesToMove := boardPtr@[curPlayer*8+pitIndex].val;
  _if stonesToMove = 0 _then _( exMvLogic := 0; exit _);
  boardPtr@[curPlayer*8+pitIndex].val := 0;
3520:
  code(3сч6=ср13,3зч15=); (* opponentPlayer := _not curPlayer *)
  _if curPlayer = originalPlayer _then
    maxPit := 7
  _else
    maxPit := 6;

  _for stoneIndex := 1 _to stonesToMove _do _(
    curPit := pitIndex + stoneIndex;
    _if curPit <= maxPit _then _(
      pitPtr := ref(boardPtr@[curPlayer*8+curPit]);
      pitPtr@ := pitPtr@ + 1;
      pitValue := ;
      _if stoneIndex = stonesToMove _then _(
        _if curPit = 7 _then _(
          exMvLogic := 2;
        _) _else _(
          exMvLogic := 1;
          pos[jinn].move.i := originalPlayer;
          code(ср13=);
          pos[user].move := ;
          _if (pitValue = 1) _and (curPlayer = originalPlayer) _then _(
            oppositePitPtr := ref(boardPtr@[opponentPlayer*8+7-curPit]);
            capturedStones := oppositePitPtr@;
            _if capturedStones > 0 _then _(
              kalahPtr := ref(boardPtr@[originalPlayer*8+7]);
              kalahPtr@ := kalahPtr@ + capturedStones + 1;
              pitPtr@ := 0;
              oppositePitPtr@ := ;
            _);
            exit
          _)
        _)
      _);
    _) _else _(
      stonesToMove := stonesToMove - stoneIndex + 1;
      code(3cч6=ср13,3зч6=); (* curPlayer := _not curPlayer *)
      pitIndex := 0;
      _goto 3520;
    _)
  _)
_);

_functin exMvAnimated(_var pos:Position; pitIdx:integer):integer;
_label 4171;
_var
curPlr:word;        % Current player as word (for .i and .b access)
curPit:integer;     % Current pit being filled during sowing
loopCt:integer;     % Loop counter for stones/pits
maxPit:integer;     % Maximum pit number (6 or 7 depending on player)
origPl:word;        % Original player who made the move
stones:integer;     % Number of stones to sow / total stones collected
pitVal:integer;     % Value of pit after placing a stone
oppPlr:word;        % Opponent player as word (for .i and .b access)
capStone:integer;   % Captured stones from opposite pit
oppIdx:integer;     % Opposite pit index (7 - current pit)
cursCol:integer;    % Cursor column position for animation
cursRow:integer;    % Cursor row position for animation
dirChr:char;        % Direction character for cursor movement

_procedure drawMove(p: player; pitNum: integer);
_var
delayI:integer;     % Inner loop counter for animation delay
moveI:integer;      % Loop counter for cursor movement steps
moveDist:integer;   % Distance to move cursor
targCol:integer;    % Target column position on screen
targRow:integer;    % Target row position on screen
adjPit:integer;     % Adjusted pit index for screen positioning
stoneCount:integer; % Number of stones to display in pit
dir:char;           % Direction character (left/right/up/down)
_(
  _if pitNum = 7 _then _(
    targRow := 0;
    _if p = user _then
      targCol := 18 + 36
    _else
      targCol := 18 - 1;
  _) _else _(
    _if p = user _then _(
      adjPit := pitNum;
      targRow := -1;
    _) _else _(
      adjPit := 7 - pitNum;
      targRow := 1;
    _);
    targCol := adjPit * 5 + 18;
  _);
  _select
    targCol > cursCol : _(
      dir := right;
      moveDist := targCol - cursCol;
    _);
    targCol < cursCol : _(
      dir := left;
      moveDist := cursCol - targCol;
    _);
    true: moveDist := 0
  _end;
  _for moveI := 1 _to moveDist _do _(
    _for delayI := 1 _to animDelay _do _(
      write(delay);
    _);
    write(dir);
  _);
  _select
  targRow > cursRow : _(
    dir := up;
    moveDist := targRow - cursRow;
  _);
  cursRow > targRow : _(
      dir := down;
      moveDist := cursRow - targRow;
  _);
  true: moveDist := 0
  _end;
  _for moveI := 1 _to moveDist _do _(
    _for delayI := 1 _to animDelay _do
      write(delay);
    write(dir);
  _);
  stoneCount := pos[p].pits[pitNum].val;
  _if stoneCount = 0 _then
    write(space:2)
  _else
    write(stoneCount:2);
  writeCharNTimes(delay, animDelay );
  cursCol := targCol + 2;
  cursRow := targRow;
_);
_( (* exMvAnimated *)
  cursRow := 0;
  curPlr := pos[user].move;
  origPl := ;
  _if pitIdx = 0 _then _(
    oppPlr.i := 0;
    stones := ;
    cursCol := 0;
    _for loopCt := 1 _to 6 _do _(
      oppPlr.i := pos[jinn].pits[loopCt].val + oppPlr.i;
      stones := pos[user].pits[loopCt].val + stones;
    _);
    (*=c-*)loopCt := oppPlr.i = 0; (*=c+*)
    stones := stones + oppPlr.i;
    writeCharNTimes(up, curPlr.i);
    _for maxPit := 1 _to 6 _do _(
      _if pos[loopCt].pits[maxPit].val > 0 _then _(
        pos[loopCt].pits[maxPit].val := 0;
        drawMove(loopCt, maxPit);
      _)
    _);
    pos[loopCt].pits[7].val := pos[loopCt].pits[7].val + stones;
    drawMove(loopCt, 7);
  _) _else _( (* 4035 *)
    cursCol := 7;
    stones := pos[curPlr.i].pits[pitIdx].val;
    pos[curPlr.i].pits[pitIdx].val := 0;
    writeCharNTimes(up, curPlr.i);
    write(totalMovesPlayed:4);
    write(space:3);
    drawMove(curPlr.i, pitIdx);
    (loop) _(
     oppPlr.b := _not curPlr.b;
    _if curPlr.i = origPl.i _then _(
      maxPit := 7;
    _) _else _(
      maxPit := 6;
    _);
% L4066:
    _for loopCt := 1 _to stones _do _(
      curPit := pitIdx + loopCt;
      _if curPit <= maxPit _then _(
        pos[curPlr.i].pits[curPit].val := pos[curPlr.i].pits[curPit].val + 1;
        pitVal := ;
        drawMove( curPlr.i, curPit );
        _if loopCt = stones _then _(
          _if curPit = 7 _then _(
            exMvAnimated := 2;
          _) _else _(
            exMvAnimated := 1;
            pos[jinn].move := origPl;
            code(ср13=);
            pos[user].move := ;
            _if (pitVal = 1) _and (curPlr.i = origPl.i) _then _(
              oppIdx := 7 - curPit;
              capStone := pos[oppPlr.i].pits[oppIdx].val;
              _if capStone > 0 _then _(
                pos[oppPlr.i].pits[oppIdx].val := 0;
                drawMove( oppPlr.i, oppIdx );
                pos[curPlr.i].pits[curPit].val := 0;
                drawMove( curPlr.i, curPit );
                pos[origPl.i].pits[7].val := pos[origPl.i].pits[7].val + capStone + 1;
                drawMove( origPl.i, 7 );
              _);
% L4160:
              _goto 4171
            _)
          _)
% L4161:
        _)
      _) _else _(
% L4162:
        stones := (stones - loopCt) + 1;
        curPlr.b := _not curPlr.b;
        pitIdx := 0;
        _goto loop;
      _);
% L4167:
    _)
  _)
  _); (* 4171 *)
4171:
  writeCharNTimes(left, cursCol);
  _if cursRow > 0 _then _(
    dirChr := down;
  _) _else _if cursRow < 0 _then _(
    cursRow := -cursRow;
    dirChr := up;
  _);
  writeCharNTimes( dirChr, cursRow );
  writeTerminalOutput;
_);
_function isGameOver(_var pos:Position): boolean;
_var playerIndex, pitIndex: integer; sideTotals: _array[0..1] _of integer;
_(
  _for playerIndex := 0 _to 1 _do _(
    sideTotals[playerIndex] := 0;
    _for pitIndex := 1 _to 6 _do _(
      sideTotals[playerIndex] := pos[playerIndex].pits[pitIndex].val + sideTotals[playerIndex];
    _);
    _if sideTotals[playerIndex] = 0 _then _( isGameOver := true; exit _);
  _);
  isGameOver := false;
_);
_procedure collectAllStones; (* unused *)
_var player, pit: integer;
_(
  _for player := 0 _to 1 _do
  _for pit := 1 _to 6 _do _(
    curPosition[player].pits[7].val := curPosition[player].pits[7].val + curPosition[player].pits[pit].val;
    curPosition[player].pits[pit].val := 0;
  _)
_);

_function getExtraTurnMoves(_var pos:Position; p:player):bitset; (* unused *)
_var target, stones, pit:integer; retVal:bitset;
_(
  retVal := [];
  _for pit := 1 _to 6 _do _(
    stones := pos[p].pits[pit].val;
    _if stones > 0 _then _(
      target := stones + pit;
      _if (target = 7) _or (target = 20) _then
        retVal := [pit] + retVal;
    _)
  _);
  getExtraTurnMoves := retVal;
_);

_function selAIMove(_var pos:Position; _var weights: eightwords; searchDepth:integer):integer;
_label 5250, 5655;
_var
pitIndex: integer;           % Multi-purpose loop counter - heavily reused across 6+ contexts
bestScore: integer;          % Best score found so far - also reused as loop counter
worstScore: integer;         % Worst score found so far - threshold for filtering
idx1: integer;               % Multi-purpose temp - book bits, current player, move counter
idx2: integer;               % Loop counter for building candidates
retVal: integer;             % * THE RETURN VALUE * Selected pit number 1-6
moveScore: integer;          % Evaluation score for current move
baseEval: integer;           % Base evaluation of position before any move
startTime: integer;          % Start time in CPU ticks - for thinking time calculation
curPos: Position;            % Working copy of input position - never modified
testPos: Position;           % Test position for simulating individual moves
moveType: integer;           % Move result code from exMvLogic - 0=invalid, 1=normal, 2=extra turn
candWeight: _array [0..6] _of integer;  % Cumulative probability weights - for random selection
unu1: integer;               % Unused auxiliary - may be optimized out
candMove: _array[0..6] _of integer;     % Pit indices of candidate moves
unu2: integer;               % Unused - possible remnant
candCount: integer;          % Number of good candidate moves
scoreSum: integer;           % Total score sum for normalization
averageScore: integer;       % Score threshold for filtering moves
totalWeight: integer;        % Total probability weight sum
moveWeight: integer;         % Probability weight for individual move - also book continuations
bookZoneIndex: integer;      % Adjusted opening book index
bookMoves: bitset;           % Valid moves from opening book
alpha: integer;              % Alpha parameter for minimax - upper bound
beta: integer;               % Beta parameter for minimax - lower bound
nodeBudget: integer;         % Remaining node budget for search
nodesPerMove: integer;       % Node budget allocated to single move
legalMoveCount: integer;     % Number of legal moves - countdown variable
kalahWeight: integer;        % Weight for stones in kalah
extraTurnBonus: integer;     % Bonus for extra turn moves
emptyOppWeight: integer;     % Weight for empty pits with stones opposite
multiLapBonus: integer;      % Bonus for stones that lap around
captureSetup: integer;       % Weight for capture threat potential
mobilityWeight: integer;     % Weight for mobile stones
distanceWeight: integer;     % Weight for distance to kalah

_function materialDifference(_var pos:Position):integer;
_var sum, pit, curPLayer, oppPlayer:integer;
_(
  curPlayer := pos[user].move.i;
  code(CP13=);
  oppPlayer := ;
  sum := 0;
  _for pit := 1 _to 7 _do _(
    sum := pos[curPlayer].pits[pit].val + sum - pos[oppPlayer].pits[pit].val;
  _);
  _select
    sum > 0: materialDifference := lakh;
    sum < 0: materialDifference := minusLakh;
    true: materialDifference := 0
  _end
_);

_function evaluatePosition(_var pos: Position):integer;
_var (* 22 locals *)
pitIndex, tableIndex: integer;
curPlayer, opponentPlayer: integer;
distToKalah, distMinus13, jinnStones, userStones, jinnScore, userScore,
jinnMobile, userMobile, jinnCaptureSetup, userCaptureSetup, jinnEmptyOpp, userEmptyOpp, jinnDistance, userDistance,
jinnKalahVal, userKalahVal: integer;
jinnSidePtr, userSidePtr: @OneSide;

_(
  curPlayer := pos[user].move.i;
  code(CP13=); opponentPlayer := ;
  nodesSearched := nodesSearched + 1;
  _if curPlayer = 0 _then _(
    jinnSidePtr := ref(pos[jinn]);
    userSidePtr := ptr(ord(jinnSidePtr) + 8);
  _) _else _(
   userSidePtr := ref(pos[jinn]);
   jinnSidePtr := ptr(ord(userSidePtr) + 8);
  _);
  jinnKalahVal := jinnSidePtr@.pits[7].val;
  userKalahVal := userSidePtr@.pits[7].val;
  _if _not gameIsDecided _then _(
    _if jinnKalahVal > 36 _then _(
      evaluatePosition := lakh;
      exit
    _);
    _if userKalahVal > 36 _then _(
      evaluatePosition := minusLakh;
      exit
    _);
  _);
  jinnMobile := 0;
  userMobile := ;
  jinnCaptureSetup := ;
  userCaptureSetup := ;
  jinnEmptyOpp := ;
  userEmptyOpp := ;
  jinnDistance := ;
  userDistance := ;
  jinnScore := jinnKalahVal * kalahWeight;
  userScore := userKalahVal * kalahWeight;
  code(=7ПA7,);
  _for pitIndex := 1 _to 6 _do _(
    code(=7СА-1,ВИ7=);
    tableIndex := ;
    jinnStones := jinnSidePtr@.pits[pitIndex].val;
    _if jinnStones > 0 _then _(
      jinnMobile := jinnMobile + jinnStones;
      distToKalah := jinnStones + pitIndex;
      distMinus13 := distToKalah - 13;
      _if distToKalah < 7 _then _(
        jinnDistance := jinnDistance + jinnStones + 7;
      _) _else _(
        _while distToKalah >= 20 _do
          distToKalah := distToKalah - 13;
        jinnDistance := abs(13 - distToKalah) + jinnDistance + tableIndex;
      _);
      _if distToKalah = 7 _then _(
         jinnScore := jinnScore + extraTurnBonus;
      _) _else _(
        _if jinnStones = 13 _then
          jinnCaptureSetup := userSidePtr@.pits[tableIndex].val + 3 + jinnCaptureSetup;
        _if distToKalah > 7 _then _(
          jinnScore := jinnScore + multiLapBonus;
          _if distMinus13 > 7 _then
            jinnScore := jinnScore + multiLapBonus;
        _);
      _);
    _) _else
      jinnEmptyOpp := userSidePtr@.pits[tableIndex].val + jinnEmptyOpp;
    userStones := userSidePtr@.pits[pitIndex].val;
    _if userStones > 0 _then _(
      userMobile := userMobile + userStones;
      distToKalah := userStones + pitIndex;
      distMinus13 := distToKalah - 13;
      _if distToKalah < 7 _then _(
        userDistance := userDistance + userStones + 7;
      _) _else _(
        _while distToKalah >= 20 _do
          distToKalah := distToKalah - 13;
        userDistance := abs(13 - distToKalah) + userDistance + tableIndex;
      _);
      _if distToKalah = 7 _then _(
        userScore := userScore + extraTurnBonus;
      _) _else _(
        _if userStones = 13 _then
          userCaptureSetup := jinnSidePtr@.pits[tableIndex].val + 3 + userCaptureSetup;
        _if distToKalah > 7 _then _(
          userScore := userScore + multiLapBonus;
          _if distMinus13 > 7 _then
            userScore := userScore + multiLapBonus;
        _)
      _)
    _) _else
      userEmptyOpp := jinnSidePtr@.pits[tableIndex].val + userEmptyOpp;
  _);
  _if (jinnMobile = 0) _or (userMobile = 0) _then _(
    evaluatePosition :=   materialDifference( pos );
    exit
  _);
  jinnScore := jinnEmptyOpp * emptyOppWeight + jinnCaptureSetup * captureSetup + jinnMobile * mobilityWeight + jinnDistance * distanceWeight + jinnScore;
  userScore := userEmptyOpp * emptyOppWeight + userCaptureSetup * captureSetup + userMobile * mobilityWeight + userDistance * distanceWeight + userScore;
  evaluatePosition := jinnScore - userScore;
_);
_function minimax(_var pos:Position; depth, maxNodes: integer; _var alpha, beta: integer):integer;
_label 5050, 5054, 5070, 999;
_var
jinnPlayer, userPlayer, pitIndex, curPit, moveOrder, pitStones, legalMoves, oppMobile, evalScore, bestScore,
localAlpha, localBeta, betaCopy, bestMove, startNodes, nodesBudget, orderEnd, testScore, moveResult, mvScArray:integer;
mvSc:_array [1..7] _of integer;
testPosition, newPosition:Position;
_(
  _if depth = 0 _then _(
    bestScore :=   evaluatePosition( pos );
    _goto 5070;
  _) _else _(
  testPosition := pos;
  bestScore := minusHundredMillion;
  localAlpha := alpha;
  localBeta := beta;
  legalMoves := 0;
  oppMobile := ;
  bestMove := ;
  startNodes := nodesSearched;
  nodesBudget := maxNodes;
  curPit := 1;
  orderEnd := ;
  moveOrder := 6;
  userPlayer := testPosition[user].move.i;
  jinnPlayer := testPosition[jinn].move.i;
  _for pitIndex := 6 _downto 1 _do _(
    pitStones := testPosition[userPlayer].pits[pitIndex].val;
    _if pitStones > 0 _then orderEnd := orderEnd + 1;
    pitStones := pitStones + pitIndex;
    oppMobile := testPosition[jinnPlayer].pits[pitIndex].val + oppMobile;
    _select
      (pitStones = 7) _or (pitStones = 20) : _(
      mvSc[curPit] := pitIndex;
      curPit := curPit + 1;
    _);
    pitStones <> pitIndex : _(
      mvSc[moveOrder] := pitIndex;
      moveOrder := moveOrder - 1;
    _)
    _end
  _);

  _if oppMobile = 0 _then _(
    bestScore := materialDifference(testPosition);
    chosenMove := 0;
    _goto 5070;
  _);

  _if (curPit > 1) _and (depth > 1) _then
    depth := depth - 1;
  _for pitIndex := curPit _to moveOrder _do
    mvSc[pitIndex] := 0;
% L4727
  _for pitIndex := 1 _to 6 _do _(
    _if (nodesSearched - startNodes > maxNodes) _and (legalMoves <> 0) _then _(
      alphaBetaCutoffs := alphaBetaCutoffs + 1;
      _goto 5050
    _); (* 4737 *)
    (*=m+ may be unnecessary, but helps matching code for mul/mod/div by powers of 2 *)
    curPit := mvSc[pitIndex];
    _if curPit = 0 _then _goto 999;
    _if depth > 1 _then _(
      nodesBudget := trunc((maxNodes - nodesSearched + startNodes) * 2 / orderEnd);
      orderEnd := orderEnd - 1;
    _) _else _(
      nodesBudget := maxNodes;
    _);
    newPosition := testPosition;
    moveResult :=   exMvLogic(newPosition, curPit );
    _select
      moveResult = 1: evalScore := - minimax(newPosition, depth-1, nodesBudget, localBeta, localAlpha);
      moveResult = 2: _(
        betaCopy := localBeta;
        evalScore := minimax(newPosition, depth, maxNodes, localAlpha, betaCopy)
      _);
      moveResult = 0: _goto 999
    _end; (* 5025 *)
    _if evalScore > bestScore _then _(
      bestScore := evalScore;
      bestMove := curPit;
    _); (* 5031 *)
    legalMoves := legalMoves + 1;
    _if (bestScore >= beta) _and (bestScore <> billion) _then _(
      bestScore := beta;
      _goto 5054
    _);
999:;
  _); (* 5042 *)
  _if legalMoves = 0 _then _(
    bestScore := materialDifference(testPosition);
  _);
5050:
  _if bestScore < beta _then beta := bestScore;
  _);
5054:
  chosenMove := bestMove;
  _if (bestMove = 0) _and _not isGameOver(testPosition) _then _(
    writeln('"ЧП" ДЕРЦЕН');
    _GOTO 12561;
  _);
5070:
 minimax := bestScore;
_);

_procedure validateBookMoves(m: bitset);
_(
  _if m=[] _then _(
    writeln('"ЧП" ДЕБЮТОВ !!':36);
    _GOTO 12561;
  _);
_);

_function consultOpeningBook(_var pos: Position; bookIndex:integer):integer;
_var
testPosition:Position; adjustedIndex, moveNumber, continuations:integer;
moveMask:word;
_(
  _if bookIndex > bookSize _then continuations := 1 _else _(
    _if bookIndex > 1547 _then adjustedIndex := bookIndex - 224
    _else adjustedIndex := bookIndex;
    moveNumber := (7 - adjustedIndex _MOD 8) * 6;
    moveMask.i := sel(zoneBuffer@[adjustedIndex _div 8], moveNumber, 6);
    validateBookMoves( moveMask.s );
    continuations := 0;
    bookIndex := bookIndex * 6;

    _while moveMask.s <> [] _do _(
      moveNumber := minel(moveMask.s);
      moveMask.s := moveMask.s - [moveNumber];
      moveNumber := moveNumber - 41;
      testPosition := pos;
      moveType := exMvLogic(testPosition, moveNumber );
      _select
      moveType = 1 : continuations := continuations + 1;
      true : continuations := consultOpeningBook(testPosition, bookIndex + moveNumber) + continuations
      _end;
    _)
  _); (* 5204 *)
  consultOpeningBook := continuations;
_);
_( (* selAIMove *)
  startTime :=   remainingCPUTime;
  _for bestScore := 1 _to 30 _do
   haveSaid[bestScore] := [];

  kalahWeight := weights.kalah;
  extraTurnBonus := weights.extraTurn;
  emptyOppWeight := weights.emptyOpp;
  multiLapBonus := weights.multiLap;
  captureSetup := weights.capture;
  mobilityWeight := weights.mobility;
  distanceWeight := weights.distance;
  curPos := pos;
  bestScore := minusHundredMillion;
  worstScore := hundredMillion;
  uncertaintyBits := 0;
  moveEntropy := ;
  bookIsActive := true;
5250:
   _if useOpeningBook _then _(
     _if openingBookIndex > bookSize _then _(
       useOpeningBook := false;
       useCorrections := true;
       _goto 5250;
     _);
     _if openingBookIndex > 1547 _then bookZoneIndex := openingBookIndex - 224
     _else bookZoneIndex := openingBookIndex;
     idx1 := (7 - bookZoneIndex _MOD 8) * 6;
     idx1 := sel(zoneBuffer@[bookZoneIndex_div 8], idx1, 6);
     code(СД/-51/=);
     bookMoves := ;
     validateBookMoves( bookMoves );
   _) _else _((* 5302 *)
   _if randint(100) >= rndnessFactor _then _(
     alpha := billion;
     beta := ;
     bookIsActive := false;
     nodesBefore := nodesSearched;
     moveScore :=   minimax(curPos, searchDepth, maxNodesToSearch, alpha, beta);
     retVal := chosenMove;
     _goto 5655;
   _);
   baseEval := evaluatePosition(curPos);
  _); (* 5325 *)
  legalMoveCount := 1;
  idx1 := curPos[user].move.i;
  nodeBudget := maxNodesToSearch;
  _for pitIndex := 1 _to 6 _do _(
    _if pos[idx1].pits[pitIndex].val > 0 _then legalMoveCount := legalMoveCount + 1;
  _);
  idx1 := 0;
  retVal := ;
  averageScore := ;
  _for pitIndex := 1 _to 6 _do _(
    testPos := curPos;
    _if useOpeningBook _then _(
    _if pitIndex _IN bookMoves _then _(
      moveType := exMvLogic(testPos, pitIndex );
      moveExecuted[pitIndex] := ;
      _if moveType = 0 _then _(
        writeln('ПУСТАЯ ЛУНКА В ДЕБЮТАХ - "ЧП" !');
        writeln('ИСТОРИЯ ', openingBookIndex:1);
        _GOTO 12561;
      _); (* 5401 *)
      idx1 := idx1 + 1;
      retVal := pitIndex;
      _if moveType = 2 _then
        moveWeight := consultOpeningBook(testPos, openingBookIndex * 6 + pitIndex)
      _else
        moveWeight := 1;
      moveValues[pitIndex] := moveWeight;
    _) (* 5417 *)
    _else moveExecuted[pitIndex] := 0;
    _) _else _( (* 5422 *)
      moveType := exMvLogic(testPos, pitIndex);
      moveExecuted[pitIndex] := ;
      nodesBefore := nodesSearched;
      _if moveType <> 0 _then _(
        alpha := billion;
        beta := ;
        nodesPerMove := nodeBudget * 2 _div legalMoveCount;
        legalMoveCount := legalMoveCount - 1;
        _if moveType = 1 _then _(
          moveScore := - minimax(testPos, searchDepth-1, nodesPerMove, alpha, beta);
        _) _else _(
          moveScore :=   minimax(testPos, searchDepth, nodesPerMove, alpha, beta);
        _); (* 5467 *)
        nodeBudget := nodeBudget - nodesSearched + nodesBefore;
        moveScore := moveScore - baseEval;
        moveValues[pitIndex] := ;
        idx1 := idx1 + 1;
        _if moveScore > bestScore _then _(
          retVal := pitIndex;
          bestScore := moveScore;
        _);
        _if moveScore < worstScore _then worstScore := moveScore;
      _)
    _); (* 5504 *)
  _); (* 5506 *)
  _if idx1 < 2 _then _goto 5655;
  _if useOpeningBook _then
    averageScore := 0
  _else _(
    idx1 := 0;
    _for pitIndex := 1 _to 6 _do _(
      _if ((moveValues[pitIndex] <> worstScore) _or (worstScore = bestScore)) _and (moveExecuted[pitIndex] <> 0) _then _(
        averageScore := averageScore + moveValues[pitIndex];
        idx1 := idx1 + 1;
      _)
    _);
    _if idx1 < 2 _then _goto 5655;
    averageScore := averageScore _div idx1 - 1;
  _); (* 5541 *)
  candCount := 0;
  scoreSum := ;
  _for idx2 := 1 _to 6 _do
  _if (moveExecuted[idx2] <> 0) _and (moveValues[idx2] > averageScore) _then _(
    candCount := candCount + 1;
    pitIndex := moveValues[idx2] - averageScore;
    candWeight[candCount] := ;
    scoreSum := scoreSum + pitIndex;
    candMove[candCount] := idx2;
  _); (* 5563 *)
  _if candCount < 2 _then _goto 5655;
  totalWeight := 0;
  _for retVal := 1 _to candCount _do _(
    pitIndex := candWeight[retVal] * 100 _div scoreSum;
    _if useOpeningBook _then
      moveWeight := pitIndex
    _else
      moveWeight := pitIndex * pitIndex;

    _if moveWeight > 0 _then
      moveEntropy := moveEntropy - moveWeight * LN(moveWeight);
    totalWeight := moveWeight + totalWeight;
    candWeight[retVal] := ;
  _); (* 5622 *)
  moveEntropy := moveEntropy / totalWeight + LN(totalWeight);
  totalEntropy := moveEntropy + totalEntropy;
  uncertaintyBits := round(moveEntropy * 10.0 * oneOverLn2);
  pitIndex := randint(totalWeight) + 1;
  _for bestScore := 1 _to candCount _do _(
    _if pitIndex <= candWeight[bestScore] _then _(
      retVal := candMove[bestScore];
      _goto 5655
    _)
  _); (* 5650 *)
  writeln('ОШ ДРЕВД');
  _GOTO 12561;
5655:
  selAIMove := retVal;
  jinnThinkingTime := remainingCPUTime - startTime + jinnThinkingTime;
_);
(*=m- ... and back to non-negative multiplicative ops *)

_function applyLearningCorrection(suggestedMove:integer):integer;
_var searchIndex, useCount, bitPosition:integer; entryPtr:@word;
_(
  applyLearningCorrection := suggestedMove;
  bitPosition := (15 - curMoveNumber) * 3;
  _if corrStartIdx = 0 _then _(
    readDiskZone( 0, zoneCorrections );
    _if zoneBuffer@[0].a <> '!СОRR!' _then _(
      writeln('"ЧП" - ИСПОРЧЕНЫ КОРРЕКЦИИ');
      _GOTO 12561;
    _);
    corrStartIdx := 2;
    corrEndIdx := zoneBuffer@[1].i;
    (loop) _for searchIndex := corrStartIdx _to corrEndIdx _do _(
      _if sel(zoneBuffer@[searchIndex], 30, 15) = posSignature _then _(
        _exit loop
      _) _else _(
        corrStartIdx := searchIndex + 1;
      _)
    _); (* 5723 *)
    (loop) _for searchIndex := corrEndIdx _downto corrStartIdx _do _(
      _if sel(zoneBuffer@[searchIndex], 30, 15) = posSignature _then _(
        _exit loop
      _) _else _(
        corrEndIdx := searchIndex - 1;
      _)
    _)
  _); (* 5737 *)
  (loop) _for searchIndex := corrStartIdx _to corrEndIdx _do _(
    _if sel(zoneBuffer@[searchIndex], bitPosition, 3) = suggestedMove _then _(
      _exit loop;
    _) _else _(
      corrStartIdx := searchIndex + 1;
    _)
  _); (* 5754 *)
  (loop) _for searchIndex := corrEndIdx _downto corrStartIdx _do _(
    _if sel(zoneBuffer@[searchIndex], bitPosition, 3) = suggestedMove _then _(
      _exit loop
    _) _else _(
      corrEndIdx := searchIndex - 1;
    _)
  _); (* 5771 *)
  _if corrStartIdx > corrEndIdx _then _(
    useCorrections := false;
    exit
  _); (* 5774 *)
  bitPosition := bitPosition - 3;
  _if corrStartIdx = corrEndIdx _then _(
    entryPtr := ptr(corrStartIdx + ord(zoneBuffer));
    _if (curMoveNumber = 14) _or (sel(entryPtr@.i,bitPosition, 3) = 0) _then _(
      applyLearningCorrection := entryPtr@.i _mod 8;
      lockZone66;
      readDiskZone( 0, zoneCorrections );
      useCount := shift(entryPtr@.i, 45) + 1;
      _if useCount < 8 _then _(
        ins(entryPtr@, useCount, 45, 3);
        writeDiskZone( 0, zoneCorrections );
      _);
      unlockZone66;
    _)
  _);
_);

_procedure generateAIPhrase;
_label 6553, 7650, 7660;
_var
pckName:_array [0..1] _of alfa;  % Packed user name (first/last)
pitNum:integer;                  % Pit number for move analysis
rndChoice:integer;               % Random choice value
loopVar:integer;                 % General loop variable
oppositePit:integer;             % Opposite pit index
jinnStones:integer;              % Jinn's stone count after move
userStones:integer;              % User's stone count after move
phraseCategory:integer;          % Phrase category for tracking
moveType:integer;                % Move result type
hasSaid:boolean;                 % True if phrase already said
hasKalah:boolean;                % True if kalah move available
hasNonKalah:boolean;             % True if non-kalah move available
suffixChar:char;                 % Character suffix for output
posAfter:Position;               % Position after simulated move
unpName:_array [1..12] _of char; % Unpacked full name buffer
dateBuf:_array [1..6] _of char;  % Date/name unpacking buffer
_function chkRandom(range:integer):integer;
_var try:integer;
_(
  _if phraseCategory > 0 _then _(
   try := trunc(RANDOM * range) + 1;
   _if try _IN haveSaid[phraseCategory] _then _GOTO 6553;
   chkRandom := try;
   haveSaid[phraseCategory] := [try] + haveSaid[phraseCategory];
  _) _else _(
   phraseCategory := trunc(RANDOM * range) + 1;
   chkRandom := ;
  _)
_);

_procedure Dear;
_(
  _if knownGender = MASC _then write(', ДОРОГОЙ');
  _if knownGender = FEM _then write(', ДОРОГАЯ');
_);

_procedure maybeFeminine;
_(
  _if knownGender = FEM _then write(femEnding);
  write(excl:2);
_);

_function countEnding(number:integer):integer;
_(
  _if number >= 20 _then
    number := number _MOD 10;
  _select
    number = 1:;
    (number > 1) _and (number < 5): number := 2;
    true: number := 3
  _end;
  countEnding := number;
_);
_( (* generateAIPhrase *)
  hasSaid := false;
  posAfter := curPosition;
  moveType :=   exMvLogic(posAfter, seledMove );
  jinnStones := posAfter[jinn].pits[7].val;
  userStones := posAfter[user].pits[7].val;
  _if isTrainingGame _then _goto 7660;
  write(space:3);
  _if isFirstGame _then _(
    isFirstGame := false;
    unpck(dateBuf[1], userData.userBirthDate);
    userAge := ord(dateBuf[5]) * 10 + ord(dateBuf[6]);
    _if userAge > 0 _then _(
      pckName[1] :=   getDateStr;
      unpck(dateBuf[1], pckName[1]);
      userAge := ord(dateBuf[5]) * 10 + ord(dateBuf[6]) - userAge;
    _);
    pckName[0] := userData.userAccount;
    getUserName(pckName[0], pckName[1]);
    _select
      gamesPlayedToday = 0: write(' ПРИВЕТСТВУЮ ТЕБЯ, ');
      gamesPlayedToday = 1: write(' САЛАМ АЛЕЙКУМ, ');
      true:           write(' САЛАМ, ')
    _end;
    unpck(unpName[1], pckName[0]);
    unpck(unpName[7], pckName[1]);
    gndrMismatch := false;
    _if ((knownGender = MASC) _or (knownGender = FEM)) _and (userAge > 0) _then _(
      _select
        userAge < 20 : write('ЮН');
        userAge < 50 : write('УВАЖАЕМ');
        true: write('ПОЧТЕНН')
      _end;
      _if knownGender = MASC _then write('ЫЙ ')
      _else write('АЯ ');
    _);
    (loop) _for rndChoice := 1 _to 12 _do _(
      suffixChar := unpName[rndChoice];
      _if suffixChar = space _then _exit loop;
      write(suffixChar);
    _);

    pckName[0] := '      ';
    unpck(dateBuf[1], pckName[0]);
    _for loopVar := 1 _to 3 _do _(
    _if rndChoice - loopVar > 0 _then
      dateBuf[loopVar] := unpName[rndChoice - loopVar];
    _);
    _select
      knownGender = MASC :
      gndrMismatch := matchNchars( 'ОВА  4') _or
        matchNchars( 'ЕВА  4') _or
        matchNchars( 'ИНА  4') _or
        matchNchars( 'АЯ   3');
      knownGender = FEM :
      gndrMismatch := matchNchars( 'ОВ   3') _or
        matchNchars( 'ЕВ   3') _or
        matchNchars( 'ИН   3') _or
        matchNchars( 'ИЙ   3')
    _end;
    _select
      knownGender = MASC: write('-ХАН');
      knownGender = FEM: write('-ХАНУМ')
    _end;
    isMasterLevel := difficultyLevel = 4;
    _if isMasterLevel _and (knownGender = MASC) _then write(', ЭФЕНДИ');
    write('  !!');
    _goto 7650
  _);
% L6367
  _if gameIsDecided _then _(
    rndChoice :=   randint(8);
    _select
      rndChoice = 0: write('ПРОДОЛЖАТЬ НЕТ СМЫСЛА.');
      rndChoice = 1: write('ДАВАЙ КОНЧИМ.');
      rndChoice = 2: write('ТЕПЕРЬ УЖЕ НИЧЕГО НЕ ИЗМЕНИШЬ.');
      rndChoice = 3: write('НЕ БУДЕМ ТЕРЯТЬ ВРЕМЕНИ.')
    _end;
  _) _else (* 6414 *)
     _if (jinnStones > 36) _or (userStones > 36) _then _(
       gameIsDecided := true;
       _select
       jinnStones > 36 : _(
       _if difficultyLevel = 1 _then _(
         write('ЛЮБЛЮ ОБЫГРЫВАТЬ НОВИЧКОВ !');
         _goto 7660;
       _);
       rndChoice :=   randint( 5 );
       _select
         rndChoice = 0 : write('СЛАВА АЛЛАХУ - Я ВЫИГРАЛ !');
         rndChoice = 1 : write('Я УЖЕ ВЫИГРАЛ. ПОРА КОНЧАТЬ !');
         rndChoice = 2 : _(
           write('ТЫ ПРОИГРАЛ'); maybeFeminine;
           write('  ТЫ ПРОИГРАЛ');  maybeFeminine;  write('!!');
         _);
         rndChoice = 3 : write('НЕ ПЕЧАЛЬСЯ, УДАЧА БУДЕТ ЖДАТЬ ТЕБЯ ЗАВТРА !');
         true: _( write('СДАВАЙСЯ, ТЫ УЖЕ ПРОИГРАЛ'); maybeFeminine; _)
       _end
  _);
  (* 6465 *) userStones > 36 : (again) _(
    rndChoice :=   randint(8);
    _select
      rndChoice = 0 : write('СЛЕДУЮЩИЙ РАЗ ОБЯЗАТЕЛЬНО ВЫИГРАЮ !');
      rndChoice = 1 : write('НЕ ПОНИМАЮ, КАК ЭТО Я ПРОИГРАЛ . . .');
      rndChoice = 2 : write('ПОГОДИ !  СЛЕДУЮЩИЙ РАЗ Я ТЕБЕ ПОКАЖУ КАК НАДО ИГРАТЬ !');
      rndChoice = 3 : write('Я ПРОИГРАЛ - НЕПОНЯТНО . . .');
      rndChoice = 4 :  write('ШАЙТАН ТЕБЕ ДРУГ !!');
      rndChoice = 5 : _(
      _if (knownGender <> MASC) _or
         (userTotalScore - jinnTotalScore < 3) _or
         (difficultyLevel < 4) _then _goto again;
        write('О, ЭФЕНДИ, ТЫ ДОСТОИН ЗВАНИЯ ИМАМА !');
      _);
      rndChoice = 6 : _(
      _if difficultyLevel < 4 _then _goto again;
       write('ВЫИГРАЕШЬ У МЕНЯ 12 РАЗ ПОДРЯД - ПОЛУЧИШЬ ВОЛШЕБНОЕ КОЛЬЦО !');
      _);
      true:  _(
       write('О, ШАЙТАН !  ТЫ МЕНЯ ОБЫГРАЛ');  maybeFeminine;
     _)
     _end;
  _) _end  (* 6545 *)
  _) _else _( (* 6546 *)
  _if wordsSinceLastSpeak > 0 _then _(
    aiSilent := false;
    userSilent := ;
  _);
  _if aiSilent _then _goto 7660;
6553:
  phraseCategory := 0;
  rndChoice :=   chkRandom( 30 );
  _select
  (rndChoice < 6) _and (wordsSinceLastSpeak = 0) _and (totalMovesPlayed > 4): _(
    rndChoice :=   chkRandom( 6 );
    _if userSilent _then _(
      aiSilent := true;
      write('РАЗ ТЫ МОЛЧИШЬ, ТО И Я БУДУ МОЛЧАТЬ !');
      _goto 7660;
    _);
    write('ПОЧЕМУ');
    _select
      rndChoice < 4 : write(' НИЧЕГО НЕ ГОВОРИШЬ');
      true :          write(' МОЛЧИШЬ')
    _end;
    wordsSinceLastSpeak := 0;
    userSilent := true;
    Dear;
    write(qmark:2);
  _);
% 6611
   (rndChoice = 1) _and isNightTime : _(
     rndChoice :=   chkRandom( 2 );
     _select rndChoice = 1 : write('СХОДИ УМОЙСЯ ЛУННЫМ СВЕТОМ !');
                       true: write('ЗВЕЗДА АЛЬТАИР ВЗОШЛА, СДЕЛАЙ НАМАЗ.')
     _end;
   _); (* 6626 *)
   (rndChoice = 2) _and (jinnStones > userStones) : _(
     rndChoice :=   chkRandom( 1 );
     write('Я ПОКА ВЫИГРЫВАЮ');
   _); (* 6636 *)
   (rndChoice = 3) _and  (moveType = 2) : _(
     rndChoice :=   chkRandom( 3 );
     _select
       rndChoice = 1 : write('ЛЮБЛЮ ХОДИТЬ В КАЛАХ !');
       lastMoveResult = 2 : write('ЕЩЕ РАЗ В КАЛАХ - ХОРОШО !')
     _end;
   _); (* 6654 *)
   rndChoice = 4 : _(
     rndChoice :=   chkRandom( 6 );
     _select
       rndChoice = 1 : write('ДАВАЙ ОТЛОЖИМ, МНЕ ПОРА ДЕЛАТЬ НАМАЗ.');
       rndChoice = 2 : write('ЧЕЛОВЕК ПРОТИВ ДЖИННА НЕ УСТОИТ !');
       rndChoice = 3 : write('БУДУ ДУМАТЬ КРЕПЧЕ.');
       rndChoice = 4 : write('ПРИЯТНО ПОИГРАТЬ В КАЛАХ !');
       true: write('Х-ММ !')
     _end;
  _); (* 6704 *)
  (rndChoice = 5) _and (jinnStones > userStones) _and (lastJinnKalah <= lastUserKalah) : _(
    rndChoice :=   chkRandom( 7 );
    write('СЕЙЧАС У МЕНЯ БУДЕТ ');
    write(jinnStones:1);
    write(', А У ТЕБЯ ');
    write(userStones:1);
  _);
   (rndChoice = 6) _and (jinnStones < userStones) : _(
     rndChoice :=   chkRandom( 2 );
     write('Я КАЖЕТСЯ ПРОИГРЫВАЮ');
  _); (*  6734 *)
  (rndChoice = 7) _and (jinnStones < userStones - 6) : _(
    rndChoice :=   chkRandom( 2 );
    write('НЕУЖЕЛИ Я ПРОИГРАЮ ?');
  _); (* 6745 *)
  (rndChoice = 8) _and (abs(jinnStones - userStones) < 3) : _(
    rndChoice :=   chkRandom( 2 );
    write('ПОСМОТРИМ КТО ВЫИГРАЕТ ?');
  _); (* 6756 *)
  (rndChoice = 9) _and (jinnStones > userStones) : _(
    rndChoice :=   chkRandom( 1 );
    write('Я ТЕБЕ НЕ ГОРНЫЙ ГУЛЬ !');
  _); (* 6766 *)
  (rndChoice = 10) _and _not useOpeningBook : _(
    rndChoice :=   chkRandom( 3 );
    rndChoice := nodesThisMove;
    _if rndChoice = 0 _then rndChoice := 1;
    write('Я ПРОСМОТРЕЛ ', rndChoice:1, ' ПОЗИЦИ');
    rndChoice :=   countEnding( rndChoice );
    _select
      rndChoice = 1 : suffixChar := 'Ю';
      rndChoice = 2 : suffixChar := 'И';
      true : suffixChar := 'Й'
    _end;
    write(suffixChar, ', А ТЫ ?');
  _); (* 7024 *)
  (rndChoice = 11) _and (userStones - jinnStones > 4) : _(
    rndChoice :=   chkRandom( 1 );
    write('КАК БЫ ТЫ МЕНЯ НЕ ОБЫГРАЛ'); maybeFeminine;
  _); (* 7036 *)
  (rndChoice = 12) _and (curThinkTime > 1000) : _(
    rndChoice :=   chkRandom( 2 );
    write('ОЧЕНЬ ДОЛГО ДУМАЕШЬ');
    Dear;
    write(excl:2);
  _); (* 7051 *)
  (rndChoice = 13) _and isMasterLevel _and ((knownGender = MASC) _or (knownGender = FEM)) : _(
    rndChoice :=   chkRandom( 6 );
    write('НЕТ ТЕБЕ РАВНО');
    _if knownGender = FEM _then write('Й') _else write('ГО');
    write(' СРЕДИ ');
    _select
      rndChoice = 1 : write('АРАБОВ');
      rndChoice = 2 : write('МАВРОВ');
      rndChoice = 3 : write('БЕДУИНОВ');
      rndChoice = 4 : write('ЧЕРНОКОЖИХ');
      rndChoice = 5 : write('ТУАРЕГОВ');
      true: write('ЭФИОПОВ')
    _end;
    write(excl:2);
  _); (* 7125 *)
  (rndChoice = 14) _and (moveType <> 2) _and bookIsActive _and  (uncertaintyBits > 0) : _(
    rndChoice :=   chkRandom( 1 );
    write('КАЖЕТСЯ Я ДЕЛАЮ ПЛОХОЙ ХОД.');
  _); (* 7140 *)
  (rndChoice > 14) _and (rndChoice < 17) _and (jinnStones - lastJinnKalah > 4) : _(
    rndChoice :=   chkRandom( 5 );
    write('Я ВЫИГРАЛ ', (jinnStones - lastJinnKalah):1, ' КАМНЕЙ !');
  _); (* 7157 *)
  rndChoice = 17 : _(
    rndChoice :=   chkRandom( 9 );
    _select
    rndChoice = 1 : write('ЗНАЙ НАШИХ !');
    rndChoice = 2 : write('УФФ-УФФ !!');
    (rndChoice = 3) _and (knownGender = FEM) _and (userAge < 25) _and (userAge > 0) :
                    write('ТЫ, НАВЕРНОЕ, ТОНКА, КАК КИПАРИС !');
    rndChoice = 4 : write('СОВЕРШИ МОЛИТВУ В ТРИ РАКАТА !');
    (rndChoice = 5) _and  (knownGender = FEM) _and (userAge < 22) _and (userAge > 0) :
                    write('ХОТЕЛ БЫ ПОСМОТРЕТЬ НА ТЕБЯ, ДОРОГАЯ !');
    rndChoice = 6 : write('Я ЗНАЮ ВЕЛИЧАЙШЕЕ ИЗ 99 ИМЕН АЛЛАХА !');
    rndChoice = 7 : write('ПЕЧАТЬ СОЛОМОНА МНЕ НЕ СТРАШНА !');
    rndChoice = 8 : write('КУПИ СЕБЕ ВЕРБЛЮДА !');
    true:           write('АЛЛАХ ВЕЛИК !!!')
    _end
    _); (* 7241 *)
    (rndChoice = 18) _and (userStones - lastUserKalah > 10) : _(
      rndChoice := chkRandom( 1 );
      write('КАКОЙ УДАР ТЫ МНЕ НАНЕС');
      _if knownGender = FEM _then write('ЛА');
      write(excl:2);
    _);
    (rndChoice = 19) _and gndrMismatch _and (totalMovesPlayed > 16) : _(
      rndChoice :=   chkRandom( 1 );
      _select
      knownGender = MASC : write('Я ДУМАЮ, ТЫ ВСЕ-ЖЕ ХАНУМ.');
      knownGender = FEM  : write('Я ДУМАЮ, ВСЕ-ЖЕ ТЫ НЕ ХАНУМ.')
      _end
    _); (* 7276 *)
    (rndChoice = 20) _and (curThinkTime > 300) : _(
      rndChoice :=   chkRandom( 6 );
      write('ТЫ ДУМАЛ');
      _if knownGender = FEM _then write(femending);
      rndChoice := (curThinkTime + 25) _DIV 50;
      write(space, rndChoice:1, ' СЕКУНД');
      rndChoice :=   countEnding( rndChoice );
      _select
        rndChoice = 1 : suffixChar := 'У';
        rndChoice = 2 : suffixChar := 'Ы';
        rndChoice = 3 : suffixChar := space
      _end;
      write(suffixChar, excl:2);
    _); (* 7340 *)
    (rndChoice = 21) _and (userStones - jinnStones > 10) _and  (difficultyLevel > 3) : _(
      rndChoice :=   chkRandom( 1 );
      write('СДАВАЙСЯ, ПОДАРЮ ТЕБЕ ');
      _if userStones - jinnStones > 15 _then write('ВЕРБЛЮДА !')
      _else write('БУХАРСКУЮ ДЫНЮ !');
    _); (* 7361 *)
    (rndChoice = 22) _and (moveType <> 2) : _(
      rndChoice :=   chkRandom( 2 );
      (loop) _for loopVar := 1 _to 6 _do _(
        rndChoice := posAfter[user].pits[loopVar].val;
        _if rndChoice > 0 _then _(
          pitNum := rndChoice + loopVar;
          oppositePit := 7 - pitNum;
          _if (pitNum < 7) _and
              (posAfter[user].pits[pitNum].val = 0) _and
              (posAfter[jinn].pits[oppositePit].val <> 0) _then _(
            rndChoice :=   chkRandom( 4 );
            _select
            rndChoice < 1: write('НЕ БЕРИ МОЮ ', oppositePit:1, ' ЛУНКУ.');
            true: _(
              write('ВОЗЬМИ МОЮ ', oppositePit:1, ' ЛУНКУ - Я ');
              _if rndChoice = 2 _then write('НАРОЧНО ');
              write('ПОДСТАВИЛ.') _)
            _end;
            _exit loop
          _)
        _)
      _);
    _); (* 7436 *)
    (rndChoice = 23) _and (difficultyLevel > 2) : _(
      rndChoice :=   chkRandom( 8 );
      _select
        rndChoice = 1 : write('КРАСНЫЕ ');
        rndChoice = 2 : write('ЧЕРНЫЕ ')
      _end;
      _if rndChoice < 3 _then write('ДЖИННЫ ОЧЕНЬ ОПАСНЫ !');
    _); (* 7457 *)
    rndChoice = 24 : _(
      rndChoice :=   chkRandom( 8 );
      _select
       rndChoice = 1 : write('ПРОШУ ТЕБЯ, НЕ ГОВОРИ "БИСМИЛЛА РАХМАН РАХИМ" !');
       (rndChoice < 4) _and (userAge > 0) _and (userAge < 30) : _(
        _if rndChoice = 2 _then write('Я ДУМАЮ ') _else write('НАВЕРНОЕ ');
        write('МАХАББА ТЕБЕ НЕ НУЖНА.');
       _);
       (rndChoice = 4) _and (userAge > 30) :
          write('ЕСЛИ ТЕБЕ НУЖНА МАХАББА, СООБЩИ МНЕ ОБ ЭТОМ.')
      _end
   _); (* 7514 *)
   (rndChoice = 25) _and (difficultyLevel > 2) _and (jinnStones - userStones > 10) : _(
    rndChoice :=   chkRandom( 2 );
    write('ВЫИГРАЕШЬ - ');
    _if rndChoice = 1 _then  write('ПОЛУЧИШЬ ТАМРИД.')
    _else write('ДАМ ТЕБЕ ТЕТВИФ.');
  _); (* 7534 *)
  (rndChoice = 26) _and (knownGender = MASC) _and (difficultyLevel > 2) _and (totalMovesPlayed > 5) : _(
    rndChoice :=   chkRandom( 6 );
    _select
      rndChoice = 1 : write('СКАЖИ МНЕ, ЛАЛЛА МИРА');
      rndChoice = 2 : write('СОЗНАЙСЯ, АЙША КАДЕША')
    _end;
    _if rndChoice < 3 _then write(' С ТОБОЙ НЕ ВСТРЕЧАЛАСЬ ?');
  _); (* 7560 *)
  moveType <> 2 : _(
    oppositePit := 0;
    hasKalah := ;
    hasNonKalah := ;
    _for loopVar := 1 _to 6 _do _(
      rndChoice := posAfter[user].pits[loopVar].val;
      _if rndChoice > 0 _then _(
        pitNum := rndChoice + loopVar;
        oppositePit := oppositePit + 1;
        _if (pitNum = 7) _or (pitNum = 20) _then hasKalah := true
        _else hasNonKalah := true;
      _)
    _); (* 7605 *)
    rndChoice :=   chkRandom( 4 );
   _select
    oppositePit = 1 : _select
     rndChoice = 1 : write('НЕЧЕГО ДУМАТЬ - ХОДИ !');
     rndChoice = 2 : write('ТЕПЕРЬ ТЕБЕ ДУМАТЬ НЕЧЕГО - ХОДИ !');
     true: write('У ТЕБЯ ВСЕГО ОДИН ХОД.')
      (* 7624 *)
     _end;
     hasKalah _and hasNonKalah : _select
       rndChoice = 1 : write('НЕ СОВЕТУЮ ХОДИТЬ В КАЛАХ.');
       rndChoice = 2 : write('СОВЕТУЮ ПОЙТИ В КАЛАХ.');
       rndChoice = 3 : write('НА ХОД В КАЛАХ ОСОБЕННО НЕ НАДЕЙСЯ.');
       true: write('ПОСМОТРЮ, ПОЙДЕШЬ ЛИ В КАЛАХ ?')
     _end
    (* 7647 *)
  _end
   _)
  _end;
7650:
  _if hasSaid _then _goto 7660;
  code(СЧ75205=); rndChoice := ;
  code(СЧ75224=); loopVar := ;
  hasSaid := true;
  _if rndChoice + 1 = loopVar _then _goto 6553;
 _);
7660:
 _if lastMoveResult = 2 _then writeCharNTimes( delay, animDelay * 4 );
 flushOutput;
 curThinkTime := 0;
 lastMoveResult := moveType;
 lastJinnKalah := jinnStones;
 lastUserKalah := userStones;
_);
_procedure procInputChars;
_var u:integer;
_(
  reset(INP);
  inputLength := 5;
  _while (INP@ _in digit) _or (INP@ = ',') _or (INP@ = space) _do _(
    get(INP);
    inputLength := inputLength + 1;
  _);
  _while (INP@ <> charEtx) _do _(
    _if INP@ <> space _then wordsSinceLastSpeak := wordsSinceLastSpeak + 1;
    inputLength := inputLength + 1;
    get(INP);
  _);
  _if inputLength = 7 _then inputLength := 8;
_);
_procedure sigRestore;
_(
  oldHandler := oldHandler;
  code(7ПА3=Э050103,ВИ7=Э050102,)
_);
_procedure dsplGameHeader;
_label 10017;
_var c:char;
_(
  writeTerminalOutput;
  write((gamesPlayedToday + 1):1);
  dsplTitle;
  write(space:25);
  writeJinnName;
  write(jinnTotalScore:4);
  write(userTotalScore:7);
  write(space:3);
  writeUserName;
  _select
    difficultyLevel = 1 : c := 'Ю';
    difficultyLevel = 2 : c := 'K';
    difficultyLevel = 3 : c := 'У';
    difficultyLevel = 4 : c := 'Э'
  _end;
  write(c:3);
  writeTerminalOutput;
  _if (jinnTotalScore + userTotalScore >= 255) _and  _not isTrainingGame _then _(
    writeTerminalOutput;
    write('В А Ш   Т У Р Н И Р   О К О Н Ч Е Н':54);
10017:
    writeTerminalOutput;
    sigrestore;
    _GOTO 12561;
  _);
  _select
    isResumedGame : write('ПРОДОЛЖЕНИЕ ОТЛОЖЕННОЙ ПАРТИИ':51);
    gamesPlayedToday >= 5 : _(
      writeTerminalOutput;
      write('СЕГОДНЯ ИГРАТЬ БОЛЬШЕ НЕ БУДУ':51);
      _goto 10017
    _)
  _end;
  _if isTrainingGame _then
    write('Т Р Е Н И Р О В О Ч Н А Я':49)
  _else _if (25 _IN userData.systemFlags) _and (userData.tempSet * [3,6] = []) _then _(
    writeTerminalOutput;
    write('ТУРНИР ДЛЯ ВАС ЗАКРЫТ':47);
    _goto 10017
  _);
  echoSaved := userData.echo;
  userData.echo := false;
  code(СЧ13=ЗЧ76013,); (* C/2013 := 1; ??? *)
  write(lf, lf, lf);
  dsplBoard(pckPosition);
  writeCharNTimes(up, 2);
  writeTerminalOutput;
_);

_function compareScoreEntries(idx1, idx2:integer):boolean;
_var
entry1:integer;     % First score entry from zone buffer
entry2:integer;     % Second score entry from zone buffer
wins1:integer;      % Jinn wins from first entry
loss1:integer;      % Jinn losses from first entry
wins2:integer;      % Jinn wins from second entry
loss2:integer;      % Jinn losses from second entry
cross1:integer;     % Cross product for win rate comparison
cross2:integer;     % Cross product for win rate comparison
total1:integer;     % Total games from first entry
total2:integer;     % Total games from second entry
level1:integer;     % Difficulty level from first entry
level2:integer;     % Difficulty level from second entry
result:boolean;     % Comparison result
_(
  entry1 := zoneBuffer@[idx1].i;
  entry2 := zoneBuffer@[idx2].i;
  level1 := sel(entry1, 24, 4);
  level2 := sel(entry2, 24, 4);
  _if level1 <> level2 _then _(
    result := level1 > level2;
  _) _else _(
    wins1 := sel(entry1, 8, 8);
    loss1 := sel(entry1, 0, 8);
    total1 := loss1 + wins1;
    _if total1 = 0 _then _(
      compareScoreEntries := false;
      exit
    _); (* 10135 *)
    wins2 := sel(entry2, 8, 8);
    loss2 := sel(entry2, 0, 8);
    total2 := loss2 + wins2;
    _if total2 = 0 _then
      result := true
    _else _( (* 10145 *)
      cross1 := wins1 * total2;
      cross2 := wins2 * total1;
      _if cross1 = cross2 _then _(
        _if cross1 = 0 _then _(
          result := loss1 < loss2;
        _) _else _(
          result := ((wins1 > loss1) _and (wins1 > wins2)) _or
                    ((wins1 < loss1) _and (wins1 < wins2));
        _)
      _) _else _( (* 10175 *)
        result := cross1 > cross2;
      _)
    _)
  _); (* 10202 *)
  compareScoreEntries := result;
  _if result _then _(
    zoneBuffer@[idx1].i := entry2;
    zoneBuffer@[idx2].i := entry1;
  _);
_);

_( (* playGameSession *)
  checkGameSchedule;
  RAND0;
  rndnessFactor := 100;
  isFirstGame := true;
  maxNodesToSearch := million;
  oneOverLn2 := 1.0 / LN(2);
  nodesSearched := 0;
  jinnThinkingTime := ;
  userThinkingTime := ;
  inputTicks := ;
  movesInBuffer := ;
  openingBookIndex := ;
  posSignature := ;
  alphaBetaCutoffs := ;
  uncertaintyBits := ;
  bookIsActive := ;
  resultChar := ;
  deepenCount := ;
  jinnWins := ;
  userWins := ;
  testMode := ;
  cursorCol := ;
  gameIsDecided := ;
  postponeFlag := ;
  allowExit := ;
  inputLength := ;
  useOpeningBook := ;
  useCorrections := ;
  corrStartIdx := ;
  hasWarned := ;
  aiSilent := ;
  userSilent := ;
  lastJinnKalah := ;
  lastUserKalah := ;
  movesPending := ;
  totalEntropy := ;
  wordsSinceLastSpeak := ;
  charIndex := 1;
  curMoveNumber := ;
  enableLogging := true;
  isTrainingGame := INP@ = 'T';
  _if 27 _IN userData.systemFlags _then _(
  _if isTrainingGame _then _(
    levelChoice := 0;
    startPlayer := 2;
    cmdResult :=   readCommand(cmdString, 3 );
    10266: _select
    INP@ _in letter : _select
      INP@ = 'Ю' : levelChoice := 1;
      INP@ = 'К' : levelChoice := 2;
      INP@ = 'У' : levelChoice := 3;
      INP@ = 'Э' : levelChoice := 4;
      INP@ = 'Д' : startPlayer := 1;
      INP@ = 'П' : startPlayer := 0;
      true: _goto 999
    _end;
    INP@ = charEtx :;
    true : _( 999: writeln('НЕПОНЯТНО'); exit _)
    _end;
     (* 10331 *)
    cmdResult := readCommand(cmdString, 3);
    _if INP@ <> charEtx _then _goto 10266;
    _if (levelChoice = 0) _or (startPlayer = 2) _then _(
      _select
        levelChoice = 0 : writeln('КАТЕГОРИЯ ? <Ю,К,У,Э>');
        startPlayer = 2 : writeln('КТО НАЧИНАЕТ ? <ДЖИН,ПОЛЬЗ>')
      _end;
      readTerminalInput(false);
      _goto 10266
  _)
    _) _else _( (* 10361 *)
    writeln('ТУРНИР ЗАКРЫТ');
   _GOTO 12561;
  _)
  _); (* 10366 *)
  knownGender := shift(userData.userGender, 46);
  defWeights := [0, 572, 136, 16, 53, 33, 110, 80];
  weights := defWeights;
  mask1 := '    00';
  mask2 := '{377{3770000';
  mask3 := '  {377{377{3770';
  acctCopy := userData.userAccount;
  code(2СБ3=); acctCopy := ;
  dataPtr := ref(packedData);
  startTickCount := remainingCPUTime;
  code(СЧ=Э06255,); oldHandler := ;
  code(7ПАОБРАБ=ВИ7,Э050103=,СЧ=Э050102,ВИ1=7ЗЧ1,ВИ2=7ЗЧ2,ВИ17=7ЗЧ3,ВИ13=7ЗЧ4,ПБЧЕРЕЗ=,ОБРАБ:7ПАОБРАБ=7ПБ5,С;0,0,0,0,К;7СЧ1=УИ1,7СЧ2=УИ2,7СЧ3=УИ17,7СЧ4=УИ13,СЧ=УИ10,СЧ=ЗЧ76013,РА3=);
  allowExit := true;
  gamesPlayedToday := 5;
  _if isTrainingGame _then _goto 12341 _else _goto 11252;
  code(ЧЕРЕЗ:);
  _if INP@ = 'B' _then _(
    verifyAdminPrivileges;
    get(INP);
    isResumedGame := false;
    enableLogging := ;
    hasScore := ;
    jinnTotalScore := ;
    userTotalScore := ;
    gamesPlayedToday := ;
    testMode := true;
    _for currentPlayer := 0 _to 1 _do
    _for loopIndex := 0 _to 7 _do
      curPosition[currentPlayer].pits[loopIndex].val := getDigit(10);
    difficultyLevel := getDigit( 10 );
    totalMovesPlayed := getDigit( 10 );
    packPosition(curPosition, pckPosition);
    dsplGameHeader;
  _) _else _( (* 10517 *)
    lockZone66;
    readDiskZone( nu, zonePlayers );
    usedSlots := zoneBuffer@[3].s;
    freeSlots := ;
    numScoreEntries := zoneBuffer@[1].i;
    hasScore := false;
    isResumedGame := ;
    isNewGame := ;
    (loop) _while _not isTrainingGame _and extractMinElement(savedGameSlot, usedSlots) _do _(
      slotPtr := ptr(savedGameSlot * 21 + 64004C);
      _if (slotPtr@.i = 7) _and isInLargeSet( userData.userId, slotPtr@.ls) _then _(
        freeSlots := freeSlots - [savedGameSlot];
        zoneBuffer@[3] := ;
        isResumedGame := true;
        isNewGame := ;
        writeDiskZone( nu, zonePlayers );
        _exit loop
      _);
    _); (* 10565 *)
    unlockZone66;
    _if isResumedGame _then _(
      totalMovesPlayed := sel(slotPtr@.log[4], 8, 8);
      pckPosition[0].a :=   decodePos( slotPtr@.log[1], slotPtr@.log[2] );
      pckPosition[1].a :=   decodePos( slotPtr@.log[3], slotPtr@.log[4] );
      loopIndex := 4;
      _for currentPlayer := 5 _to 12 _do _(
        logPacked[currentPlayer] := slotPtr@.log[currentPlayer];
        cmdString := ;
        _if cmdString <> spaces _then loopIndex := currentPlayer;
      _);
    _) _else _(
      pckPosition[0].i := 60606060606000C;
      pckPosition[1].i := 1060606060606000C;
      totalMovesPlayed := 1;
    _); (* 10624 *)
    _for entryIndex := 1 _to numScoreEntries _do _(
      scoreEntry := zoneBuffer@[1008 - entryIndex].a;
      code(2ЛУ4=2ЗЧ11,);
      _if cmdString = acctCopy _then _(
        hasScore := true;
        code(2сч7=пбнашел,);
      _);
    _);
    scoreEntry := '001000';
    code(нашел:сд/-20/=2зч10,2рб5=2зч7,);
    unpck(dataPtr@[1], scoreEntry);
    savedLevel := difficultyLevel;
    currentPlayer := packedData.i;
    gamesPlayedToday := currentPlayer _div 2;
    packedData.i := currentPlayer _mod 2;
    unpPosition(curPosition, pckPosition);
    _if _not isResumedGame _and hasScore _then _(
      curPosition[jinn].move.b := packedData.b;
      curPosition[user].move.b := _not packedData.b;
    _);
    _if isTrainingGame _and (userData.systemFlags * [27] = [27]) _then _(
      difficultyLevel := levelChoice;
      curPosition[jinn].move.i := startPlayer;
      curPosition[user].move.i := 1 - startPlayer;
    _); (* 10674 *)
    dsplGameHeader;
    updateStatistics( 6 );
  _); (* 10677 *)
  moveResult := 0;
  lastMoveResult := ;
  animDelay := animSpeed + 1 - difficultyLevel _div 2;
  _if animDelay < 0 _then animDelay := 0;
  _select
    difficultyLevel = 1 : _( searchDepth := 2; maxNodesToSearch := 37 _);
    difficultyLevel = 2 : _( searchDepth := 2; maxNodesToSearch := 600 _);
    difficultyLevel > 2 : _( searchDepth := 4; maxNodesToSearch := 2500; useOpeningBook := true _)
  _end; (* 10723 *)
 _if isResumedGame _or testMode _then _(
   useOpeningBook := false;
   _if testMode _then  enableLogging := false;
  _); (* 10731 *)
  _if isTrainingGame _then enableLogging := false;
  enableLogging := enableLogging _and (difficultyLevel > 2);
  _if enableLogging _then _(
    initializeLog;
    _if isResumedGame _then logIndex := (loopIndex + 1)
    _else _(
      logChar( chr(difficultyLevel) );
      logChar( space );
      _if curPosition[user].move.i = 0 _then logChar('Д')
      _else logChar('П');
      logChar( space );
    _)
  _); (* 10761 *)
  _if useOpeningBook _then _(
    readDiskZone( 0, zoneOpeningBook );
    _if zoneBuffer@[35].a <> '!ДЕБЮТ' _then _(
      writeln('ИСПОРЧЕНЫ ДЕБЮТЫ - "ЧП" !!');
      _GOTO 12561;
    _)
  _); (* 10773 *)
10773:
  _if checkRemainingTime _then _if isTrainingGame _then _(
      _goto 12341;
    _) _else _( (* 11000 *)
    _goto 11225;
  _); (* 11001 *)
  currentPlayer := curPosition[user].move.i;
  _if currentPlayer = jinn _then _(
    writeCharNTimes( up, 7 );
    write('МОЙ ХОД:');
    writeTerminalOutput;
  _) _else _if movesInBuffer = 0 _then _(
    writeCharNTimes( down, 2 ); (* this must cause scrolling if needed *)
    write('ВАШ ХОД:');
    upLines := 5;
    writeTerminalOutput;
  _) _else
    upLines := 1;
  (* 11024 *)
  userFinalKalah := 0;
  _if currentPlayer = user _then _(
11027:
  _if movesInBuffer < 1 _then _(
  _if inputLength > 6 _then _(
    writeCharNTimes( space, inputLength );
    writeCharNTimes( up, 1 );
    writeTerminalOutput;
  _); (* 11040 *)
  inputTicks :=   wallClockTicks;
  readTerminalInput(false);
  curThinkTime := wallClockTicks - inputTicks;
  _if curThinkTime < 0 _then curThinkTime := 50;
% 11052
  movesPending := readCommand( commandEntered, 3 );
  postponeFlag := (commandEntered = 'SLЕ   ') _and (47 _IN userData.systemFlags);
  reset(INP);
  _if postponeFlag _then _(
    _if isTrainingGame _then _goto 12341 _else _goto 11225;
  _);
  userThinkingTime := userThinkingTime + curThinkTime;
  movesInBuffer := 0;
% 11076
  _while (INP@ _in digit) _and (movesInBuffer < 10) _do _(
    movesInBuffer := movesInBuffer + 1;
    moveBuffer[movesInBuffer] := INP@;
    get(INP);
    _if (INP@ = ',') _or (INP@ = space) _then
    get(INP);
  _); (* 11115 *)
  _if movesInBuffer = 0 _then _(
    movesInBuffer := 1;
    moveBuffer[1] := chr(0);
  _);
  _) _else _goto 11772; (* 11123 *)
  _if readCommand(inputCmd, 3) _then _(
    _if matchesCommand( 'СДА   ') _then _(
      jinnFinalKalah := curPosition[jinn].pits[7].val;
      userFinalKalah := curPosition[user].pits[7].val;
      _if (jinnFinalKalah > userFinalKalah) _or (jinnFinalKalah > 36) _or
          (userFinalKalah > 36) _or isTrainingGame _then _(
11142:
        writeCharNTimes(down, 2 );
        write('ИГРА ОКОНЧЕНА');
        _goto 12244;
      _) _else
        _goto 11225;
    _); (* 11150 *)
    _if matchesCommand( 'ПОВ   ') _then _(
      write(erase);
      packPosition(curPosition, pckPosition);
      dsplGameHeader;
      movesInBuffer := 0;
      inputLength := ;
      cursorCol := ;
      _goto 10773;
    _); (* 11164 *)
    _if matchesCommand( 'ОТЛ   ') _or matchesCommand( 'КОН   ') _then _(
      _if isTrainingGame _then _(
      _if matchesCommand( 'ОТЛ   ') _then _(
        write('ТРЕНИРОВОЧНЫЕ НЕ ОТКЛАДЫВАЮТСЯ');
        writeTerminalOutput;
      _);
      _goto 12240;
    _);
    _if totalMovesPlayed < 5 _then _(
      _if hasWarned _then _(
        write('НЕСЕРЬЕЗНО !');
        writeTerminalOutput;
        userData.permFlags := userData.permFlags + [30];
        exit
      _) _else _(
        hasWarned := true;
        write('МЫ ЖЕ ТОЛЬКО НАЧАЛИ !');
        movesInBuffer := 0;
        _goto 12013
      _)
    _); (* 11216 *)
    jinnFinalKalah := curPosition[jinn].pits[7].val;
    userFinalKalah := curPosition[user].pits[7].val;
    _if (jinnFinalKalah > 36) _or (userFinalKalah > 36) _then _goto 11142;
11225:
    writeCharNTimes(down, 2 );
    writeTerminalOutput;
    userData.echo := echoSaved;
    _if userData.echo _then _(
      userFinalKalah := 2;
      code(ЗЧ76013=);
      packPosition(curPosition, pckPosition);
      dsplBoard(pckPosition);
      userFinalKalah := 3;
      code(ЗЧ76013=,);
  _); (* 11246 *)
  write('ИГРА ОТЛОЖЕНА');
  writeTerminalOutput;
11252:
  isResumedGame := true;
  lockZone66;
  readDiskZone( nu, zonePlayers );
  usedSlots := zoneBuffer@[3].s;
  numScoreEntries := zoneBuffer@[1].i;
  freeSlots := usedSlots _mod [0..47];
  _if extractMinElement(savedGameSlot, freeSlots) _then _(
  _if savedGameSlot > 35 _then _(
    unlockZone66;
    write('ОТЛОЖИТЬ ИГРУ НЕ УДАЛОСЬ');
    writeTerminalOutput;
  _goto 12341;
  _); (* 11300 *)
  slotPtr := ptr(savedGameSlot * 21 + 64004C);
  usedSlots := usedSlots + [savedGameSlot];
  zoneBuffer@[3] := ;
  slotPtr@.i := 7;
  clearLargeSet( slotPtr@.ls );
  addToLargeSet( userData.userId, slotPtr@.ls );
  savedGameSlot := dateStringToInt(   getDateStr  );
  slotPtr@.date := ;
  savedGameSlot := addDaysToDate( savedGameSlot, 7 );
  slotPtr@.expires := ;
  currentPlayer := 0;
% 11335
  _while currentPlayer <= 1 _do _(
    _for loopIndex := 1 _to 8 _do _(
      posEnc[loopIndex] := chr(curPosition[currentPlayer].pits[loopIndex-1].val);
    _);
    _for loopIndex := 9 _to 12 _do _(
      posEnc[loopIndex] := space;
    _);
    posEnc[11] := chr(totalMovesPlayed);
    pck(posEnc[1], slotPtr@.log[currentPlayer*2+1]);
    pck(posEnc[7], slotPtr@.log[currentPlayer*2+2]);
    currentPlayer := currentPlayer + 1;
  _);
% 11374
  _for loopIndex := 5 _to 12 _do
    slotPtr@.log[loopIndex] := spaces;
  _if enableLogging _then _(
    _while charIndex <> 1 _do
      logChar(space);
    _if logIndex < 14 _then _(
      _for loopIndex := 5 _to logIndex - 1 _do
        slotPtr@.log[loopIndex] := logPacked[loopIndex];
    _) _else
      slotPtr@.log[5] := 'ПРОД: ';
  _);
11426:
  statsPtr := ptr(difficultyLevel * 12 + 65354C);
  _if _not isResumedGame _and _not isNewGame _and _not isTrainingGame _then _(
    statsPtr@[0].i := statsPtr@[0].i + 1;
    statsPtr@[1].i := remainingCPUTime  + statsPtr@[1].i - startTickCount;
    statsPtr@[2].i := statsPtr@[2].i + jinnThinkingTime;
    statsPtr@[3].i := statsPtr@[3].i + userThinkingTime;
    statsPtr@[4].i := round(totalEntropy * oneOverLn2) + statsPtr@[4].i;
    statsPtr@[5].i := statsPtr@[5].i + nodesSearched;
    statsPtr@[6].i := statsPtr@[6].i + totalMovesPlayed;
    statsPtr@[7].i := statsPtr@[7].i + alphaBetaCutoffs;
    statsPtr@[8].i := statsPtr@[8].i + deepenCount;
    statsPtr@[9].i := statsPtr@[9].i + jinnWins;
    statsPtr@[10].i := statsPtr@[10].i + userWins;
  _); (* 11473 *)
  _if isTrainingGame _then statsPtr@[11].i := statsPtr@[11].i + 1;
  _for entryIndex := 1 _to numScoreEntries _do _(
    scoreEntry := zoneBuffer@[1008 - entryIndex].a;
    code(2ЛУ4=); cmdString := (* scoreEntry & mask2 *);
    _if cmdString = acctCopy _then _(
      code(2СЧ7=СД/-20/,2ЗЧ11=2РБ5,); (* cmdString := scoreEntry << 16; *)
      scoreEntry := (* cmdString unp mask3; *) ;
      unpck(dataPtr@[1], scoreEntry);
      currentPlayer := packedData.i;
      gamesPlayedToday := currentPlayer _div 2;
      packedData.i := currentPlayer _mod 2;
      _if cmdString <> scoreCheck _then gamesPlayedToday := 5;
      _goto 11531;
    _)
  _);
% 11527
  entryIndex := numScoreEntries + 1;
  numScoreEntries := ;
11531:
  _if entryIndex > 210 _then  hasScore := false
  _else _(
    hasScore := true;
    zoneBuffer@[1].i := numScoreEntries;
    insertPos := 1008 - entryIndex;
    _if isTrainingGame _then _goto 11616;
    jinnTotalScore := jinnTotalScore + jinnWins;
    userTotalScore := userTotalScore + userWins;
    _if (difficultyLevel = 1) _and (userTotalScore > jinnTotalScore) _then _(
      difficultyLevel := 2;
      jinnTotalScore := 0;
      userTotalScore := ;
      writeln('ПЕРЕХОД В КАНДИДАТЫ - СЧЕТ ОБНУЛЕН':52);
    _);
    _if (difficultyLevel = 2) _and (userTotalScore > jinnTotalScore) _then _(
      difficultyLevel := 3;
      jinnTotalScore := 0;
      userTotalScore := ;
      writeln('ПЕРЕХОД В УЧАСТНИКИ - СЧЕТ ОБНУЛЕН':52);
    _);
    _if userTotalScore + jinnTotalScore >= 25 _then _(
      _if (difficultyLevel = 3) _and (userTotalScore > jinnTotalScore) _then _(
        difficultyLevel := 4;
        writeln('ПЕРЕХОД В "ЭФЕНДИ"':45);
      _);
      _if (difficultyLevel = 4) _and (jinnTotalScore > userTotalScore) _then _(
        difficultyLevel := 3;
        writeln('ПЕРЕХОД В УЧАСТНИКИ':45);
      _);
    _);
% 11611
    _if isResumedGame _then resumeCount := resumeCount + 1
    _else packedData.b := _not packedData.b;
11616:
    gamesPlayedToday := gamesPlayedToday + 1;
    _if isTrainingGame _then _(
      gamesPlayedToday := gamesPlayedToday + 1;
      difficultyLevel := savedLevel;
    _);
    _if gamesPlayedToday > 5 _then gamesPlayedToday := 5;
% 11626
    currentPlayer := packedData.i;
    packedData.i := gamesPlayedToday * 2 + currentPlayer;
    pck(dataPtr@[1], scoreEntry);
    code(2сч7=2сб5,сд/20/=2лс6,17зч=2сч53,1ас35=17зч,17ик=иа,);
    code(15па=17сч,15зч=);
    scorePos := 1008 - 2;
    (loop) _for currentPlayer := insertPos _to scorePos _do _(
      _if _not compareScoreEntries( currentPlayer, currentPlayer + 1) _then _exit loop;
    _); (* 11655 *)
    _if 28 _IN userData.permFlags _then _(
      _repeat
        cmdResult := true;
        _for currentPlayer := 1008 - numScoreEntries _to scorePos _do _(
          _if compareScoreEntries( currentPlayer, currentPlayer + 1) _then cmdResult := false;
        _);
      _until cmdResult;
      userData.permFlags := userData.permFlags - [28];
    _) _else _(
       scorePos := 1008 - numScoreEntries + 1;
       (loop) _for currentPlayer := insertPos _downto scorePos _do _(
         _if _not compareScoreEntries( currentPlayer - 1, currentPlayer) _then _exit loop;
       _);
     _)
    _); (* 11712 *)
    _if (hasScore _or isResumedGame) _and _not testMode _then
      writeDiskZone( nu, zonePlayers );
% 11721
    _if enableLogging _and _not isResumedGame _and (11 _IN userData.systemFlags) _then _(
      _while charIndex <> 1 _do logChar(space);
      unpck(unpLog[1], logPacked[5]);
      unpLog[2] := resultChar;
      pck(unpLog[1], logPacked[5]);
      saveLogToZone;
    _); (* 11741 *)
    unlockZone66;
    _if _not isTrainingGame _then _(
    _if _not hasScore _then
      write('БУДЕМ ИГРАТЬ БЕЗ СЧЕТА')
    _else _(
      write('СЧЕТ ');
      _if (jinnFinalKalah = userFinalKalah) _or isResumedGame _then write('ОСТАЛСЯ  ')
      _else write('СТАЛ  ');
      write(jinnTotalScore:1, userTotalScore:4);
       _);
       writeTerminalOutput;
      _)
    _); (* 11767 *)
    _goto 12341;
   _)_); (* 11770 *)
  procInputChars;
  lastMoveResult := 0;
11772:
   seledMove := ord(moveBuffer[1]);
   movesInBuffer := movesInBuffer - 1;
   _for savedGameSlot := 1 _to movesInBuffer _do
     moveBuffer[savedGameSlot] := moveBuffer[(savedGameSlot + 1)];
   _if (seledMove = 0) _or (seledMove > 6) _then _(
     write('ОШИБКА - ПОВТОРИ');
12013:
     writeCharNTimes(up, 2 );
     writeTerminalOutput;
     _goto 11027;
  _);
  _if curPosition[user].pits[seledMove].val = 0 _then _(
    write(seledMove:1, ' ЛУНКА ПУСТАЯ');
    movesInBuffer := 0;
    _goto 12013;
  _);
  writeCharNTimes(up, upLines );
  _) _else 12032: _( (* 12032 *)
    userFinalKalah := userFinalKalah + 1;
    nodesThisMove := nodesSearched;
    _if gameIsDecided _then searchDepth := 2;
    actualDepth := searchDepth;
    seledMove :=   selAIMove(curPosition, weights, actualDepth );
    nodesThisMove := nodesSearched - nodesThisMove;
    extraDepth := 0;
    prevNodes := ;
% 12051
    _while (difficultyLevel > 2) _and _not gameIsDecided _and _not useOpeningBook _and (nodesThisMove > prevNodes) _and
       (((actualDepth = 2) _and (nodesThisMove < 20)) _or
       ((actualDepth = 3) _and (nodesThisMove < 48)) _or
       ((actualDepth >= 4) _and  (nodesThisMove < 82))) _do _(
      prevNodes := nodesThisMove;
      nodesThisMove := nodesSearched;
      extraDepth := extraDepth + 1;
      totalEntropy := totalEntropy - moveEntropy;
      seledMove :=   selAIMove(curPosition, weights, actualDepth + extraDepth);
      deepenCount := deepenCount + 1;
      nodesThisMove := nodesSearched - nodesThisMove;
    _); (* 12111 *)
    movesInBuffer := 0;
  _); (* 12112 *)
  _if useCorrections _and (curMoveNumber < 15) _then
    seledMove := applyLearningCorrection( seledMove );
  posBeforeMove := curPosition;
  _if currentPlayer = jinn _then _(
    write(arrow, seledMove:1);
    generateAIPhrase;  write(lf);
    writeCharNTimes(down, 2 );
  _);
  _if enableLogging _then logChar( chr(seledMove) );
  moveResult :=   exMvAnimated(curPosition, seledMove );
  writeCharNTimes(down, 1 );
  _if moveResult <> 0 _then _goto 12162;
  _if (userFinalKalah = 12) _and isGameOver(curPosition) _then
    _goto 12240
  _else
    _goto 12032;
12162:
  _if useOpeningBook _then _(
    _if openingBookIndex <= bookSize _then _(
      openingBookIndex := openingBookIndex * 6 + seledMove;
      _if curMoveNumber < 6 _then posSignature := posSignature * 8 + seledMove;
    _) _else _(
      useOpeningBook := false;
      useCorrections := true;
    _)
  _); (* 12176 *)
  rndnessFactor := 144 - (curPosition[jinn].pits[7].val + curPosition[user].pits[7].val) * 4;
  _if rndnessFactor < 10 _then rndnessFactor := 10;
   curMoveNumber := curMoveNumber + 1;
   _if moveResult = 1 _then _(
     totalMovesPlayed := totalMovesPlayed + 1;
     _if enableLogging _then logChar(space);
  _); (* 12214 *)
  _if isGameOver(curPosition) _then _(
    userFinalKalah := currentPlayer + 1;
    _if moveResult = 2 _then  userFinalKalah := userFinalKalah + 1 - currentPlayer * 2;
    writeCharNTimes(up, userFinalKalah );
    moveResult :=   exMvAnimated(curPosition, 0 );
    writeCharNTimes(down, 3 );
    writeTerminalOutput;
  _) _else
    _goto 10773;
12240:
  writeCharNTimes(down, 2 );
  write('ИГРА КОНЧИЛАСЬ');
12244:
  writeTerminalOutput;
  userData.echo := echoSaved;
  _if userData.echo _then _(
    userFinalKalah := 3;
    code(ЗЧ76013=);
  _);
% 12252
  jinnFinalKalah := curPosition[jinn].pits[7].val;
  userFinalKalah := curPosition[user].pits[7].val;
  _select
    (jinnFinalKalah <= 36) _and (userFinalKalah <= 36) _and (jinnFinalKalah + userFinalKalah < 72) _and isTrainingGame:
      write('ПАРТИЯ НЕДОИГРАНА');
    jinnFinalKalah = userFinalKalah: _( write('НИЧЬЯ'); resultChar := 'Н' _);
    jinnFinalKalah > userFinalKalah: _(
      writeJinnName;
      write('ВЫИГРАЛ ', jinnFinalKalah:1, colon, userFinalKalah:1);
      _if jinnFinalKalah > 36 _then resultChar := '+'
      _else resultChar := 'C';
      jinnWins := 1;
    _);
    true:_(
      writeUserName;
      write('ВЫИГРАЛ ', userFinalKalah:1, colon, jinnFinalKalah:1);
      resultChar := '-';
      userWins := 1;
    _)
  _end; (* 12326 *)
  writeTerminalOutput;
  isResumedGame := false;
  _if testMode _then _goto 12341;
  lockZone66;
  readDiskZone( nu, zonePlayers );
  numScoreEntries := zoneBuffer@[1].i;
  _goto 11426;
12341:
  sigrestore;
  _if allowExit _then _(
    gameActive := false;
    rewrite(INP);
    userData.systemFlags := userData.systemFlags + [47];
    write(INP,'СОN  {377');
    _GOTO 12633;
  _); (* 12356 *)
  writeJinnName;
  write('ДУМАЛ ', (jinnThinkingTime + 25) _DIV 50:1, ' СЕК');
  writeTerminalOutput;
  writeUserName;
  write('ДУМАЛ ', (userThinkingTime + 25) _DIV 50:1, ' СЕК');
  writeTerminalOutput;
  _if enableLogging _then _(
    write('ПРОТОКОЛ ПАРТИИ:');
    writeTerminalOutput;
    _for currentPlayer := 2 _to logIndex - 1 _do
      write(logPacked[currentPlayer]);
    writeTerminalOutput;
  _);
  _if postponeFlag _then _goto 12566;
_);

_procedure account;
_var remTime, curWallClock: integer;
_(
  code(Э0634=,);
  remTime := ;
  remTime := remTime - startRemTime;
  _if remTime < 0 _then exit;
  code(Э05310=,);
  curWallClock := ;
  curWallClock := curWallClock - startWallClock;
  _if curWallClock < 0 _then exit;
  statVal := remTime _div 4;
  updateStatistics( 31 );
  statVal := shift(curWallClock, 9);
  (q) updateStatistics( 33 );
_);
_procedure exec(arg:integer);
_procedure saveDataAndGo(_var f:text; _var i:Region; j:integer); _( code(ПБ76022=,); _);
_(
  _if gameActive _then _goto 12636;
  userData.systemFlags := userData.systemFlags + [13];
  account;
  saveDataAndGo(INP, userData, userEntryLen );
_);
_procedure Init;
_var u1, u2: integer;
_procedure getData(_var f:text; _var i:Region; j:integer); _( code(ПБ76021=); _);
_(
  getData(INP, userData, userEntryLen );
  unpck(userName[1], userData.userAccount );
  userName[5] := space;
  isAdmin := userData.userAccount = adminId;
  u1 := sel(userData.u3, 16, 8);
  u2 := sel(userData.u3, 24, 8);
  msDelay := 500;
  animSpeed := trunc((msDelay - 250) / 500);
  _GOTO 12566;
_);
(* main program *)

_(
  statVal := 1;
  code(Э0634=,);
  startRemTime := ;
  code(Э05310=,);
  startWallClock := ;
  zoneBuffer := ptr(64000C);
  gameActive := true;
  isNightTime := false;
  code(СЧ76421=); gl420z := ;
  code(СЧ76233=); tambov := ;
  _if tambov <> 'ТАМБОВ' _then _(
    code(СЧ=Э0620,);
    _goto 12561
  _);
  Init;
12561:
  _if checkRemainingTime _then _goto 12633;
  readTerminalInput(true);
  gameActive := false;
12566:
  _if readCommand(commandEntered, 3 ) _then _select
    'ИГР   ' = commandEntered :
      _if INP@ = charEtx _then _goto 12561 _else _goto 12566;
    'КАЛ   ' = commandEntered :  playGameSession;
    ('ТУР   ' = commandEntered) _or
    ('ПЕЧ   ' = commandEntered) _or
    ('ЭКР   ' = commandEntered) : _( gameActive := false; exec( 2400236C ) _);
    'ШКО   ' = commandEntered : _(
        gameActive := false;
        cmdResult :=   readCommand(commandEntered, 3 );
        _if (commandEntered = 'КАЛ   ') _or (commandEntered = 'ТУР   ') _then exec( 2400236C );
        _goto 12633;
      _);
     'КОН   ' = commandEntered :  12633: exec( 1660730C );
     true: _if gameActive _then
         12636: writeln('В БЛОКЕ НЕТ ПРИКАЗА ', commandEntered)
      _else
        _goto 12633
  _end _else  (* 12650 *)
    writeln('НЕ ПОНИМАЮ');
  _goto 12561;
_).
