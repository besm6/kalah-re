(*=p-,t-,m-,д+*)
(* д+ = get(INP) -> code(=16ПВ76312,) *)
_program ШККАЛ;
_label 3606,3613,3652,3655;
_const c54=54;zonePlayers=1013B;
loc1=1660730B;loc2=6400230B;c4=4;c5='5';c25=25;
etx='{377';userEntryLen=62;c1008=1008;c400='000400';space=' ';dot='.';
lf = '{175';
minus='-';eq='=';admID='417700';oparen='(';cparen=')';bar='I';
c45=45;c49=49;c36=36;c40=40;c61=61;K='K';c51=51;c60=60;
_type letter='A'..'Z'; digit='0'..'9';bitset=_set _of 0..47;
page=_array[0..1023] _of integer;
sixchars=_array [1..6] _of char;
t2=0..6;t3=0..7;t4=1..2;t5=0..39;
contents = _record val:integer _end;
OneSide = _record move:integer; pits:_array [1..7] _of contents _end;
EntryRec = _record
  g25z, g26z, g27z, g28z, g29z, g30z, g31z, g32z, g33z, g34z, g35z:integer;
  pckUID:alfa;
  g37z:integer;
  g38z:bitset;
  g39z:integer;
  g40z:bitset;
  g41z, g42z: integer;
  prnEnable, g44z, dpyEnable:boolean;
  g46z: integer;
  statsArray:_array [0..39] _of integer
_end;
_var cmd, tambov: alfa;
ЗАПРЕТ:boolean;
admin:boolean;
startCpuTime,startWallClock, statVal, statVersion:integer;
pptr:@page;
userID:sixchars;
userData:EntryRec;
INP:text;

_procedure L1321; _( code(=14ПВ76255,) _); (* ???? *)

_proced writeUser;
_var i:integer;
_(
 _for i := 1 _to 5 _do write(userID[i]);
_);

_proced putCmd(cmd:alfa);
_(
 rewrite(INP);
 write(INP, cmd);
_);

_procedure TTIN(top:boolean);
_label 1;
_var v1, v2: integer;
_(
  _if top _then  BIND(' ==* {172') _else  BIND(' =-* {172');
  _if userData.prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _if top _then write(' ==* ')
    _else write(' =-* ');
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> etx _do _(
    _if userData.prnEnable _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      ЗАПРЕТ := false;
      putCmd('SLЕ  {377');
      userData.g40z := userData.g40z + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _); (* while *)
  write(INP, etx);
  1:
  reset(INP);
  _if userData.prnEnable _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _);
_);

_function timeout:boolean;
_var i:integer;
_(
 timeout := false;
 code(Э0634=,);
 i := ;
 _if userData.g33z - i < 120 _then _(
   rewrite(output);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   putCmd( 'КОН  {377' );
   timeout := true;
  _);
_);

_proced writeTerminalOutput;
_var r:alfa;
_(
  writeLN;
  code(СЧ77015=);
  r := ;
 _if r = 'Н{3770000' _then  _GOTO 3606;
_);

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
    divisor := 16;
  _);
  _if (index <= divisor) _and (index > 0) _then updateStatistics(0);
_);

_function getTime:alfa;
_var i, j:integer;
p:sixchars; r:alfa;
_(
  code(Э05310=,);
  i := ;
  i := i _div 3000;
  p[1] := ' ';
  p[4] := '.';
  j := i _div 600;
  p[2] := ;
  i := i - j * 600;
  j := i _div 60;
  p[3] := ;
  i := i - j * 60;
  j := i _div 10;
  p[5] := ;
  p[6] := chr(i - j * 10);
  pck(p[1], r);
  getTime := r;
_);

_procedure readZone(nu, zzzz: integer);
_( code(=14ПВ77451,) _);

_procedure enq66;
_var i:integer;
_(
  i := 66B;
  code(СД/-14/=Э050105,Э050115=,)
_);
_procedure deq66;
_var i:integer;
_(
  i := 66B;
  code(СД/-14/=Э050105,Э050116=,)
_);

