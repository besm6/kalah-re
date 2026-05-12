(*=p-,t-,l+,Д+*)_program КАЛАХ;
_label 12561, 12566, 12633, 12636;
_const list = 64000B; jinn = 0; user = 1;
nu = 66B; z236 = 2400236B; zoneSchedule = 1005B; zonePlayers = 1013B;
z730 = 1660730B; zoneOpeningBook = 400153B; zoneCorrections = 660635B; zoneLog = 1012B;
z600 = 660600B; z611 = 660611B; c4 = 4; c5 = 5; c25 = 25;
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
6:(r:real);
7:(s:bitset)
_end;
zone = _array [0..1023] _of word;
largeset = _array [0..5] _of bitset;
rec1 = _record i:integer;
  ls:largeset;
  f7, f8: integer;
  f9, f10, f11, f12:alfa;
  f13:_array [5..12] _of alfa
_end;
player = integer;
contents = _record val:integer _end;
OneSide = _record move:word; pits:_array [1..7] _of contents _end;
gndr = integer;

_var
gl10z,
commandEntered, gl12z:alfa;
gl13z,gl14z,cursorCol,logIndex,charIndex:integer;gameActive,isNightTime,isAdmin, cmdResult:boolean;
startRemTime,startWallClock,gl24z,gl25z,gl26z,animSpeed,animDelay:integer;zoneBuffer:@zone;
userName:sixchars;
curLogWord:sixchars;
logPacked:_array [1..30] _of alfa;
userId:integer;tempSet:bitset;gl74z,gl75z,gl76z,gl77z,gl78z,gl79z,timeoutTicks:integer;
userBirthDate,gl82z,userAccount:alfa;userGender:gndr;permFlags,gl86z:bitset;
systemFlags:bitset;gl88z,gl89z:word;
gl90z:boolean; gl91z,gl92z,gl93z:integer;
statsArray:_array [0..7] _of integer;
gl102z,gl103z,gl104z,gl105z,gl106z,gl107z,gl108z,gl109z,gl110z:integer;
gl111z,gl112z,gl113z,gl114z,gl115z,gl116z,gl117z,gl118z,gl119z,gl120z:integer;
gl121z,gl122z,gl123z,gl124z,gl125z,gl126z,gl127z,gl128z,gl129z,gl130z:integer;
gl131z,gl132z,gl133z:integer;
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
  _if gl90z _then  _(
    code(СЧ76013=УИ7,);
    v1 := 2;
    code(ЗЧ76013=,);
    _if top _then write(' ==* ') _else write(' =-* ');
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> chr(255) _do _(
    _if gl90z _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      rewrite(INP);
      gameActive := false;
      write(INP,'SLЕ  {377');
      systemFlags := systemFlags + [47];
      _goto 1570
    _);
    write(INP,input@);
    get(input);
  _); (* while *)
  write(INP, chr(255));
  1570:
  reset(INP);
  _if gl90z _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _)
_);

