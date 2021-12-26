(*=p-,t-,m-,д+*)
(* д+ = get(INP) -> code(=16ПВ76312,) *)
_program ШККАЛ;
_label 3606,3613,3652,3655;
_const c54=54;c1013=1013B;
loc1=1660730B;loc2=6400230B;c4=4;c5='5';c25=25;
etx='{377';c62=62;c1008=1008;c400='000400';sp=' ';dot='.';
lf = '{175';
minus='-';eq='=';admID='417700';opar='(';cpar=')';bar='I';
c45=45;c49=49;c36=36;c40=40;c61=61;K='K';c51=51;c60=60;
_type letter='A'..'Z'; digit='0'..'9';bitset=_set _of 0..47;
page=_array[0..1023] _of integer; 
sixchars=_array [1..6] _of char;
t2=0..6;t3=0..7;t4=1..2;t5=0..39;
contents = _record val:integer _end;
OneSide = _record move:integer; pits:_array [1..7] _of contents _end;
_var cmd, tambov: alfa;
ЗАПРЕТ:boolean;
admin:boolean;
startCpuTime,startWallClock, g16z, g17z:integer;
pptr:@page;
userID:sixchars;
g25z, g26z, g27z, g28z, g29z, g30z, g31z, g32z, g33z, g34z, g35z:integer;
pckUID:alfa;
g37z:integer;
g38z:bitset;
g39z:integer;
g40z:bitset;
g41z, g42z: integer;
prnEnable, g44z, dpyEnable:boolean;
g46z: integer;
g47z:_array [0..39] _of integer;
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
  _if prnEnable  _then _(
    code(СЧ76013=УИ7,);
    v1 := 2; code(ЗЧ76013=,);
    _if top _then write(' ==* ')
    _else write(' =-* ');
  _);
  rewrite(INP);
  v2 := 0;
  _while input@ <> etx _do _(
    _if prnEnable _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      ЗАПРЕТ := false;
      putCmd('SLЕ  {377');
      g40z := g40z + [47];
      _goto 1
    _);
    write(INP,input@);
    get(input);
  _); (* while *)
  write(INP, etx);
  1:
  reset(INP);
  _if prnEnable _then _(
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
 _if g33z - i < 170B _then _(
   rewrite(output);
   writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
   ЗАПРЕТ := false;
   putCmd( 'КОН  {377' );
   timeout := true;
  _);
_);

_proced TTOUT;
_var r:alfa;
_(
  writeLN;
  code(СЧ77015=);
  r := ;
 _if r = 'Н{3770000' _then  _GOTO 3606;
_);

_procedure L1451(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
  l2v1z := g47z[l2a1z];
  l2v4z := ;
  l2v1z := sel(l2v4z, 24, 6) + g16z;
  code(СД/6/=2ЗЧ5,МР=СД/-6/,МР=2ЗЧ4,);
  ins(l2v4z, l2v1z, 24, 6);
  g47z[l2a1z] := ;
  _if l2v2z > 0 _then _(
    g16z := l2v2z;
    L1451(l2a1z - 1);
    g16z := 1;
  _);
  _if g17z = 1 _then _(
    l2v3z := 36;
  _) _else _(
    l2v3z := 16;
  _);
  _if (l2a1z <= l2v3z) _and (l2a1z > 0) _then L1451(0);
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

_procedure unpackPits(_var l2a1z:OneSide; l2a2z:integer);
_var i:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  l2a1z.move := ;
  _for i := 1 _to 6 _do
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=);
  code(2СЧ4=СД/-11/,МР=2ИК3,ЗЧ7=);
_);

_procedure getName(_var first:alfa; _var second:alfa);
_var l2v1z:sixchars; bad: boolean; i:integer;
l2v9z:char; l2v10z, l2v11z:alfa;
_(
  l2v10z := first;
  code(7ПАРАЗ=,7Э020=СД/40/,7ЗЧ1=7СА1,ВИ7=Э050104,7СЧ=7ПБ2,C;РАЗ:360741703600000,0,0,К;);
  l2v11z := ;
  unpck(l2v1z[1], l2v11z);
  bad := false;
  _for i := 1 _to 6 _do _(
    l2v9z := l2v1z[i];
    _if _not ((l2v9z _in letter) _or (l2v9z = ' ') _or (l2v9z = '.')) _then
      bad := true;
  _);
  _if bad _then _(
    first := 'НЕТ ТА';
    second := 'КОГО  ';
    exit
  _);
  first := l2v11z;
  code(7CЧ1=);
  second := ;
_);