_function getDate: alfa;
_var k:integer;l:alfa;
_(
  k:=00003777776Т;l:='3 1   ';
  СОDЕ(Э050114=,2СБ4=2РБ5,СД120=2ЗЧ4,МР=СД70,2ЗЧ5=МР,2СМ5=СД140,17ЛС=2СМ4,СД60=17ЛС,);
  getDate := ;
_);

_function getCmd(_var a:alfa; b:integer):boolean;
_var l:_array[1..7] _of integer;
_( code(=14ПВ77400,) _);

_procedure unpPitState(_var l2a1z:OneSide; l2a2z:integer);
_var i:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  l2a1z.move := ;
  _for i := 1 _to 6 _do
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=);
  code(2СЧ4=СД/-11/,МР=2ИК3,ЗЧ7=);
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

_procedure dsplBoard(_var pckPits:_array [0..1] _of integer);
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
    write(chr(pitIndex):5);
  writeTerminalOutput;
  write(space:21);
  _for pitIndex := 6 _downto 1 _do
   drawPit( pitIndex );
  writeTerminalOutput;
  write(К:15);
  drawPit( 7 );
  unpPitState(unpackedSide, pckpits[1]);
  write(space:32);
  drawPit( 7 );
  write(К:2);
  writeTerminalOutput;
  write(space:21);
  _for pitIndex := 1 _to 6 _do
    drawPit( pitIndex );
  writeTerminalOutput;
  write(space:20);
  _for pitIndex := 1 _to 6 _do
   write(chr(pitIndex):5);
  write(space:9);
  writeUserName;
  writeTerminalOutput;
_);

_proced L2037;
_(
 write('К    А    Л    А    Х':46, lf, '^^^^^^^^^^^^^^^^^^^^^^^':48);
 writeTerminalOutput;
_);