_function checkRemainingTime:boolean;
_var l2v1z:integer;
_(
  checkRemainingTime := false;
  code(Э0634=,);
  l2v1z := ;
  _if timeoutTicks - l2v1z < 120 _then _(
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
_var l2v1z:alfa;
_(
  writeLN;
  code(сч77015=); l2v1z := ;
 _if l2v1z = 'Н{3770000' _then _GOTO 12561;
_);

_function getDigit(i:integer):integer;
_( code(=14ПВ77463,) _);

_procedure updateStatistics(index:integer);
_var currentValue, increment, divisor, tempValue:integer;
_(
  currentValue := statsArray[index];
  tempValue := ;
  currentValue := sel(tempValue, 24, 6) + gl24z;
  code(СД/6/=2ЗЧ5,МР=СД/-6/,МР=2ЗЧ4,);
  ins(tempValue, currentValue, 24, 6);
  statsArray[index] := ;
  _if increment > 0 _then _(
    gl24z := increment;
    updateStatistics(index - 1);
    gl24z := 1;
  _);
  _if gl25z = 1 _then _(
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
  i := 66B;
  code(СД/-14/=Э050105,Э050115=,)
_);
_procedure unlockZone66;
_var i:integer;
_(
  i := 66B;
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

_function addDaysToDate(l2a1z, l2a2z:integer):integer;
_(
  addDaysToDate := epochDaysToDate( (dateToEpochDays( l2a1z) + l2a2z) );
_);

_function dayOfWeek(day, month, year:integer):integer;
_(
 _if month < 3 _then year := year - 1;
 month := month + 9;
 _if month > 11 _then month := month - 12;
 month := month + 1;
 dayOfWeek := (((((day + year) + (year _div 4)) + (((13 * month) - 1) _DIV 5)) - 28) _MOD 7);
  _);

_procedure checkGameSchedule;
_label 1, 2;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z:alfa;
t:sixchars;
isTrainingGame:bitset;
_(
  _if 32 _IN permFlags _then _( permFlags := permFlags - [32]; exit _);
  _if tempSet * [3] = [3] _then exit;

  _if 26 _IN systemFlags _then _(
1:
    writeln('КАЛАХ ЗАКРЫТ');
    _GOTO 12561;
  _);
  _if tempSet * [2] = [2] _then _(
    write('ДЛЯ ВАС '); _goto 1;
  _);
  _if 30 _IN permFlags _then _(
    writeln('БОЛЬШЕ ИГРАТЬ НЕ БУДУ.');
    _goto 2
  _);
  l2v3z := getDaysInt;
  l2v5z := l2v3z _DIV 10000;
  l2v3z := l2v3z - (l2v5z * 10000);
  l2v4z := l2v3z _DIV 100;
  l2v3z := l2v3z - (l2v4z * 100);
  _if dayOfWeek( l2v3z, l2v4z, l2v5z) > 4 _then exit;
  readDiskZone( nu, zoneSchedule );
  isTrainingGame := zoneBuffer@[5].s;
  l2v6z :=   getTimeStr;
  unpck(t[1], l2v6z);
  l2v2z := (((ord(t[2]) * 10) + ord(t[3])) * 2) + (((ord(t[5]) * 10) + ord(t[6])) _DIV 30);
  _if _not (l2v2z _IN isTrainingGame) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      l2v2z := l2v2z + 1;
      _if l2v2z _IN isTrainingGame _then _(
        write('ОТКРОЕТСЯ В ');
        l2v1z := (l2v2z _div 2);
        l2v2z := ((l2v2z - (l2v1z * 2)) * 30);
        printDecimal( l2v1z );
        write(dot);
        printDecimal( l2v2z );
        writeln(' - СЕЙЧАС', getTimeStr);
2:
        rewrite(INP);
        write(INP,'ВЫХ  {377');
        gameActive := false;
        _GOTO 12633;
      _);
    _until (l2v2z >= 47);
    writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
    _goto 2
  _);
  isNightTime := (l2v2z < 13) _or (l2v2z > 41); (* < 6:30 or > 20:30 *)
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

_procedure unpPitState(_var l2a1z:OneSide; l2a2z:word);
_var l2v1z:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  l2a1z.move := ;
  _for l2v1z := 1 _to 6 _do _(
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=)
  _);
  code(2СЧ4=СД/-11/,МР=2ИК3,ЗЧ7=);
_);

_procedure getUserName(_var l2a1z:alfa; _var l2a2z:alfa);
_var l2v1z:sixchars; l2v7z: boolean; l2v8z:integer;
l2v9z:char; l2v10z, isResumedGame:alfa;
_(
  l2v10z := l2a1z;
  code(7ПАРАЗ=,7Э020=СД/40/,7ЗЧ1=7СА1,ВИ7=Э050104,7СЧ=7ПБ2,C;РАЗ:360741703600000,0,0,К;);
  isResumedGame := ;
  unpck(l2v1z[1], isResumedGame);
  l2v7z := false;
  _for l2v8z := 1 _to 6 _do _(
    l2v9z := l2v1z[l2v8z];
    _if _not ((l2v9z _in letter) _or (l2v9z = ' ') _or (l2v9z = '.')) _then
      l2v7z := true;
  _);
  _if l2v7z _then _(
    l2a1z := 'НЕТ ТА';
    l2a2z := 'КОГО  ';
    exit
  _);
  l2a1z := isResumedGame;
  code(7CЧ1=);
  l2a2z := ;
_);

_procedure writeTerminalOutput;
_(
  _if gl90z _then checkNegativeResponse _else _(
    write('{172     ');
    code(CЧ75205=УИ7,СЧ76401=ЛСисэ71,17ЗЧ1=17Э0711,Э07176402=,);
    rewrite(output); exit;
    code(С;ИСЭ71:3000000024000321,К;)
  _);
_);

_procedure flushOutput;
_var len, cnt, l2v3z: integer;
_(
  code(СЧ75224=АВ75205,);
  l2v3z := ;
  len := cursorCol - l2v3z + 1;
  _for cnt := 1 _to len _do write(spaces);
  cursorCol := l2v3z;
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
_var l2v1z:alfa; l2v2z:sixchars;
_(
  logPacked[1] := 'САLАН+';
  logPacked[2] := getDateStr;
  logPacked[3] := getTimeStr;
  l2v1z := userAccount;
  code(СД/10/=);
  l2v1z := ;
  unpck(l2v2z[1], l2v1z);
  l2v2z[1] := space;
  l2v2z[6] := '{175';
  pck(l2v2z[1], logPacked[4]);
  logIndex := 5;
_);

_procedure saveLogToZone;
_label 3247;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z: alfa;
_procedure P3203(l3a1z:alfa);
_label 1;
_(
  _if l2v2z > 1023 _then _goto 1;
  zoneBuffer@[l2v2z].a := l3a1z;
  l2v5z := ;
  l2v2z := l2v2z + 1;
  _if l2v5z = fin _then _(
1:  code(2СЧ3=СД/-14/,2ЛС4=);
    zoneBuffer@[0].i := ;
    _GOTO 3247;
  _)
_);
_( (* saveLogToZone *)
  _if logIndex > 30 _then exit;
  logWord( fin );
  readDiskZone( nu, zoneLog );
  l2v5z := zoneBuffer@[0].a;
  code(СД/14/=2ЗЧ3,МР=СД/44/,);
  l2v2z := ;
  _if (l2v2z <= 896) _or (z600 <> 0) _then _(
    l2v3z := 1;
    (loop) _(
      P3203( logPacked[l2v3z] );
      l2v3z := l2v3z + 1;
      _goto loop
    _);
3247:
    _if (l2v2z > 928) _and (z600 > 0) _then _(
      l2v4z := zoneBuffer@[1].i;
      _if (l2v4z > 0) _and (l2v4z <= z611) _and (l2v4z >= z600) _then _(
        writeDiskZone(0, l2v4z );
        zoneBuffer@[1].i := l2v4z + 1;
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
bookSize = 8415; cbb = 72; cbc = 114; right = '{171'; left = '{146';
up = '{176'; down = '{177'; delay = '{142';
_type
Position = _array [jinn..user] _of OneSide;
pckboth = _array [jinn..user] _of word;
eightwords = _record f0, kalah, extraTurn, emptyOpp, multiLap, capture, mobility, distance:integer _end;
_var l2v1z, l2v2z, l2v3z, l2v4z:alfa;
l2v5z, l2v6z, cmdString, inputCmd:alfa;
resultChar:char; hasScore, isResumedGame, isNewGame, isTrainingGame, movesPending,
isFirstGame, testMode, gameIsDecided: boolean; aiSilent: boolean;
userSilent, isMasterLevel, postponeFlag, hasWarned:boolean;
gndrMismatch, allowExit, useOpeningBook, bookIsActive, enableLogging, useCorrections:boolean;
l2v29z:boolean; packedData:word; difficultyLevel : integer; resumeCount,
userTotalScore, jinnTotalScore, gamesPlayedToday, levelChoice, savedLevel, rndnessFactor: integer;
chosenMove, wordsSinceLastSpeak, insertPos, scorePos, maxNodesToSearch, alphaBetaCutoffs, deepenCount, extraDepth, prevNodes, jinnWins: integer;
userWins, startPlayer, savedGameSlot, loopIndex, currentPlayer, seledMove, numScoreEntries, userFinalKalah, jinnFinalKalah, lastJinnKalah,
lastUserKalah, startTickCount, searchDepth, actualDepth, entryIndex, inputLength : integer;
totalMovesPlayed:integer;
curMoveNumber, corrStartIdx, corrEndIdx, oldHandler, openingBookIndex, posSignature, uncertaintyBits, nodesSearched,
l2v74z, jinnThinkingTime, userThinkingTime, l2v77z, movesInBuffer, l2v79z, nodesThisMove: integer;
userAge, curThinkTime: integer;
curPosition:Position;
posBeforeMove:Position;
pckPosition:_array [0..1] _of word;
knownGender:gndr;
l2v118z:sixchars;
l2v124z:@sixchars; l2v125z, lastMoveResult:integer; l2v127z:bitset; l2v128z:bitset; totalEntropy, moveEntropy: real;
oneOverLN2:real; (* 131 *)
l2v132z:@rec1;
l2v133z:eightwords;
l2v140z:_array[1..12] _of char;
l2v153z:@zone; (* for simplicity *)
moveBuffer: _array [1..10] _of char;
l2v164z:eightwords;
x172z:integer;
l2v172z:_array [1..6] _of integer;  xx179z:integer;
l2v179z:_array [1..6] _of integer; l2v186z: integer;
haveSaid:_array[1..30] _of bitset;
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

_function isAllZeros(arg:alfa):boolean;
_(
  code(тут2:7патут2=пбдавай,
c;7760000000000000,7777740000000000,7777777700000000,
7777777777600000,7777777777777400,377,15,17,
к;давай:3сч4=7лу6,уи6=1сч12,3ср4=6иа,7лу=3зч4,);
  isAllZeros := arg = '{000{000{000{000{000{000';
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

_function procStrings(l3a1z, l3a2z: alfa):alfa;
_var l3v1z, l3v2z, l3v3z: alfa;
_(
  l3v1z := '7DDDDD';
  l3v2z := 'D{3770000';
  l3v3z := '{375{3760000';
  code(3сч4=3сб6,3см5=3сб7,3рб10=сд/-17/,мр=17лс,);
  procStrings := ;
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
      stonesToMove := ((stonesToMove - stoneIndex) + 1);
      code(3cч6=ср13,3зч6=); (* curPlayer := _not curPlayer *)
      pitIndex := 0;
      _goto 3520;
    _)
  _)
_);

_functin exMvAnimated(_var pos:Position; l3a2z:integer):integer;
_label 4171;
_var l3v1z:word;
l3v2z:integer; l3v3z:integer; l3v4z:integer;
l3v5z:word;
l3v6z, l3v7z:integer;
l3v8z:word;
l3v9z, l3v10z: integer;
l3v11z, l3v12z:integer; l3v13z:char;
_procedure drawMove(p: player; l4a2z: integer);
_var l4v1z, l4v2z, l4v3z,l4v4z,l4v5z,l4v6z,l4v7z:integer;
dir:char;
_(
  _if l4a2z = 7 _then _(
    l4v5z := 0;
    _if p = user _then
      l4v4z := 18 + 36
    _else
      l4v4z := 18 - 1;
  _) _else _(
    _if p = user _then _(
      l4v6z := l4a2z;
      l4v5z := -1;
    _) _else _(
      l4v6z := 7 - l4a2z;
      l4v5z := 1;
    _);
    l4v4z := l4v6z * 5 + 18;
  _);
  _select
    l4v4z > l3v11z : _(
      dir := right;
      l4v3z := l4v4z - l3v11z;
    _);
    l4v4z < l3v11z : _(
      dir := left;
      l4v3z := l3v11z - l4v4z;
    _);
    true: l4v3z := 0
  _end;
  _for l4v2z := 1 _to l4v3z _do _(
    _for l4v1z := 1 _to animDelay _do _(
      write(delay);
    _);
    write(dir);
  _);
  _select
  l4v5z > l3v12z : _(
    dir := up;
    l4v3z := l4v5z - l3v12z;
  _);
  l3v12z > l4v5z : _(
      dir := down;
      l4v3z := l3v12z - l4v5z;
  _);
  true: l4v3z := 0
  _end;
  _for l4v2z := 1 _to l4v3z _do _(
    _for l4v1z := 1 _to animDelay _do
      write(delay);
    write(dir);
  _);
  l4v7z := pos[p].pits[l4a2z].val;
  _if l4v7z = 0 _then
    write(space:2)
  _else
    write(l4v7z:2);
  writeCharNTimes(delay, animDelay );
  l3v11z := l4v4z + 2;
  l3v12z := l4v5z;
_);
_( (* exMvAnimated *)
  l3v12z := 0;
  l3v1z := pos[user].move;
  l3v5z := ;
  _if l3a2z = 0 _then _(
    l3v8z.i := 0;
    l3v6z := ;
    l3v11z := 0;
    _for l3v3z := 1 _to 6 _do _(
      l3v8z.i := pos[jinn].pits[l3v3z].val + l3v8z.i;
      l3v6z := pos[user].pits[l3v3z].val + l3v6z;
    _);
    (*=c-*)l3v3z := l3v8z.i = 0; (*=c+*)
    l3v6z := l3v6z + l3v8z.i;
    writeCharNTimes(up, l3v1z.i);
    _for l3v4z := 1 _to 6 _do _(
      _if pos[l3v3z].pits[l3v4z].val > 0 _then _(
        pos[l3v3z].pits[l3v4z].val := 0;
        drawMove(l3v3z, l3v4z);
      _)
    _);
    pos[l3v3z].pits[7].val := pos[l3v3z].pits[7].val + l3v6z;
    drawMove(l3v3z, 7);
  _) _else _( (* 4035 *)
    l3v11z := 7;
    l3v6z := pos[l3v1z.i].pits[l3a2z].val;
    pos[l3v1z.i].pits[l3a2z].val := 0;
    writeCharNTimes(up, l3v1z.i);
    write(totalMovesPlayed:4);
    write(space:3);
    drawMove(l3v1z.i, l3a2z);
    (loop) _(
     l3v8z.b := _not l3v1z.b;
    _if l3v1z.i = l3v5z.i _then _(
      l3v4z := 7;
    _) _else _(
      l3v4z := 6;
    _);
% L4066:
    _for l3v3z := 1 _to l3v6z _do _(
      l3v2z := l3a2z + l3v3z;
      _if l3v2z <= l3v4z _then _(
        pos[l3v1z.i].pits[l3v2z].val := pos[l3v1z.i].pits[l3v2z].val + 1;
        l3v7z := ;
        drawMove( l3v1z.i, l3v2z );
        _if l3v3z = l3v6z _then _(
          _if l3v2z = 7 _then _(
            exMvAnimated := 2;
          _) _else _(
            exMvAnimated := 1;
            pos[jinn].move := l3v5z;
            code(ср13=);
            pos[user].move := ;
            _if (l3v7z = 1) _and (l3v1z.i = l3v5z.i) _then _(
              l3v10z := 7 - l3v2z;
              l3v9z := pos[l3v8z.i].pits[l3v10z].val;
              _if l3v9z > 0 _then _(
                pos[l3v8z.i].pits[l3v10z].val := 0;
                drawMove( l3v8z.i, l3v10z );
                pos[l3v1z.i].pits[l3v2z].val := 0;
                drawMove( l3v1z.i, l3v2z );
                pos[l3v5z.i].pits[7].val := pos[l3v5z.i].pits[7].val + l3v9z + 1;
                drawMove( l3v5z.i, 7 );
              _);
% L4160:
              _goto 4171
            _)
          _)
% L4161:
        _)
      _) _else _(
% L4162:
        l3v6z := (l3v6z - l3v3z) + 1;
        l3v1z.b := _not l3v1z.b;
        l3a2z := 0;
        _goto loop;
      _);
% L4167:
    _)
  _)
  _); (* 4171 *)
4171:
  writeCharNTimes(left, l3v11z);
  _if l3v12z > 0 _then _(
    l3v13z := down;
  _) _else _if l3v12z < 0 _then _(
    l3v12z := -l3v12z;
    l3v13z := up;
  _);
  writeCharNTimes( l3v13z, l3v12z );
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
_var l3v1z, l3v2z: integer;
_(
  _for l3v1z := 0 _to 1 _do
  _for l3v2z := 1 _to 6 _do _(
    curPosition[l3v1z].pits[7].val := curPosition[l3v1z].pits[7].val + curPosition[l3v1z].pits[l3v2z].val;
    curPosition[l3v1z].pits[l3v2z].val := 0;
  _)
_);

_function getExtraTurnMoves(_var pos:Position; p:player):bitset; (* unused *)
_var l3v1z, l3v2z, l3v3z:integer; l3v4z:bitset;
_(
  l3v4z := [];
  _for l3v3z := 1 _to 6 _do _(
    l3v2z := pos[p].pits[l3v3z].val;
    _if l3v2z > 0 _then _(
      l3v1z := l3v2z + l3v3z;
      _if (l3v1z = 7) _or (l3v1z = 20) _then
        l3v4z := [l3v3z] + l3v4z;
    _)
  _);
  getExtraTurnMoves := l3v4z;
_);

_function selAIMove(_var pos:Position; _var weights: eightwords; searchDepth:integer):integer;
_label 5250, 5655;
_var pitIndex, bestScore, worstScore, l3v4z, l3v5z: integer;
retVal, moveScore, l3v8z, startTime:integer;
curPos, testPos:Position;
moveType, l3x43z:integer; candWeight:_array [1..6] _of integer; l3v50z,
l3x51z:integer; candMove: _array[1..6] _of integer; l3v58z, candCount, l3v60z,
l3v61z, l3v62z, l3v63z, bookZoneIndex:integer; l3v65z: bitset; alpha, beta, l3v68z, nodesPerMove, legalMoveCount,
kalahWeight, extraTurnBonus, emptyOppWeight, multiLapBonus, captureSetup, mobilityWeight, distanceWeight: integer;
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
     l3v4z := (7 - bookZoneIndex _MOD 8) * 6;
     l3v4z := sel(zoneBuffer@[bookZoneIndex_div 8], l3v4z, 6);
     code(СД/-51/=);
     l3v65z := ;
     validateBookMoves( l3v65z );
   _) _else _((* 5302 *)
   _if randint(100) >= rndnessFactor _then _(
     alpha := billion;
     beta := ;
     bookIsActive := false;
     l2v74z := nodesSearched;
     moveScore :=   minimax(curPos, searchDepth, maxNodesToSearch, alpha, beta);
     retVal := chosenMove;
     _goto 5655;
   _);
   l3v8z :=   evaluatePosition(curPos);
  _); (* 5325 *)
  legalMoveCount := 1;
  l3v4z := curPos[user].move.i;
  l3v68z := maxNodesToSearch;
  _for pitIndex := 1 _to 6 _do _(
    _if pos[l3v4z].pits[pitIndex].val > 0 _then legalMoveCount := legalMoveCount + 1;
  _);
  l3v4z := 0;
  retVal := ;
  l3v61z := ;
  _for pitIndex := 1 _to 6 _do _(
    testPos := curPos;
    _if useOpeningBook _then _(
    _if pitIndex _IN l3v65z _then _(
      moveType :=   exMvLogic(testPos, pitIndex );
      l2v179z[pitIndex] := ;
      _if moveType = 0 _then _(
        writeln('ПУСТАЯ ЛУНКА В ДЕБЮТАХ - "ЧП" !');
        writeln('ИСТОРИЯ ', openingBookIndex:1);
        _GOTO 12561;
      _); (* 5401 *)
      l3v4z := l3v4z + 1;
      retVal := pitIndex;
      _if moveType = 2 _then
        l3v63z :=   consultOpeningBook(testPos, openingBookIndex * 6 + pitIndex)
      _else
        l3v63z := 1;
      l2v172z[pitIndex] := l3v63z;
    _) (* 5417 *)
    _else l2v179z[pitIndex] := 0;
    _) _else _( (* 5422 *)
      moveType :=   exMvLogic(testPos, pitIndex );
      l2v179z[pitIndex] := ;
      l2v74z := nodesSearched;
      _if moveType <> 0 _then _(
        alpha := billion;
        beta := ;
        nodesPerMove := l3v68z * 2 _div legalMoveCount;
        legalMoveCount := legalMoveCount - 1;
        _if moveType = 1 _then _(
          moveScore := - minimax(testPos, searchDepth-1, nodesPerMove, alpha, beta);
        _) _else _(
          moveScore :=   minimax(testPos, searchDepth, nodesPerMove, alpha, beta);
        _); (* 5467 *)
        l3v68z := (l3v68z - nodesSearched) + l2v74z;
        moveScore := moveScore - l3v8z;
        l2v172z[pitIndex] := ;
        l3v4z := l3v4z + 1;
        _if moveScore > bestScore _then _(
          retVal := pitIndex;
          bestScore := moveScore;
        _);
        _if moveScore < worstScore _then worstScore := moveScore;
      _)
    _); (* 5504 *)
  _); (* 5506 *)
  _if l3v4z < 2 _then _goto 5655;
  _if useOpeningBook _then
    l3v61z := 0
  _else _(
    l3v4z := 0;
    _for pitIndex := 1 _to 6 _do _(
      _if ((l2v172z[pitIndex] <> worstScore) _or (worstScore = bestScore)) _and (l2v179z[pitIndex] <> 0) _then _(
        l3v61z := l3v61z + l2v172z[pitIndex];
        l3v4z := l3v4z + 1;
      _)
    _);
    _if l3v4z < 2 _then _goto 5655;
    l3v61z := l3v61z _div l3v4z - 1;
  _); (* 5541 *)
  candCount := 0;
  l3v60z := ;
  _for l3v5z := 1 _to 6 _do
  _if (l2v179z[l3v5z] <> 0) _and (l2v172z[l3v5z] > l3v61z) _then _(
    candCount := candCount + 1;
    pitIndex := (l2v172z[l3v5z] - l3v61z);
    candWeight[candCount] := ;
    l3v60z := l3v60z + pitIndex;
    candMove[candCount] := l3v5z;
  _); (* 5563 *)
  _if candCount < 2 _then _goto 5655;
  l3v62z := 0;
  _for retVal := 1 _to candCount _do _(
    pitIndex := candWeight[retVal] * 100 _div l3v60z;
    _if useOpeningBook _then
      l3v63z := pitIndex
    _else
      l3v63z := pitIndex * pitIndex;

    _if l3v63z > 0 _then
      moveEntropy := moveEntropy - l3v63z * LN(l3v63z);
    l3v62z := l3v63z + l3v62z;
    candWeight[retVal] := ;
  _); (* 5622 *)
  moveEntropy := moveEntropy / l3v62z + LN(l3v62z);
  totalEntropy := moveEntropy + totalEntropy;
  uncertaintyBits := round(moveEntropy * 10.0 * oneOverLn2);
  pitIndex := randint( l3v62z) + 1;
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
_var pckName:_array [0..1] _of alfa;pitNum, rndChoice, loopVar, oppositePit, jinnStones, userStones, phraseCategory, moveType: integer;
l3v11z:boolean; l3v12z, l3v13z:boolean; suffixChar:char;
l3v15z:Position;
unpName:_array [1..12] _of char;
l3v43z:_array [1..6] _of char;
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
  l3v11z := false;
  l3v15z := curPosition;
  moveType :=   exMvLogic(l3v15z, seledMove );
  jinnStones := l3v15z[jinn].pits[7].val;
  userStones := l3v15z[user].pits[7].val;
  _if isTrainingGame _then _goto 7660;
  write(space:3);
  _if isFirstGame _then _(
    isFirstGame := false;
    unpck(l3v43z[1], userBirthDate);
    userAge := ord(l3v43z[5]) * 10 + ord(l3v43z[6]);
    _if userAge > 0 _then _(
      pckName[1] :=   getDateStr;
      unpck(l3v43z[1], pckName[1]);
      userAge := ord(l3v43z[5]) * 10 + ord(l3v43z[6]) - userAge;
    _);
    pckName[0] := userAccount;
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
        (userAge < 20): write('ЮН');
        (userAge < 50): write('УВАЖАЕМ');
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
    unpck(l3v43z[1], pckName[0]);
    _for loopVar := 1 _to 3 _do _(
    _if rndChoice - loopVar > 0 _then
      l3v43z[loopVar] := unpName[rndChoice - loopVar];
    _);
    _select
      knownGender = MASC :
      gndrMismatch := isAllZeros( 'ОВА  4') _or
        isAllZeros( 'ЕВА  4') _or
        isAllZeros( 'ИНА  4') _or
        isAllZeros( 'АЯ   3');
      knownGender = FEM :
      gndrMismatch := isAllZeros( 'ОВ   3') _or
        isAllZeros( 'ЕВ   3') _or
        isAllZeros( 'ИН   3') _or
        isAllZeros( 'ИЙ   3')
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
        rndChoice := l3v15z[user].pits[loopVar].val;
        _if rndChoice > 0 _then _(
          pitNum := rndChoice + loopVar;
          oppositePit := 7 - pitNum;
          _if (pitNum < 7) _and
              (l3v15z[user].pits[pitNum].val = 0) _and
              (l3v15z[jinn].pits[oppositePit].val <> 0) _then _(
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
    l3v12z := ;
    l3v13z := ;
    _for loopVar := 1 _to 6 _do _(
      rndChoice := l3v15z[user].pits[loopVar].val;
      _if rndChoice > 0 _then _(
        pitNum := rndChoice + loopVar;
        oppositePit := oppositePit + 1;
        _if (pitNum = 7) _or (pitNum = 20) _then l3v12z := true
        _else l3v13z := true;
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
     l3v12z _and l3v13z : _select
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
  _if l3v11z _then _goto 7660;
  code(СЧ75205=3ЗЧ6,СЧ75224=3ЗЧ7,);
  l3v11z := true;
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
  _else _if (25 _IN systemFlags) _and (tempSet * [3,6] = []) _then _(
    writeTerminalOutput;
    write('ТУРНИР ДЛЯ ВАС ЗАКРЫТ':47);
    _goto 10017
  _);
  l2v29z := gl90z;
  gl90z := false;
  code(СЧ13=ЗЧ76013,); (* C/2013 := 1; ??? *)
  write(lf, lf, lf);
  dsplBoard(pckPosition);
  writeCharNTimes(up, 2);
  writeTerminalOutput;
_);

_function compareScoreEntries(l3a1z, l3a2z:integer):boolean;
_var l3v1z:integer;
l3v2z,l3v3z:integer;
l3v4z:integer;
l3v5z:player;
l3v6z:integer;
l3v7z:integer;
l3v8z:player;
l3v9z:integer;
l3v10z:integer;
l3v11z,l3v12z:integer;l3v13z:boolean;
_(
  l3v1z := zoneBuffer@[l3a1z].i;
  l3v2z := zoneBuffer@[l3a2z].i;
  l3v11z := sel(l3v1z, 24, 4);
  l3v12z := sel(l3v2z, 24, 4);
  _if l3v11z <> l3v12z _then _(
    l3v13z := l3v11z > l3v12z;
  _) _else _(
    l3v3z := sel(l3v1z, 8, 8);
    l3v4z := sel(l3v1z, 0, 8);
    l3v9z := l3v4z + l3v3z;
    _if l3v9z = 0 _then _(
      compareScoreEntries := false;
      exit
    _); (* 10135 *)
    l3v5z := sel(l3v2z, 8, 8);
    l3v6z := sel(l3v2z, 0, 8);
    l3v10z := l3v6z + l3v5z;
    _if l3v10z = 0 _then
      l3v13z := true
    _else _( (* 10145 *)
      l3v7z := l3v3z * l3v10z;
      l3v8z := l3v5z * l3v9z;
      _if l3v7z = l3v8z _then _(
        _if l3v7z = 0 _then _(
          l3v13z := l3v4z < l3v6z;
        _) _else _(
          l3v13z := ((l3v3z > l3v4z) _and (l3v3z > l3v5z)) _or
                    ((l3v3z < l3v4z) _and (l3v3z < l3v5z));
        _)
      _) _else _( (* 10175 *)
        l3v13z := l3v7z > l3v8z;
      _)
    _)
  _); (* 10202 *)
  compareScoreEntries := l3v13z;
  _if l3v13z _then _(
    zoneBuffer@[l3a1z].i := l3v2z;
    zoneBuffer@[l3a2z].i := l3v1z;
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
  l2v77z := ;
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
  _if 27 _IN systemFlags _then _(
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
  knownGender := shift(userGender, 46);
  l2v164z := [0, 572, 136, 16, 53, 33, 110, 80];
  l2v133z := l2v164z;
  l2v1z := '    00';
  l2v2z := '{377{3770000';
  l2v3z := '  {377{377{3770';
  l2v4z := userAccount;
  code(2СБ3=); l2v4z := ;
  l2v124z := ref(packedData);
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
    l2v127z := zoneBuffer@[3].s;
    l2v128z := ;
    numScoreEntries := zoneBuffer@[1].i;
    hasScore := false;
    isResumedGame := ;
    isNewGame := ;
    (loop) _while _not isTrainingGame _and extractMinElement(savedGameSlot, l2v127z) _do _(
      l2v132z := ptr(savedGameSlot * 21 + 64004C);
      _if (l2v132z@.i = 7) _and isInLargeSet( userId, l2v132z@.ls) _then _(
        l2v128z := l2v128z - [savedGameSlot];
        zoneBuffer@[3] := ;
        isResumedGame := true;
        isNewGame := ;
        writeDiskZone( nu, zonePlayers );
        _exit loop
      _);
    _); (* 10565 *)
    unlockZone66;
    _if isResumedGame _then _(
      totalMovesPlayed := sel(l2v132z@.f12, 8, 8);
      pckPosition[0].a :=   procStrings( l2v132z@.f9, l2v132z@.f10 );
      pckPosition[1].a :=   procStrings( l2v132z@.f11, l2v132z@.f12 );
      loopIndex := 4;
      _for currentPlayer := 5 _to 12 _do _(
        logPacked[currentPlayer] := l2v132z@.f13[currentPlayer];
        cmdString := ;
        _if cmdString <> spaces _then loopIndex := currentPlayer;
      _);
    _) _else _(
      pckPosition[0].i := 60606060606000C;
      pckPosition[1].i := 1060606060606000C;
      totalMovesPlayed := 1;
    _); (* 10624 *)
    _for entryIndex := 1 _to numScoreEntries _do _(
      l2v5z := zoneBuffer@[1008 - entryIndex].a;
      code(2ЛУ4=2ЗЧ11,);
      _if cmdString = l2v4z _then _(
        hasScore := true;
        code(2сч7=пбнашел,);
      _);
    _);
    l2v5z := '001000';
    code(нашел:сд/-20/=2зч10,2рб5=2зч7,);
    unpck(l2v124z@[1], l2v5z);
    savedLevel := difficultyLevel;
    currentPlayer := packedData.i;
    gamesPlayedToday := currentPlayer _div 2;
    packedData.i := currentPlayer _mod 2;
    unpPosition(curPosition, pckPosition);
    _if _not isResumedGame _and hasScore _then _(
      curPosition[jinn].move.b := packedData.b;
      curPosition[user].move.b := _not packedData.b;
    _);
    _if isTrainingGame _and (systemFlags * [27] = [27]) _then _(
      difficultyLevel := levelChoice;
      curPosition[jinn].move.i := startPlayer;
      curPosition[user].move.i := 1 - startPlayer;
    _); (* 10674 *)
    dsplGameHeader;
    updateStatistics( 6 );
  _); (* 10677 *)
  l2v125z := 0;
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
    l2v79z := 5;
    writeTerminalOutput;
  _) _else
    l2v79z := 1;
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
  l2v77z :=   wallClockTicks;
  readTerminalInput(false);
  curThinkTime := wallClockTicks - l2v77z;
  _if curThinkTime < 0 _then curThinkTime := 50;
% 11052
  movesPending := readCommand( commandEntered, 3 );
  postponeFlag := (commandEntered = 'SLЕ   ') _and (47 _IN systemFlags);
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
      write(chr(162B)); (* erase *)
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
        permFlags := permFlags + [30];
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
    gl90z := l2v29z;
    _if gl90z _then _(
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
  l2v127z := zoneBuffer@[3].s;
  numScoreEntries := zoneBuffer@[1].i;
  l2v128z := l2v127z _mod [0..47];
  _if extractMinElement(savedGameSlot, l2v128z) _then _(
  _if savedGameSlot > 35 _then _(
    unlockZone66;
    write('ОТЛОЖИТЬ ИГРУ НЕ УДАЛОСЬ');
    writeTerminalOutput;
  _goto 12341;
  _); (* 11300 *)
  l2v132z := ptr(savedGameSlot * 21 + 64004C);
  l2v127z := l2v127z + [savedGameSlot];
  zoneBuffer@[3] := ;
  l2v132z@.i := 7;
  clearLargeSet( l2v132z@.ls );
  addToLargeSet( userId, l2v132z@.ls );
  savedGameSlot := dateStringToInt(   getDateStr  );
  l2v132z@.f7 := ;
  savedGameSlot := addDaysToDate( savedGameSlot, 7 );
  l2v132z@.f8 := ;
  currentPlayer := 0;
% 11335
  _while (currentPlayer <= 1) _do _(
    _for loopIndex := 1 _to 8 _do _(
      l2v140z[loopIndex] := chr(curPosition[currentPlayer].pits[loopIndex-1].val);
    _);
    _for loopIndex := 9 _to 12 _do _(
      l2v140z[loopIndex] := space;
    _);
    l2v140z[11] := chr(totalMovesPlayed);
    pck(l2v140z[1], l2v132z@.f13[currentPlayer*2+1]);
    pck(l2v140z[7], l2v132z@.f13[currentPlayer*2+2]);
    currentPlayer := currentPlayer + 1;
   _);
% 11374
   _for loopIndex := 5 _to 12 _do _(
     l2v132z@.f13[loopIndex] := spaces;
   _);
   _if enableLogging _then _(
   _while charIndex <> 1 _do logChar(space);
   _if logIndex < 14 _then _(
     _for loopIndex := 5 _to logIndex - 1 _do _(
       l2v132z@.f13[loopIndex] := logPacked[loopIndex];
     _)
   _) _else
     l2v132z@.f13[5] := 'ПРОД: ';
  _);
11426:
  l2v153z := ptr(difficultyLevel * 12 + 65354C);
  _if _not isResumedGame _and _not isNewGame _and _not isTrainingGame _then _(
    l2v153z@[0].i := l2v153z@[0].i + 1;
    l2v153z@[1].i := remainingCPUTime  + l2v153z@[1].i - startTickCount;
    l2v153z@[2].i := l2v153z@[2].i + jinnThinkingTime;
    l2v153z@[3].i := l2v153z@[3].i + userThinkingTime;
    l2v153z@[4].i := round(totalEntropy * oneOverLn2) + l2v153z@[4].i;
    l2v153z@[5].i := l2v153z@[5].i + nodesSearched;
    l2v153z@[6].i := l2v153z@[6].i + totalMovesPlayed;
    l2v153z@[7].i := l2v153z@[7].i + alphaBetaCutoffs;
    l2v153z@[8].i := l2v153z@[8].i + deepenCount;
    l2v153z@[9].i := l2v153z@[9].i + jinnWins;
    l2v153z@[10].i := l2v153z@[10].i + userWins;
  _); (* 11473 *)
  _if isTrainingGame _then l2v153z@[11].i := l2v153z@[11].i + 1;
  _for entryIndex := 1 _to numScoreEntries _do _(
    l2v5z := zoneBuffer@[1008 - entryIndex].a;
    code(2ЛУ4=2ЗЧ11,); (* cmdString := l2v5z & l2v2z *)
    _if cmdString = l2v4z _then _(
      code(2СЧ7=СД/-20/,2ЗЧ11=2РБ5,2ЗЧ7=);
      unpck(l2v124z@[1], l2v5z);
      currentPlayer := packedData.i;
      gamesPlayedToday := currentPlayer _div 2;
      packedData.i := currentPlayer _mod 2;
      _if cmdString <> l2v6z _then gamesPlayedToday := 5;
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
    pck(l2v124z@[1], l2v5z);
    code(2сч7=2сб5,сд/20/=2лс6,17зч=2сч53,1ас35=17зч,17ик=иа,);
    code(15па=17сч,15зч=);
    scorePos := 1008 - 2;
    (loop) _for currentPlayer := insertPos _to scorePos _do _(
      _if _not compareScoreEntries( currentPlayer, currentPlayer + 1) _then _exit loop;
    _); (* 11655 *)
    _if 28 _IN permFlags _then _(
      _repeat
        cmdResult := true;
        _for currentPlayer := 1008 - numScoreEntries _to scorePos _do _(
          _if compareScoreEntries( currentPlayer, currentPlayer + 1) _then cmdResult := false;
        _);
      _until cmdResult;
      permFlags := permFlags - [28];
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
    _if enableLogging _and _not isResumedGame _and (11 _IN systemFlags) _then _(
      _while charIndex <> 1 _do logChar(space);
      unpck(l2v118z[1], logPacked[5]);
      l2v118z[2] := resultChar;
      pck(l2v118z[1], logPacked[5]);
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
  writeCharNTimes(up, l2v79z );
  _) _else 12032: _( (* 12032 *)
    userFinalKalah := userFinalKalah + 1;
    nodesThisMove := nodesSearched;
    _if gameIsDecided _then searchDepth := 2;
    actualDepth := searchDepth;
    seledMove :=   selAIMove(curPosition, l2v133z, actualDepth );
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
      seledMove :=   selAIMove(curPosition, l2v133z, actualDepth + extraDepth);
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
  l2v125z :=   exMvAnimated(curPosition, seledMove );
  writeCharNTimes(down, 1 );
  _if l2v125z <> 0 _then _goto 12162;
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
   _if l2v125z = 1 _then _(
     totalMovesPlayed := totalMovesPlayed + 1;
     _if enableLogging _then logChar(space);
  _); (* 12214 *)
  _if isGameOver(curPosition) _then _(
    userFinalKalah := currentPlayer + 1;
    _if l2v125z = 2 _then  userFinalKalah := userFinalKalah + 1 - currentPlayer * 2;
    writeCharNTimes(up, userFinalKalah );
    l2v125z :=   exMvAnimated(curPosition, 0 );
    writeCharNTimes(down, 3 );
    writeTerminalOutput;
  _) _else
    _goto 10773;
12240:
  writeCharNTimes(down, 2 );
  write('ИГРА КОНЧИЛАСЬ');
12244:
  writeTerminalOutput;
  gl90z := l2v29z;
  _if gl90z _then _(
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
    systemFlags := systemFlags + [47];
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

_procedure P12424;
_var l2v1z, l2v2z: integer;
_(
  code(Э0634=,);
  l2v1z := ;
  l2v1z := l2v1z - startRemTime;
  _if l2v1z < 0 _then exit;
  code(Э05310=,);
  l2v2z := ;
  l2v2z := l2v2z - startWallClock;
  _if l2v2z < 0 _then exit;
  gl24z := l2v1z _div 4;
  updateStatistics( 31 );
  gl24z := shift(l2v2z, 9);
  (q) updateStatistics( 33 );
_);
_procedure exec(arg:integer);
_procedure P12450(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
  _if gameActive _then _goto 12636;
  systemFlags := systemFlags + [13];
  P12424;
  P12450(INP, userId, userEntryLen );
_);
_procedure P12501;
_var l2v1z, l2v2z: integer;
_procedure P12473(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=); _);
_(
  P12473(INP, userId, userEntryLen );
  unpck(userName[1], userAccount );
  userName[5] := space;
  isAdmin := userAccount = adminId;
  l2v1z := sel(gl75z, 16, 8);
  l2v2z := sel(gl75z, 24, 8);
  gl26z := 500;
  animSpeed := trunc((gl26z - 250) / 500);
  _GOTO 12566;
_);
(* main program *)

_(
  gl24z := 1;
  code(Э0634=,);
  startRemTime := ;
  code(Э05310=,);
  startWallClock := ;
  zoneBuffer := ptr(64000C);
  gameActive := true;
  isNightTime := false;
  code(СЧ76421=); gl420z := ;
  code(СЧ76233=); gl12z := ;
  _if gl12z <> 'ТАМБОВ' _then _(
    code(СЧ=Э0620,);
    _goto 12561
  _);
  P12501;
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