_procedure drawField(_var pckpits:_array [0..1] _of integer);
_var i, l2v2z:integer;side:OneSide;
_procedure drawPit(pit:integer);
_(
  write(opar:2);
  l2v2z := side.pits[pit].val;
  _if l2v2z = 0 _then
    write(sp:2)
  _else
    write(l2v2z:2);
  write(cpar);
_);  
_( (* drawField *)
  write('ДЖИН':13);
  write(sp:7);
  unpackPits(side, pckpits[0]);
  _for i := 6 _downto 1 _do write(chr(i):5);
  TTOUT;
  write(sp:21);
  _for i := 6 _downto 1 _do drawPits(i);
  TTOUT;
  write(К:15);
  drawPits(7);
  unpackPits(side, pckpits[1]);
  write(sp:32);
  drawPits(7);
  write(К:2);
  TTOUT;
  write(sp:21);
  _for i := 1 _to 6 _do drawPits(i);
  TTOUT;
  write(sp:20);
  _for i := 1 _to 6 _do write(chr(i):5);
  write(sp:9);
  writeUser;
  TTOUT;
_);

_proced L2037;
_(
 write('К    А    Л    А    Х':46, lf, '^^^^^^^^^^^^^^^^^^^^^^^':48);
 TTOUT;
_);