_proced schKalah;
_var pos: _array [0..1] _of integer;
_(
 updateStatistics( 2 );
 write(space);
 L2037;
 write('
  В КАЛАХ ИГРАЮТ ДВОЕ - ДЖИН И ПОЛЬЗОВАТЕЛЬ.
        КАЖДЫЙ ИГРОК ИМЕЕТ:
   6 "ЛУНОК"  - ИГРОВЫХ ПОЛЕЙ,
   1 "КАЛАХ"  - ЛУНКУ, В КОТОРОЙ НАКАПЛИВАЮТСЯ "КАМНИ".
  ПЕРВОНАЧАЛЬНО КАМНИ ПОРОВНУ РАСПРЕДЕЛЕНЫ ПО ВСЕМ ЛУНКАМ.');
 writeTerminalOutput;
 write(lf, 'И Г Р О В О Е   П О Л Е':44, lf);
 writeTerminalOutput;
 pos[0] := 60606060606000C;
 pos[1] := ;
 dsplBoard( pos );
 write('
  ВВЕРХУ НАХОДЯТСЯ ЛУНКИ И СЛЕВА КАЛАХ ДЖИНА.
  ВНИЗУ НАХОДЯТСЯ ЛУНКИ И СПРАВА КАЛАХ ПОЛЬЗОВАТЕЛЯ.');
 writeTerminalOutput;
 write(lf, 'П Р А В И Л А    И Г Р Ы':44);
 writeTerminalOutput;
 write('
  ИГРОКИ ДЕЛАЮТ ХОДЫ ПО ОЧЕРЕДИ. ПРИ ОЧЕРЕДНОМ ХОДЕ ИГРОК БЕРЕТ
ВСЕ КАМНИ ИЗ ОДНОЙ ИЗ СВОИХ ЛУНОК И РАСКЛАДЫВАЕТ ИХ ПО ОДНОМУ, НАЧИНАЯ
СО СЛЕДУЮЩЕЙ ЛУНКИ (ХОДОМ ПРОТИВ ЧАСОВОЙ СТРЕЛКИ), ВКЛЮЧАЯ СВОЙ
КАЛАХ И ЛУНКИ ПРОТИВНИКА. КАЛАХ ПРОТИВНИКА ПРИ ЭТОМ ПРОПУСКАЕТСЯ.
  ЕСЛИ ПОСЛЕДНИЙ КАМЕНЬ ПОПАДАЕТ В СВОЙ КАЛАХ, ТО ДЕЛАЕТСЯ ЕЩЕ ОДИН
ХОД.
  ЕСЛИ ПОСЛЕДНИЙ КАМЕНЬ ПОПАДАЕТ В СВОЮ ПУСТУЮ ЛУНКУ, А В ПРОТИВОПОЛОЖНОЙ
ЛУНКЕ ПРОТИВНИКА ЕСТЬ КАМНИ, ТО СОДЕРЖИМОЕ ЭТИХ ДВУХ ЛУНОК ПЕРЕНОСИТСЯ
В КАЛАХ ИГРОКА, СДЕЛАВШЕГО ХОД.');
 writeTerminalOutput;
 write('  ЕСЛИ ЛУНКИ ОДНОГО ИГРОКА ОПУСТЕЛИ, ТО НЕЗАВИСИМО ОТ ОЧЕРЕДИ ХОДА
ВСЕ КАМНИ ИЗ ЛУНОК ПРОТИВНИКА ПЕРЕНОСЯТСЯ В КАЛАХ ПРОТИВНИКА И ДЕЛАЕТСЯ
ПОДСЧЕТ КАМНЕЙ. ВЫИГРЫВАЕТ ТОТ ИГРОК, В КАЛАХЕ КОТОРОГО КАМНЕЙ БОЛЬШЕ.
В СЛУЧАЕ РАВЕНСТВА ПАРТИЯ ПРИЗНАЕТСЯ НИЧЬЕЙ.
  ПРИ ОЧЕРЕДНОМ ХОДЕ ПОЛЬЗОВАТЕЛЬ УКАЗЫВАЕТ НОМЕР СВОЕЙ ЛУНКИ, ИЗ
КОТОРОЙ БЕРУТСЯ КАМНИ.');
 writeTerminalOutput;
 write(lf, 'Д О П О Л Н Е Н И Е':44, lf);
 writeTerminalOutput;
 write('  ЕСЛИ ИГРА ПРЕРВАЛАСЬ ИЗ-ЗА НЕХВАТКИ ВЦП, ТО ПАРТИЯ ОТКЛАДЫВАЕТСЯ
И ЕЕ МОЖНО ПРОДОЛЖИТЬ ПРИ СЛЕДУЮЩЕМ ВЫЗОВЕ ДЖИНА. ОТЛОЖЕННАЯ ПАРТИЯ
ЧЕРЕЗ НЕДЕЛЮ СБРАСЫВАЕТСЯ И СЧИТАЕТСЯ ПРОИГРАННОЙ.
  К ИГРЕ МОЖНО ОБРАЩАТЬСЯ ТАКЖЕ В ВИДЕ:
     КАЛАХ  ТРЕНИРОВКА  [ КАТЕГОРИЯ ]
В ЭТОМ СЛУЧАЕ РЕЗУЛЬТАТ СЧИТАЕТСЯ НИЧЕЙНЫМ И НЕ УЧИТЫВАЕТСЯ.');
 writeTerminalOutput;
 write('  ЕСЛИ ОЧЕРЕДНЫЕ ХОДЫ ЯВЛЯЮТСЯ ХОДАМИ В КАЛАХ, ТО МОЖНО СРАЗУ ЗАДАВАТЬ
ПОСЛЕДОВАТЕЛЬНОСТЬ ТАКИХ ХОДОВ, РАЗДЕЛЯЯ ИХ ЗАПЯТОЙ ИЛИ ПРОБЕЛОМ.
ДАЛЕЕ МОЖНО ДОБАВИТЬ ПРОИЗВОЛЬНЫЙ ТЕКСТ.
  ПАРТИЮ МОЖНО ПОПЫТАТЬСЯ ПРЕРВАТЬ, НАБРАВ СООТВЕТСТВУЮЩУЮ ПРОСЬБУ
ПОСЛЕ ИЛИ ВМЕСТО ОЧЕРЕДНОГО ХОДА.
  ЕСЛИ ИГРОВОЕ ПОЛЕ ПОЧЕМУ-ЛИБО ИСПОРТИЛОСЬ, ЕГО МОЖНО ВОССТАНОВИТЬ,
НАБРАВ ЛИТЕРУ "П" ВМЕСТО ОЧЕРЕДНОГО ХОДА.');
 writeTerminalOutput;
 _);
_proced schTourn;
 _(
 updateStatistics(2);
 write(lf, 'Т У Р Н И Р':44, lf);
 writeTerminalOutput;
 write('  ВСЕ ИГРАЮЩИЕ В КАЛАХ АВТОМАТИЧЕСКИ УЧАСТВУЮТ В ТУРНИРЕ "ДЖИНН-ЧЕЛОВЕК".');
 writeTerminalOutput;
 write('ЕЖЕДНЕВНО МОЖНО СЫГРАТЬ НЕ БОЛЕЕ ', c5, ' ПАРТИЙ.');
 writeTerminalOutput;
 write('  ИМЕЮТСЯ ЧЕТЫРЕ КАТЕГОРИИ ИГРОКОВ: ЮНИОРЫ (НАЧИНАЮЩИЕ), КАНДИДАТЫ,
УЧАСТНИКИ И "ЭФЕНДИ". ЮНИОРЫ И КАНДИДАТЫ, ДОСТИГШИЕ ПРЕИМУЩЕСТВА
НАД ДЖИНОМ, ПЕРЕХОДЯТ СООТВЕТСТВЕННО В КАНДИДАТЫ И УЧАСТНИКИ. СЧЕТ
ПРИ ЭТОМ ОБНУЛЯЕТСЯ.
  УЧАСТНИК, ДОСТИГШИЙ ПРЕИМУЩЕСТВА НАД ДЖИНОМ И СЫГРАВШИЙ В КАЧЕСТВЕ
УЧАСТНИКА НЕ МЕНЕЕ', 25:3, ' ПАРТИЙ, ОТНОСИТСЯ К КАТЕГОРИИ "ЭФЕНДИ".
КАЖДЫЙ УЧАСТНИК ТУРНИРА МОЖЕТ СЫГРАТЬ НЕ БОЛЕЕ ', 255:1, ' ПАРТИЙ.
МЕСТО ОПРЕДЕЛЯЕТСЯ ПРОЦЕНТОМ ВЫИГРАННЫХ ПАРТИЙ.
  ТУРНИР ОТКРЫВАЕТСЯ И ЗАКРЫВАЕТСЯ АДМИНИСТРАТОРОМ. ПРИ ОТКРЫТОМ
ТУРНИРЕ ТРЕНИРОВОЧНЫЕ ПАРТИИ ИГРАЮТСЯ ТОЛЬКО В СООТВЕТСТВИИ С КАТЕГОРИЕЙ
ПОЛЬЗОВАТЕЛЯ.
  С ПОМОЩЬЮ ПРИКАЗА:
     ТУРНИР [<ШИФР 1-4 ЗНАКА>] [Э,У,К,Ю]
МОЖНО СЛЕДИТЬ ЗА ХОДОМ СОРЕВНОВАНИЯ. В КОЛОНКЕ "ФОРА" УКАЗЫВАЕТСЯ
ЧИСЛО ПАРТИЙ, КОТОРОЕ НУЖНО ВЫИГРАТЬ, ЧТОБЫ ОБОЙТИ ВЫШЕСТОЯЩЕГО
ИГРОКА.');
 writeTerminalOutput;
 _);

_procedure writeZone(nu, zzzz: integer);
_( code(=14ПВ77457,) _);

_procedure checkAdmin;
_(
  _if _not admin _then _(
    write('ВАМ НЕЛЬЗЯ');
    writeTerminalOutput;
    _GOTO 3606;
  _)
_);

_procedure account;
_var l2v1z, l2v2z: integer;
_(
  code(Э0634=,);
  l2v1z := ;
  l2v1z := l2v1z - startCpuTime;
  _if l2v1z < 0 _then exit;
  code(Э05310=,);
  l2v2z := ;
  l2v2z := l2v2z - startWallClock;
  _if l2v2z < 0 _then exit;
  statVal := l2v1z _div 4;
  updateStatistics(31);
  (q) statVal := shift(l2v2z, 9);
  updateStatistics(33);
_);
_proced modePrint;
_label 1, 2;
_var l2v1z:integer;
_(
  _select
  INP@ = 'Д': 1: _(
    l2v1z := 2; code(ЛС76013=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    userData.prnEnable := true;
    _if userData.g44z  _then _(
      code(СЧ=Э06276,);
      userData.g44z := false;
    _);
  _);
  INP@  = 'Н': 2: _(
    userData.prnEnable := false;
    writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    code(СЧ76013=ЛУ13,ЗЧ76013=);
  _);
  INP@ = etx: _if userData.prnEnable _then _goto 2 _else _goto 1;
  true: writeln('НЕПОНЯТНО')
  _end
 _);

_proced modeScreen;
_label 1, 2;
_var l2v1z:integer;
_(
  _select
  INP@ = 'Д': 1: _(
    code(СЧ13=ЛС76013,ЗЧ76013=);
    writeln('ВКЛЮЧЕНА АЧА НА ЭКРАН');
    userData.dpyEnable := true;
  _);
  INP@  = 'Н': 2: _(
    userData.dpyEnable := false;
    writeln('ВЫКЛЮЧЕНА АЧА НА ЭКРАН');
    l2v1z := 2; code(ЛУ76013=ЗЧ76013,СЧ=ЗЧ77015,);
  _);
  INP@ = etx: _if userData.dpyEnable _then _goto 2 _else _goto 1;
  true: writeln('НЕПОНЯТНО')
  _end
 _);
_procedure exec(arg:integer);
_procedure L2340(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
  _if ЗАПРЕТ _then _GOTO 3655;
  userData.g40z := (userData.g40z + [13]);
  account;
  L2340(INP, userData.g25z, userEntryLen);
_);

_procedure L2371;
_procedure L2363(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=); _);
_(
  L2363(INP, userData.g25z, userEntryLen);
  unpck(userID[1], userData.pckUID);
  userID[5] := space;
  admin := userData.pckUID = admID;
  _GOTO 3613;
_);

_proced school;
_label 2413;
_var l2v1z: alfa; l2v2z:boolean;
_(
 2413:
 l2v2z :=   getCmd( l2v1z, 3);
 _if _not l2v2z _then _(
   writeln('ЧТО ? <LАN,ШАШ,БЕГ,ЛОТ,КАЛ,ТУР,ГЛИ,КУБ>');
   TTIN( false );
   _goto 2413;
 _) _else _select
   l2v1z = 'КАЛ   ': schKalah;
   l2v1z = 'ТУР   ': schTourn;
   l2v1z = 'ШКО   ': _goto 2413;
   (l2v1z = 'КОН   ') | (l2v1z = 'ВЫХ   '): exit;
   true: _( putCmd( 'ШКО   ' );
     write(INP, l2v1z);
     INP@ := etx;
     put(INP);
     _GOTO 3652;
   _)
 _end
_);

_proced tournament;
_label 3275;
_const c12=12;c50=50;c41=41;
_var mask:alfa; unus1, n, i, nEnt, totDjin, totHomo:integer;
uidDigs, pos:integer;
categ, curCat, totDispl, Homo, Djin, prevHomo:integer;
prevDjin, initCat, prevCat:integer;
curRec:integer;
curUID:alfa;
unus2:integer;
name2:alfa;
got:sixchars;
want:sixchars;
aboveDots,good,stats,delete:boolean;
catSet:bitset;
ch:char;
curptr:@page;
(* Level 3 *) _proced wrStat(l3a1z: integer);
_var l3v1z, l3v2z:integer;
_(
  l3v1z := curptr@[l3a1z];
  _if l3a1z < 4 _then _(
    l3v1z := round(l3v1z / 50);
  _);
  _if totHomo > 0 _then _(
    l3v1z := round(l3v1z*10 / totHomo);
  _);
  l3v2z := l3v1z _div 10;
  l3v1z := l3v1z - l3v2z * 10;
  write(l3v2z:5, dot, l3v1z:1);
_);
(* Level 3 *) _proced wrDate(l3a1z:alfa);
_(
  unpck(got[1], l3a1z );
  write(got[1]:2 );
  write(got[2], dot, got[3], got[4], dot, got[5], got[6], space);
 _);

(* Level 3 *) _proced drawLine(c:char);
_var i:integer;
_(
  write(space:2 );
  _for i := 1 _to 41 _do
    write(c);
  writeTerminalOutput;
_);

(*
  FORA - Calculate Tournament Handicap

  Purpose: Calculate the "fora" (handicap) - the number of additional games
  a player needs to win to overtake the player ranked directly above them in
  the tournament standings.

  Parameters:
    currHum - Current player's human/user wins
    currJin - Current player's Jinn/AI wins
    currCat - Current player's category (0=Junior, 1=Candidate, 2=Participant, 3=Efendi)

  Context Variables (from outer scope):
    totDispl - Number of players displayed so far (if 1, this is the top player)
    prevHomo - Previous player's human wins
    prevDjin - Previous player's Jinn wins
    prevCat  - Previous player's category

  Algorithm:
    1. Top player check: If this is the first displayed player (totDispl = 1),
       return 0 (no one to overtake)

    2. Game limit check: Calculate remaining games until the 255-game limit;
       if already at limit, return 256 (impossible)

    3. Category transitions: If current player is in a lower category than the
       previous player, calculate games needed to advance through categories
       (for Juniors/Candidates: need to overcome the deficit in wins)

    4. Minimum game requirement: For Participants (category 3), ensure at least
       25 total games

    5. Win ratio comparison: The nested wldRank function compares win ratios
       between players using cross-multiplication to avoid division. It determines
       if adding addHum wins to the current player would result in a better win
       ratio than the previous player

    6. Linear search: Try increasing numbers of additional wins until the current
       player would rank ahead

  Return values:
    0-255 - Number of games needed to overtake previous player
    256   - Impossible to overtake (would exceed game limits)
*)
_function fora(currHum, currJin, currCat:integer):integer;
_label 2644;
_var
  i:integer;               (* Loop counter *)
  remGms:integer;          (* Remaining games until 255 total *)
  accum:integer;           (* Accumulated handicap from category transitions *)
  delta:integer;           (* Games needed for category transition *)
  prevTot:integer;         (* Previous player's total games *)
  limit:integer;           (* Search limit for win ratio comparison *)
(* Check if current player would rank ahead of previous player *)
_function wldRank(addHum:integer):boolean;
_var curPrd:integer;       (* Current player product for ratio *)
    prvPrd:integer;        (* Previous player product for ratio *)
    totJin:integer;        (* Total Jinn wins with additional games *)
_(
  totJin := addHum + currJin;
  _if totJin = 0 _then _(  wldRank := false; EXIT _);
  _if prevTot = 0 _then _(  wldRank := true;  EXIT _);
  curPrd := addHum * prevTot;
  prvPrd := prevHomo * totJin;
  _if curPrd = prvPrd _then _(
    _if curPrd = 0 _then _(
      wldRank := currJin < prevDjin;
    _) _else _(
      wldRank := (addHum > currJin) _and (addHum > prevHomo) _or (addHum < currJin) _and (addHum < prevHomo);
    _)
  _) _else _(
    wldRank := curPrd > prvPrd;
  _)
_);
_( (* fora *)
  _if totDispl = 1 _then _(  fora := 0; EXIT _);
  remGms := 255 - currHum - currJin;
  _if remGms = 0 _then 2644: _( fora := 256; EXIT _);
  accum := 0;
  prevTot := prevHomo + prevDjin;
  _while currCat < prevCat _do _(
    _select
    currCat < 3: _(
      delta := currJin - currHum + 1;
      _if delta > remGms _then _goto 2644;
      remGms := remGms - delta;
      accum := accum + delta;
      currHum := 0;
      currJin := ;
      currCat := currCat + 1;
    _);
    true: currCat := currCat + 1
    _end;
 _);
 _if (currCat = 3) & (currHum + currJin < 25) & (prevTot >= 25) _then _(
   delta := 25 - currHum - currJin;
   accum := accum + delta;
   currHum := currHum + delta;
   remGms := remGms - delta;
 _);
 _if prevTot < 25 _then limit := 25 - currHum - currJin
 _else limit := remGms;
 _for i := 0 _to limit _do _(
   _if wldRank(currHum + i) _then _(  fora := accum + i; EXIT _);
 _);
 _if (currCat = 3) & (prevTot < 25) _then fora := accum + 25 - currHum - currJin
 _else fora := 256;
_);
_( (* tournament *)
 mask := '    00';
 totDjin := 0;
 totHomo := ;
 uidDigs := ;
 totDispl := ;
 stats := ;
 updateStatistics(11);
 _for i := 1 _to 4 _do _(;
  _if INP@ _in digit _then _(
    want[i] := INP@;
    uidDigs := uidDigs + 1;
    get(INP);
  _);
 _);
 L1321;
 delete := INP@ = 'И';
 _if delete _then _(
   checkAdmin;
   enq66;
 _);
  readZone(66B, zonePlayers);
  nEnt := pptr@[1];
  _if delete  _then _(
    _if uidDigs <> 4 _then _(
      writeln('ОШ ШИФ');
    _) _else _(
      _for n := 1 _to nEnt _do _(
        curRec := pptr@[1008 - n];
        code(2РБ3=);
        curUID := ;
        unpck(got[1], curUID);
        good := true;
        (a) _for i := 1 _to 4 _do _(
          _if (want[i] <> got[i]) _then _(
            good := false;
            _exit a
          _);
        _);
        _if good _then _(
          nEnt := nEnt - 1;
          delete := false;
          _for i := n _to nEnt _do _(
            pptr@[1008 - i] := pptr@[1008 - i - 1];
          _);
          pptr@[1] := nEnt;
        _);
      _);
    _); (* 3055 *)
    writeZone( 66B, zonePlayers );
    deq66;
    _for i := 1 _to 4 _do write(want[i]);
    _if delete  _then  write(' НЕ НАЙДЕН') _else  write(' ИСКЛЮЧЕН');
    writeln;
    _GOTO 3606;
  _); (* 3101 *)
  _if INP@ = 'Q' _then _(
    checkAdmin;
    enq66;
    readZone( 66B, zonePlayers );
    nEnt := pptr@[1];
    _for n := 1 _to nEnt _do _(
      ins(pptr@[1008-n], 0, 29, 3);
    _);
    writeZone( 66B, zonePlayers );
    deq66;
    _GOTO 3606;
  _); (* 3133 *)
  L1321;
  _if INP@ = etx _then catSet := [1:4]
  _else _(
    catSet := [];
   _while INP@ <> etx _do _(
   n := 0;
   _select
    INP@ = 'Ю': n := 4;
    INP@ = 'К': n := 3;
    INP@ = 'У': n := 2;
    INP@ = 'Э': n := 1;
    INP@ = 'С': stats := true
  _end;
  catSet := [n] | catSet;
  get(INP);
 _);
 catSet := catSet - [0];
  _); (* 3177 *)
  write('    ТУРНИР  " Д Ж И Н Н - Ч Е Л О В Е К "');
  writeTerminalOutput;
  write('С ':6);
  (*=c-*)wrDate(pptr@[1008] ); (*=c+*)
  write(' ПО ');
  wrDate(   getDate  );
  write('  НА ', getTime );
  writeTerminalOutput;
  drawLine( '=' );
 _if _not stats | (catSet <> []) _then _(
    write('  IМЕСТО ШИФР  ФАМИЛИЯ      НОМО  ДЖИН ФОРI');
   _if admin  _then  write(' ОТЛ');
   writeTerminalOutput;
   drawLine( '-' );
   aboveDots := true;
   _while catSet <> [] _do _(
  n := minel(catSet);
  catSet := catSet - [n];
  categ := 5 - n;
  initCat := ;
  pos := 0;
  _select
  categ = 4: write('  I^^^^^^^^^^^ Э Ф Е Н Д И ^^^^^^^^^^^^^^^I');
  categ = 3: write('  I^^^^^^^^ У Ч А С Т Н И К И ^^^^^^^^^^^^I');
  categ = 2: write('  I^^^^^^^^ К А Н Д И Д А Т Ы ^^^^^^^^^^^^I');
  categ = 1: write('  I^^^^^^^^^^^ Ю Н И О Р Ы ^^^^^^^^^^^^^^^I')
  _end;
 writeTerminalOutput;
3275:
 _for n := 1 _to nEnt _do _(
  curRec := pptr@[1008 - n];
  code(2РБ3=);
  curUID := ;
  curCat := sel(curRec, 24, 4);
  Djin := sel(curRec, 0, 8);
  Homo := sel(curRec, 8, 8);
  _if curCat > 2 _then_(
   _if (curCat = 3) & _not aboveDots  & (Djin + Homo >= 25) _then  curCat := 0;
   _if (curCat = 3) & aboveDots  & (Djin + Homo < 25) _then  curCat := 0;
  _); (* 3327 *)
  _if categ = curCat _then _(
    pos := pos + 1;
    unpck( got[1], curUID );
    good := true;
    (a) _for i := 1 _to uidDigs _do _(
      _if want[i] <> got[i] _then _(
        good := false;
       _exit a;
     _);
    _);
    _if good _then _(
      totDispl := totDispl + 1;
      write(bar:3, pos:4, space:2);
      _for i := 1 _to 4  _do write(got[i]);
      getUserName( curUID, name2 );
      write(space:2, curUID, name2, Homo:5, Djin:5);
      i :=   fora( Homo, Djin, initCat );
      _if (totDispl > 1) & (i = 0) _then  userData.g38z := userData.g38z + [28];
      _select
        i < 256: write( i:4 );
        true:    write('  >>')
      _end;
      prevHomo := Homo;
      prevDjin := Djin;
      prevCat := initCat;
      write(bar:2 );
      totDjin := Djin + totDjin;
      totHomo := Homo + totHomo;
      _if admin _then  write(sel(curRec, 16, 8): 4);
      writeTerminalOutput;
    _);
  _); (* 3446 *)
  _); (* 3450 *)
  _if (categ = 3) & aboveDots _then _(
    aboveDots := false;
    drawLine( '.' );
    _goto 3275;
  _);
  _); (* 3457 *)
  drawLine( '-' );
  write('  I', totDispl:4, '   И Т О Г', totHomo:15, totDjin:5, bar:6 );
  writeTerminalOutput;
  drawLine( '=' );
  _); (* 3477 *)
  _if admin | stats _then _(
    write(' ТРЕН ПАРТ ВЫИГ СДАЛ');
    write('    ВЦП    ДУМ   СЕАН   ЭНТР    ПОЗ    ХОД   СРЕЗ   УСИЛ');
    writeTerminalOutput;
    _for categ := 1 _to 4 _do _(
      curptr := ptr(categ * 12 + 65354C);
      totHomo := curptr@[0];
      _select
      categ = 1: ch := 'Ю';
      categ = 2: ch := 'К';
      categ = 3: ch := 'У';
      true: ch := 'Э'
      _end;
      write(ch, curptr@[11]:4, totHomo:5, curptr@[9]:5, curptr@[10]:5 );
      _for i := 1 _to 8 _do wrStat( i );
      writeTerminalOutput;
    _); (* 3561 *)
  _);
_);
_(
 statVal := 1;
 code(Э0634=,);
 startCpuTime := ;
 code(Э05310=,);
 startWallClock := ;
 pptr := ptr(64000B);
 ЗАПРЕТ := true;
 code(СЧ76233=);
 tambov := ;
 _if tambov <> 'ТАМБОВ' _then code(СЧ0=Э0620,) _else L2371;
 3606:
 _if timeout _then _goto 3652;
 TTIN(true);
 ЗАПРЕТ := false;
 3613:
 _if getCmd(cmd, 3) _then _(
   _if 'ИГР   ' = cmd _then _(
     _if INP@ = etx _then _goto 3606 _else _goto 3613;
   _) _else _( (* 3626 *)
    _select
  'КАЛ   ' = cmd: exec(loc2 _mod 1000000B + 3 * 1000000B);
  'ПЕЧ   ' = cmd: modePrint;
  'ЭКР   ' = cmd: modeScreen;
  'ТУР   ' = cmd: tournament;
  'ШКО   ' = cmd: school;
  'КОН   ' = cmd: 3652: exec(loc1);
  true: _if ЗАПРЕТ _then 3655: writeln('В БЛОКЕ НЕТ ПРИКАЗА ', cmd) _else _goto 3652
  _end;
  _);
  _) _else writeln('НЕ ПОНИМАЮ');
  _goto 3606
_).