_proced schKalah;
_var l2v1z: _array [0..1] _of integer;
_(
 L1451( 2 );
 write(sp);
 L2037;
 write('
  В КАЛАХ ИГРАЮТ ДВОЕ - ДЖИН И ПОЛЬЗОВАТЕЛЬ.
        КАЖДЫЙ ИГРОК ИМЕЕТ:
   6 "ЛУНОК"  - ИГРОВЫХ ПОЛЕЙ,
   1 "КАЛАХ"  - ЛУНКУ, В КОТОРОЙ НАКАПЛИВАЮТСЯ "КАМНИ".
  ПЕРВОНАЧАЛЬНО КАМНИ ПОРОВНУ РАСПРЕДЕЛЕНЫ ПО ВСЕМ ЛУНКАМ.');
 TTOUT;
 write(lf, 'И Г Р О В О Е   П О Л Е':44, lf);
 TTOUT;
 l2v1z[0] := 60606060606000C;
 l2v1z[1] := ;
 drawField( l2v1z );
 write('
  ВВЕРХУ НАХОДЯТСЯ ЛУНКИ И СЛЕВА КАЛАХ ДЖИНА.
  ВНИЗУ НАХОДЯТСЯ ЛУНКИ И СПРАВА КАЛАХ ПОЛЬЗОВАТЕЛЯ.');
 TTOUT;
 write(lf, 'П Р А В И Л А    И Г Р Ы':44);
 TTOUT;
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
 TTOUT;
 write('  ЕСЛИ ЛУНКИ ОДНОГО ИГРОКА ОПУСТЕЛИ, ТО НЕЗАВИСИМО ОТ ОЧЕРЕДИ ХОДА
ВСЕ КАМНИ ИЗ ЛУНОК ПРОТИВНИКА ПЕРЕНОСЯТСЯ В КАЛАХ ПРОТИВНИКА И ДЕЛАЕТСЯ
ПОДСЧЕТ КАМНЕЙ. ВЫИГРЫВАЕТ ТОТ ИГРОК, В КАЛАХЕ КОТОРОГО КАМНЕЙ БОЛЬШЕ.
В СЛУЧАЕ РАВЕНСТВА ПАРТИЯ ПРИЗНАЕТСЯ НИЧЬЕЙ.
  ПРИ ОЧЕРЕДНОМ ХОДЕ ПОЛЬЗОВАТЕЛЬ УКАЗЫВАЕТ НОМЕР СВОЕЙ ЛУНКИ, ИЗ
КОТОРОЙ БЕРУТСЯ КАМНИ.');
 TTOUT;
 write(lf, 'Д О П О Л Н Е Н И Е':44, lf);
 TTOUT;
 write('  ЕСЛИ ИГРА ПРЕРВАЛАСЬ ИЗ-ЗА НЕХВАТКИ ВЦП, ТО ПАРТИЯ ОТКЛАДЫВАЕТСЯ
И ЕЕ МОЖНО ПРОДОЛЖИТЬ ПРИ СЛЕДУЮЩЕМ ВЫЗОВЕ ДЖИНА. ОТЛОЖЕННАЯ ПАРТИЯ
ЧЕРЕЗ НЕДЕЛЮ СБРАСЫВАЕТСЯ И СЧИТАЕТСЯ ПРОИГРАННОЙ.
  К ИГРЕ МОЖНО ОБРАЩАТЬСЯ ТАКЖЕ В ВИДЕ:
     КАЛАХ  ТРЕНИРОВКА  [ КАТЕГОРИЯ ]
В ЭТОМ СЛУЧАЕ РЕЗУЛЬТАТ СЧИТАЕТСЯ НИЧЕЙНЫМ И НЕ УЧИТЫВАЕТСЯ.');
 TTOUT;
 write('  ЕСЛИ ОЧЕРЕДНЫЕ ХОДЫ ЯВЛЯЮТСЯ ХОДАМИ В КАЛАХ, ТО МОЖНО СРАЗУ ЗАДАВАТЬ
ПОСЛЕДОВАТЕЛЬНОСТЬ ТАКИХ ХОДОВ, РАЗДЕЛЯЯ ИХ ЗАПЯТОЙ ИЛИ ПРОБЕЛОМ.
ДАЛЕЕ МОЖНО ДОБАВИТЬ ПРОИЗВОЛЬНЫЙ ТЕКСТ.
  ПАРТИЮ МОЖНО ПОПЫТАТЬСЯ ПРЕРВАТЬ, НАБРАВ СООТВЕТСТВУЮЩУЮ ПРОСЬБУ
ПОСЛЕ ИЛИ ВМЕСТО ОЧЕРЕДНОГО ХОДА.
  ЕСЛИ ИГРОВОЕ ПОЛЕ ПОЧЕМУ-ЛИБО ИСПОРТИЛОСЬ, ЕГО МОЖНО ВОССТАНОВИТЬ,
НАБРАВ ЛИТЕРУ "П" ВМЕСТО ОЧЕРЕДНОГО ХОДА.');
 TTOUT;
 _);
_proced schTourn;
 _(
 L1451(2);
 write(lf, 'Т У Р Н И Р':44, lf);
 TTOUT;
 write('  ВСЕ ИГРАЮЩИЕ В КАЛАХ АВТОМАТИЧЕСКИ УЧАСТВУЮТ В ТУРНИРЕ "ДЖИНН-ЧЕЛОВЕК".');
 TTOUT;
 write('ЕЖЕДНЕВНО МОЖНО СЫГРАТЬ НЕ БОЛЕЕ ', c5, ' ПАРТИЙ.');
 TTOUT;
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
 TTOUT;
 _);

_procedure writeZone(nu, zzzz: integer);
_( code(=14ПВ77457,) _);

_procedure checkAdmin;
_(
  _if _not admin _then _(
    write('ВАМ НЕЛЬЗЯ');
    TTOUT;
    _GOTO 3606;
  _)
_);

_procedure L2214;
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
  g16z := l2v1z _div 4;
  L1451(31);
  (q) g16z := shift(l2v2z, 9);
  L1451(33); 
_);
_proced modePrint;
_label 1, 2;
_var l2v1z:integer;
_(
  _select
  INP@ = 'Д': 1: _(
    l2v1z := 2; code(ЛС76013=ЗЧ76013,);
    writeln('ВКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    prnEnable := true;
    _if g44z  _then _(
      code(СЧ=Э06276,);
      g44z := false;
    _);
  _);
  INP@  = 'Н': 2: _(
    prnEnable := false;
    writeln('ВЫКЛЮЧЕНА ПЕЧАТЬ АЦПУ');
    code(СЧ76013=ЛУ13,ЗЧ76013=);
  _);
  INP@ = etx: _if prnEnable _then _goto 2 _else _goto 1;
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
    dpyEnable := true;
  _);
  INP@  = 'Н': 2: _(
    dpyEnable := false;
    writeln('ВЫКЛЮЧЕНА АЧА НА ЭКРАН');
    l2v1z := 2; code(ЛУ76013=ЗЧ76013,СЧ=ЗЧ77015,);
  _);
  INP@ = etx: _if dpyEnable _then _goto 2 _else _goto 1;
  true: writeln('НЕПОНЯТНО')
  _end
 _);
_procedure exec(arg:integer);
_procedure L2340(_var f:text; _var i:integer; j:integer); _( code(ПБ76022=,); _);
_(
  _if ЗАПРЕТ _then _GOTO 3655;
  g40z := (g40z + [13]);
  L2214;
  L2340(INP, g25z, 62);
_);

_procedure L2371;
_procedure L2363(_var f:text; _var i:integer; j:integer); _( code(ПБ76021=); _);
_(
  L2363(INP, g25z, 62);
  unpck(userID[1], pckUID);
  userID[5] := sp;
  admin := pckUID = admID;
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
categ, curCat, totDispl, Homo, Djin, l2v15z:integer;
l2v16z, l2v17z, l2v18z:integer;
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
  write(got[2], dot, got[3], got[4], dot, got[5], got[6], sp);
 _);

(* Level 3 *) _proced drawLine(l3a1z:char);
_var l3v1z:integer;
_(
  write(sp:2 );
  _for l3v1z := 1 _to 41 _do
    write(l3a1z);
 TTOUT;
 _);

(* Level fora *) _function fora(l3a1z, l3a2z, l3a3z:integer):integer;
_label 2644;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z, l3v6z:integer; 
(* Level L2561 *) _function L2561(l4a1z:integer):boolean;
_var l4v1z, l4v2z, l4v3z:integer;
_(
  l4v3z := l4a1z + l3a2z;
  _if l4v3z = 0 _then _(  L2561 := false; EXIT _);
  _if l3v5z = 0 _then _(  L2561 := true;  EXIT _);
  l4v1z := l4a1z * l3v5z;
  l4v2z := l2v15z * l4v3z;
  _if l4v1z = l4v2z _then _(
    _if l4v1z = 0 _then _(
      L2561 := l3a2z < l2v16z;
    _) _else _(
      L2561 := (l4a1z > l3a2z) _and (l4a1z > l2v15z) _or (l4a1z < l3a2z) _and (l4a1z < l2v15z);
    _)
  _) _else _(
    L2561 := l4v1z > l4v2z;
  _)
_);
_( (* fora *)
  _if totDispl = 1 _then _(  fora := 0; EXIT _);
  l3v2z := 255 - l3a1z - l3a2z;
  _if l3v2z = 0 _then 2644: _( fora := 256; EXIT _);
  l3v3z := 0;
  l3v5z := l2v15z + l2v16z;
  _while l3a3z < l2v18z _do _(
    _select
    l3a3z < 3: _(
      l3v4z := l3a2z - l3a1z + 1;
      _if l3v4z > l3v2z _then _goto 2644;     
      l3v2z := l3v2z - l3v4z;
      l3v3z := l3v3z + l3v4z;
      l3a1z := 0;
      l3a2z := ;
      l3a3z := l3a3z + 1;
    _);
    true: l3a3z := l3a3z + 1 
    _end;
 _);
 _if (l3a3z = 3) & (l3a1z + l3a2z < 25) & (l3v5z >= 25) _then _(
   l3v4z := 25 - l3a1z - l3a2z;
   l3v3z := l3v3z + l3v4z;
   l3a1z := l3a1z + l3v4z;
   l3v2z := l3v2z - l3v4z;
 _);
 _if l3v5z < 25 _then l3v6z := 25 - l3a1z - l3a2z
 _else l3v6z := l3v2z;
 _for l3v1z := 0 _to l3v6z _do _(
   _if L2561(l3a1z + l3v1z) _then _(  fora := l3v3z + l3v1z; EXIT _);
 _);
 _if (l3a3z = 3) & (l3v5z < 25) _then fora := l3v3z + 25 - l3a1z - l3a2z
 _else fora := 256;
_);
_( (* tournament *)
 mask := '    00';
 totDjin := 0;
 totHomo := ;
 uidDigs := ;
 totDispl := ;
 stats := ;
 L1451(11);
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
  readZone(66B, 1013B);
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
    writeZone( 66B, 1013B );
    deq66;
    _for i := 1 _to 4 _do write(want[i]);
    _if delete  _then  write(' НЕ НАЙДЕН') _else  write(' ИСКЛЮЧЕН');
    writeln;
    _GOTO 3606;
  _); (* 3101 *)
  _if INP@ = 'Q' _then _(
    checkAdmin;
    enq66;
    readZone( 66B, 1013B );
    nEnt := pptr@[1];
    _for n := 1 _to nEnt _do _(
      ins(pptr@[1008-n], 0, 29, 3);
    _);
    writeZone( 66B, 1013B );
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
  TTOUT;
  write('С ':6);
  (*=c-*)wrDate(pptr@[1008] ); (*=c+*)
  write(' ПО ');
  wrDate(   getDate  );
  write('  НА ', getTime );
  TTOUT;
  drawLine( '=' );
 _if _not stats | (catSet <> []) _then _(
    write('  IМЕСТО ШИФР  ФАМИЛИЯ      НОМО  ДЖИН ФОРI');
   _if admin  _then  write(' ОТЛ');
   TTOUT;
   drawLine( '-' );
   aboveDots := true;
   _while catSet <> [] _do _(
  n := minel(catSet);
  catSet := catSet - [n];
  categ := 5 - n;
  l2v17z := ;
  pos := 0;
  _select
  categ = 4: write('  I^^^^^^^^^^^ Э Ф Е Н Д И ^^^^^^^^^^^^^^^I');
  categ = 3: write('  I^^^^^^^^ У Ч А С Т Н И К И ^^^^^^^^^^^^I');
  categ = 2: write('  I^^^^^^^^ К А Н Д И Д А Т Ы ^^^^^^^^^^^^I');
  categ = 1: write('  I^^^^^^^^^^^ Ю Н И О Р Ы ^^^^^^^^^^^^^^^I')
  _end;
 TTOUT;
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
      write(bar:3, pos:4, sp:2);
      _for i := 1 _to 4  _do write(got[i]);
      getName( curUID, name2 );
      write(sp:2, curUID, name2, Homo:5, Djin:5);
      i :=   fora( Homo, Djin, l2v17z );
      _if (totDispl > 1) & (i = 0) _then  g38z := g38z + [28];
      _select
        i < 256: write( i:4 );
        true:    write('  >>')
      _end;
      l2v15z := Homo;
      l2v16z := Djin;
      l2v18z := l2v17z;
      write(bar:2 );
      totDjin := Djin + totDjin;
      totHomo := Homo + totHomo;
      _if admin _then  write(sel(curRec, 16, 8): 4);
      TTOUT;
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
  TTOUT;
  drawLine( '=' );
  _); (* 3477 *)
  _if admin | stats _then _(
    write(' ТРЕН ПАРТ ВЫИГ СДАЛ');
    write('    ВЦП    ДУМ   СЕАН   ЭНТР    ПОЗ    ХОД   СРЕЗ   УСИЛ');
    TTOUT;
    _for categ := 1 _to 4 _do _(
      curptr := ptr(categ * 12 + 27372);
      totHomo := curptr@[0];
      _select
      categ = 1: ch := 'Ю';
      categ = 2: ch := 'К';
      categ = 3: ch := 'У';
      true: ch := 'Э'
      _end;
      write(ch, curptr@[11]:4, totHomo:5, curptr@[9]:5, curptr@[10]:5 );
      _for i := 1 _to 8 _do wrStat( i );  
      TTOUT;
    _); (* 3561 *) 
  _);
_);
_(
 g16z := 1;
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
