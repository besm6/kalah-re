(*=p-,t-,l+*)_program КАЛАХ;
_label 12561, 12633;
_const list = 64000B; jinn = 0; user = 1;
c54 = 54; z236 = 2400236B; c517 = 517; c523 = 523;
z730 = 1660730B; z153 = 400153B; z635 = 660635B; c522 = 522;
z600 = 660600B; z611 = 660611B; c4 = 4; c5 = 5; c25 = 25;
etx = '{377'; c62 = 62; c1008 = 1008; space = ' '; dot = '.';
c13 = 13; c10 = 10; c11 = 11; lf = '{214'; cr = '{175'; c212 = 21;
spaces = '      '; arrow = ' =++> '; admin = '417700'; sleep = 'sle   ';
fin = '(FIN){175'; c31 = 31; oparen = '('; cparen = ')'; excl = '!'; qmark = '?';
c49 = 49; c45 = 45; c47 = 47; c36 = 36; c50 = 50; femEnding = 'A'; c61 = 61;
K = 'K'; c51 = 51; c60 = 60; z = 'z'; c9 = 9; e10p1 = 1777B; c6 = 6;
c7 = 7; c2 = 2; c12=12; c30=30; c39=39;
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
player = integer;
contents = _record val:integer _end;
unppits = _record move:word; pits:_array [1..7] _of contents _end;

_var
gl10z,
gl11z:integer;
gl12z:alfa;
gl13z,gl14z,gl15z,logidx,charidx,gl18z:integer;night,gl20z:boolean;
gl21z,gl22z,gl23z,gl24z,gl25z,gl26z,gl27z,gl28z:integer;bufptr:@zone;
gl29z:_array[1..5] _of word; gl35z: integer;
curLogWord:sixchars; 
logPacked:_array [1..30] _of alfa;
gl72z,gl73z:bitset;gl74z,gl75z,gl76z,gl77z,gl78z,gl79z,gl80z:integer;
gl81z,gl82z,ogchezk,gl84z:alfa;gl85z,gl86z:bitset;
gl87z:bitset;gl88z,gl89z:word;
gl90z:boolean;
gl91z,gl92z,gl93z:integer;
gl94z:_array [0..7] _of integer;
gl102z,gl103z,gl104z,gl105z,gl106z,gl107z,gl108z,gl109z,gl110z:integer;
gl111z,gl112z,gl113z,gl114z,gl115z,gl116z,gl117z,gl118z,gl119z,gl120z:integer;
gl121z,gl122z,gl123z,gl124z,gl125z,gl126z,gl127z,gl128z,gl129z,gl130z:integer;
gl131z,gl132z,gl133z:integer;
tempfile:text;
i,j:integer;b:bitset;ls:largeset;aa:alfa;
_procedure filler; 
_(

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

(q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

_);
_function remTime:integer;
_( code(Э0634=,); remTime := ; _);

_function ticks:integer;
_( code(Э05310=,); ticks := ; _);
_procedure unused; _( code(=14ПВ76255,) _);
_procedure writeJinn;
_( write('ДЖИН ') _);

_procedure writeUser;
_var i:integer;
_(
 _for i := 1 _to 5 _do write(gl29z[i].c);
_);

_procedure TTIN(top:boolean);
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
  rewrite(tempfile);
  v2 := 0;
  _while input@ <> chr(255) _do _(
    _if gl90z _then write(input@);
    v2 := v2 + 1;
    _if v2 > 128 _then _(
      rewrite(tempfile);
      gl18z := 0;
      write(tempfile,'SLЕ  {377');
      gl87z := gl87z + [47];
      _goto 1570
    _);
    write(tempfile,input@);
    get(input);
  _); (* while *)
  write(tempfile, chr(255));
  1570:
  reset(tempfile);
  _if gl90z _then _(
    writeLN;
    code(ВИ7=ЗЧ76013,);
  _)
_);

_function checkTime:boolean;
_var l2v1z:integer;
_(
  checkTime := false;
  code(Э0634=,);
  l2v1z := ;
  _if gl80z - l2v1z < 120 _then _(
    rewrite(output);
    rewrite(tempfile);
    writeln('ВАШЕ ВРЕМЯ ИСТЕКЛО');
    gl18z := 0;
    write(tempfile,'КОН  {377');
    checkTime := true; exit 
  _)
_);
_procedure checkNo;
_var l2v1z:alfa;
_(
  writeLN;
  code(сч77015=2зч3,);
 _if (l2v1z = 'Н{3770000') _then _GOTO 12561;
_);

_function F1631(i:integer):integer;
_( code(=14ПВ77463,) _);

_procedure P1634(l2a1z:integer);
_var l2v1z, l2v2z, l2v3z, l2v4z:integer;
_(
  l2v1z := gl94z[l2a1z];
  l2v4z := ;
  l2v1z := sel(l2v4z, 24, 6) + gl24z;
  code(СД/6/=2ЗЧ5,МР=СД/-6/,МР=2ЗЧ4,);
  ins(l2v4z, l2v1z, 24, 6);
  gl94z[l2a1z] := ;
  _if l2v2z > 0 _then _(
    gl24z := l2v2z;
    P1634(l2a1z - 1);
    gl24z := 1;
  _);
  _if gl25z = 1 _then _(
    l2v3z := 36;
  _) _else _(
    l2v3z := 22;
  _);
  _if (l2a1z <= l2v3z) _and (l2a1z > 0) _then P1634(0);
_);

_function getTime:alfa;
_var l2v1z, l2v2z:integer;
l2v:sixchars; l2v9z:alfa;
_( 
  code(Э05310=,);
  l2v1z := ;
  l2v1z := l2v1z _div 3000;
  l2v[1] := ' ';
  l2v[4] := '.';
  l2v2z := l2v1z _div 600;
  l2v[2] := ;
  (*=m-*)
  l2v1z := l2v1z - l2v2z * 600;
  l2v2z := l2v1z _div 60;
  l2v[3] := ;
  l2v1z := l2v1z - l2v2z * 60;
  l2v2z := l2v1z _div 10;
  l2v[5] := ;
  l2v[6] := chr(l2v1z - l2v2z * 10);
  pck(l2v[1], l2v9z);
  getTime := l2v9z;
_);

_procedure printTenths(a:integer);
_var v:integer;
_( 
  v := trunc(a/10); write(v:1, (a - v*10):1);
  _);

_procedure readZone(a, b: integer);
_( code(=14ПВ77451,) _); 

_procedure writeZone(a, b: integer);
_( code(=14ПВ77457,) _);

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

_function getMinel(_var a1: integer; _var a2: bitset):boolean;
_(
  _if a2 = [] _then getMinel := false _else _(
    a1 := minel(a2);
    a2 := a2 - [a1];
    getMinel := true;
  _)
_);

_procedure P2023(_var a: largeset);
_var i: integer;
_(
  _for i := 0 _to 5 _do _(
    a[i] := [];
  _)
_);

_procedure toLargeSet(a1: integer; _var a2: largeset);
_var i:integer;
_(
  i := a1 _div 48;
  a2[i] := a2[i] + [a1-i*48];
_);

_function inLargeSet(a1: integer; _var a2: largeset):boolean;
_var i:integer;
_(
  i := a1 _div 48;
  inLargeSet := (a1-i*48) _in a2[i];
_);


_function getDate: alfa;
_var k:integer;l:alfa;
_(
  k:=00003777776Т;l:='3 1   ';
  СОDЕ(Э050114=,2СБ4=2РБ5,СД120=2ЗЧ4,МР=СД70,2ЗЧ5=МР,2СМ5=СД140,17ЛС=2СМ4,СД60=17ЛС,2ЗЧ3=)
_);

_function F2112(a:alfa):integer;
_type date = _record d10, d1, m10, m1, y10, y1: integer _end;
_var p:@date; c:sixchars; 
_(
  unpck(c[1], a);
  p := ref(c);
  _with p@ _do F2112 := ((y10 * 10 + y1) * 100 + m10 * 10 + m1) * 100 + d10 * 10 + d1;
_);

_function getDays:integer;
_(
  getDays := F2112(   getDate  );
_);

_function months(d, m, y:integer):integer;
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
  code(7ПА516=,ВЫХ:ВИ7=2ЗЧ7,);

  v2 := ord((y _mod 4 = 0) _and (m > 2));
  months := (y-1) * 365 + (y-1) _div 4 + v2 + v1 + d;
_);

_function F2211(a: integer):integer;
_var y, m, d:integer;
_(
 y := a _DIV 10000;
 a := a _MOD 10000;
 m := a _DIV 100;
 d := a _MOD 100;
 F2211 :=   months( d, m, y );
_);

_function F2227(a:integer):integer;
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
 v1 := (35C);
  _) _else _(
 _if (a > (74C)) _and  v4 _then a := a - 1;

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
  F2227 := (v3 * 100 + v2) * 100 + v1;
_);

_function F2355(l2a1z, l2a2z:integer):integer;
_(
  F2355 := F2227( (F2211( l2a1z) + l2a2z) );
_);

_function zeller(l2a1z, l2a2z, l2a3z:integer):integer;
_(
 _if l2a2z < 3 _then l2a3z := l2a3z - 1;
 l2a2z := l2a2z + 9;
 _if l2a2z > 11 _then l2a2z := l2a2z - 12;
 l2a2z := l2a2z + 1;
 zeller := (((((l2a1z + l2a3z) + (l2a3z _div 4)) + (((13 * l2a2z) - 1) _DIV 5)) - 28) _MOD 7);
  _);

_procedure checkOpen;
_label 1, 2;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z:alfa;
t:sixchars;
l2v13z:bitset;
_(
  _if 32 _IN gl85z _then _( gl85z := gl85z - [32]; exit _); 
  _if gl73z * [3] = [3] _then exit;

  _if 26 _IN gl87z _then _(
1:
    writeln('КАЛАХ ЗАКРЫТ');
    _GOTO 12561;
  _);
  _if (gl73z * [2] = [2]) _then _( 
    write('ДЛЯ ВАС '); _goto 1;
  _);
  _if 30 _IN gl85z _then _(
    writeln('БОЛЬШЕ ИГРАТЬ НЕ БУДУ.');
    _goto 2
  _);
  l2v3z :=   getDays;
  l2v5z := (l2v3z _DIV 10000);
  l2v3z := (l2v3z - (l2v5z * (10000)));
  l2v4z := (l2v3z _DIV 100);
  l2v3z := (l2v3z - (l2v4z * (100)));
  _if (zeller( l2v3z, l2v4z, l2v5z) > 4) _then exit;
  readZone( (66C), (517) );
  l2v13z := bufptr@[5].s;
  l2v6z :=   getTime;
  unpck(t[1], l2v6z);
  l2v2z := ((((ord(t[2]) * 10) + ord(t[3])) * 2) + (((ord(t[5]) * 10) + ord(t[6])) _DIV 30));
  _if _not (l2v2z _IN l2v13z) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      l2v2z := (l2v2z + (1C));
      _if (l2v2z _IN l2v13z) _then _(
        write('ОТКРОЕТСЯ В ');
        l2v1z := (l2v2z _div 2);
        l2v2z := ((l2v2z - (l2v1z * 2)) * 30);
        printTenths( l2v1z );
        write(dot);
        printTenths( l2v2z );
        writeln(' - СЕЙЧАС', getTime);
2:
        rewrite(tempfile);
        write(tempfile,'ВЫХ  {377');
        gl18z := (0C);
        _GOTO 12633;
      _);
    _until (l2v2z >= 47);
    writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
    _goto 2
  _);
  night := (l2v2z < 13) _or (l2v2z > 41); (* < 6:30 or > 20:30 *)
_);

_function F2573B(a, b:integer):integer;
_var l:_array[1..7] _of word;
_( code(=14ПВ77400,) _);

_procedure packPits(_var l2a1z:unppits; _var l2a2z:word);
_var l2v2z:integer;
_( code(2ИК3=СЧ,СД/-6/=17ЗЧ,);
  _for l2v2z := 1 _to 6 _do 
    code(2СЧ5=УИ7,2ИК3=7СЧ,17ЛС=СД/-6/,17ЗЧ=);
  
  code(17СЧ=СД/-3/,2ИК3=ЛС7,);
  l2a2z :=;
_);

_procedure unpackPits(_var l2a1z:unppits; l2a2z:word);
_var l2v1z:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  l2a1z.move := ;
  _for l2v1z := (1C) _to 6 _do _(
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=)
  _);
  code(2СЧ4=СД/-11/,МР=2ИК3,ЗЧ7=);
_);

_procedure getName(_var l2a1z:alfa; _var l2a2z:alfa);
_var l2v1z:sixchars; l2v7z: boolean; l2v8z:integer;
l2v9z:char; l2v10z, l2v11z:alfa;
_(
  l2v10z := l2a1z;
  code(7ПАРАЗ=,7Э020=СД/40/,7ЗЧ1=7СА1,ВИ7=Э050104,7СЧ=7ПБ2,C;РАЗ:360741703600000,0,0,К;);
  l2v11z := ;
  unpck(l2v1z[1], l2v11z);
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
  l2a1z := l2v11z;
  code(7CЧ1=);
  l2a2z := ;
_);

_procedure TTOUT;
_(
  _if gl90z _then checkNo _else _(
    write('{172     ');
    code(CЧ75205=УИ7,СЧ76401=ЛСисэ71,17ЗЧ1=17Э0711,Э07176402=,);
    rewrite(output); exit;
    code(С;ИСЭ71:3000000024000321,К;)
  _);
_);  

_procedure P2747;
_var l2v1z, l2v2z, l2v3z: integer;
_(
  code(СЧ75224=АВ75205,);
  l2v3z := ;
  l2v1z := ((gl15z - l2v3z) + (1C));
  _for l2v2z := (1C) _to l2v1z _do _(
    write(spaces);
  _);
 gl15z := l2v3z;
 TTOUT;
_);
_procedure drawField(_var pckpits:_array [0..1] _of word);
_var l2v1z, l2v2z:integer;l2v3z:unppits;
_procedure drawPit(pit:integer);
_(
  write(oparen:2);
  l2v2z := l2v3z.pits[pit].val;
  _if (l2v2z = (0C)) _then
    write(space:2)
  _else
    write(l2v2z:2);
  write(cparen);
_);  
_( (* drawField *)
  write('ДЖИН':13);
  write(space:7);
  unpackPits(l2v3z, pckpits[0]);
  _for l2v1z := (6C) _downto (1C) _do 
    write(l2v1z:5);
  TTOUT;
  write(space:21);
  _for l2v1z := (6C) _downto (1C) _do
   drawPits( l2v1z );
  TTOUT;
  write(К:15);
  drawPits( (7C) );
  unpackPits(l2v3z, pckpits[1]);
  write(space:32);
  drawPits( (7C) );
  write(К:2);
  TTOUT;
  write(space:21);
  _for l2v1z := (1C) _to (6C) _do
    drawPits( l2v1z );
  TTOUT;
  write(space:20);
  _for l2v1z := (1C) _to (6C) _do
   write(l2v1z:5);
  write(space:9);
  writeUser;
  TTOUT;
_);

_procedure title;
_(
  write('К    А    Л    А    Х':46);
  TTOUT;
  write('^^^^^^^^^^^^^^^^^^^^^^^':48);
  TTOUT;
_);

_procedure checkAdmin;
_(
  _if _not gl20z _then _(
    writeln('ВАМ НЕЛЬЗЯ');
    _GOTO 12561;
  _)
_);

_procedure logWord(arg:alfa);
_(
  _if logidx > 30 _then exit;
 logPacked[logidx] := arg;
 logidx := logidx + 1;
_);
_procedure logChar(arg:char);
_var w:alfa;
_(
  curLogWord[charidx] := arg;
  charidx := charidx + 1;
  _if charidx = 7 _then _(
    charidx := 1;
    pck(curLogWord[1], w);
    logWord(w);
  _)
_);

_procedure initLog;
_var l2v1z:alfa; l2v2z:sixchars;
_(
  logPacked[1] := 'САLАН+';
  logPacked[2] := getDate;
  logPacked[3] := getTime;
  l2v1z := ogchezk;
  code(СД/10/=);
  l2v1z := ;
  unpck(l2v2z[1], l2v1z);
  l2v2z[1] := space;
  l2v2z[6] := '{175';
  pck(l2v2z[1], logPacked[4]);
  logidx := 5;
_);

_procedure saveLog;
_label 3247;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z: alfa;
_procedure P3203(l3a1z:alfa);
_label 1;
_(
  _if l2v2z > 1023 _then _goto 1;
  bufptr@[l2v2z].a := l3a1z;
  l2v5z := ;
  l2v2z := l2v2z + 1;
  _if (l2v5z = fin) _then _(
1:  code(2СЧ3=СД/-14/,2ЛС4=);
    bufptr@[0].i := ;
    _GOTO 3247;
  _)
_);
_( (* saveLog *)
  _if logidx > 30 _then exit;
  logWord( fin );
  readZone( (66C), (522) );
  l2v5z := bufptr@[0].a;
  code(СД/14/=2ЗЧ3,МР=СД/44/,);
  l2v2z := ;
  _if (l2v2z <= 896) _or (660600B <> 0) _then _(
    l2v3z := 1;
    (loop) _(
      P3203( logPacked[l2v3z] );
      l2v3z := l2v3z + 1;
      _goto loop
    _);
3247:
    _if (l2v2z > 928) _and (660600B > 0) _then _(
      l2v4z := bufptr@[1].i;
      _if (l2v4z > 0) _and (l2v4z <= 660611B) _and (l2v4z >= 660600B) _then _(
        writeZone(0, l2v4z );
        bufptr@[1].i := l2v4z + 1;
        bufptr@[0].i := (sel(bufptr@[0].i, 12, 12) + 1) * 4096 + 2;
      _)
    _);
    writeZone( (66C), (522) );
  _)
_);
_procedure playKalah;
_const caa = 7346545000B; cab = 575360400B;
cac = 37777202417400C; cad = 303240B;
cae = 37777777474540C; caf = 3641100B;
cba = 8415; cbb = 72; cbc = 114; right = '{171'; left = '{146';
up = '{176'; down = '{177'; delay = '{142';
_type
unpboth = _array [jinn..user] _of unppits;
pckboth = _array [jinn..user] _of word;
gender = (unksex, masc, fem);
_var locvars:_array[1..7] _of word;
l2v8z:alfa;
l2v9z, l2v10z, l2v11z, l2v12z, l2v13z, l2v14z:integer;
l2v15z, l2v16z, l2v17z: boolean; l2v18z: boolean;
l2v19z, efendi:boolean; l2v21z, l2v22z:word;
wrongGender, l2v24z, l2v25z, l2v26z:boolean;  l2v27z, l2v28z: integer;
l2v29z:boolean; l2v30z, level : integer; l2v32z,
userScore, jinnScore, NgameToday, l2v36z, l2v37z, l2v38z: integer;
l2v39z, l2v40z, l2v41z, l2v42z, l2v43z, l2v44z, l2v45z, l2v46z, l2v47z, l2v48z: integer;
l2v49z, l2v50z, l2v51z, l2v52z, l2v53z, l2v54z, l2v55z, l2v56z, l2v57z, l2v58z,
l2v59z, l2v60z, l2v61z, l2v62z, l2v63z, l2v64z : integer;
l2v65z:integer;
l2v66z, l2v67z, l2v68z, oldHandler, l2v70z, l2v71z, l2v72z, l2v73z,
l2v74z, jinnTicks, userTicks, l2v77z, l2v78z, l2v79z, l2v80z: integer;
age, spentThinking: integer;
unpState:unpboth;
l2v99z, l2v100z, l2v101z, l2v102z, l2v103z, l2v104z, l2v105z, l2v106z, l2v107z, l2v108z, l2v109z, l2v110z, l2v111z, l2v112z, l2v113z, l2v114z:integer; currentState:_array [0..1] _of word;
knownGender:gender;
l2v118z, l2v119z, l2v120z, l2v121z, l2v122z, l2v123z, l2v124z, l2v125z, l2v126z, l2v127z, l2v128z, l2v129z, l2v130z: integer;
oneOverLN2:real; (* 131 *)
l2v132z, l2v133z, l2v134z, l2v135z, l2v136z, l2v137z, l2v138z, l2v139z, l2v140z, l2v141z, l2v142z, l2v143z, l2v144z, l2v145z, l2v146z, l2v147z, l2v148z, l2v149z, l2v150z, l2v151z, l2v152z, l2v153z, l2v154z, l2v155z, l2v156z, l2v157z, l2v158z, l2v159z, l2v160z, l2v161z, l2v162z, l2v163z, l2v164z, l2v165z, l2v166z, l2v167z, l2v168z, l2v169z, l2v170z, l2v171z, l2v172z, l2v173z, l2v174z, l2v175z, l2v176z, l2v177z, l2v178z, l2v179z, l2v180z, l2v181z, l2v182z, l2v183z, l2v184z, l2v185z: integer;
l2v186z:_array[1..100] _of bitset;
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
  randint := trunc(random * arg);
_);

_function checkEnding(arg:alfa):boolean;
_(
  code(тут2:7патут2=пбдавай,
c;7760000000000000,7777740000000000,7777777700000000,
7777777777600000,7777777777777400,377,15,17,
к;давай:3сч4=7лу6,уи6=1сч12,3ср4=6иа,7лу=3зч4,);
  checkEnding := arg = '{000{000{000{000{000{000';
_);

_function eqstr(l3a1z:alfa):boolean;
_var l3v1z: alfa; l3v2z,l3v8z:sixchars;
_(
  eqstr := false;
  _if (l3a1z = l2v8z) _then _( eqstr := true; exit _);
  unpck(l3v2z[1], l3a1z);
  l3v1z := '      ';
  unpck (l3v8z[1], l3v1z);
  l3v8z[1] := l3v2z[1];
  pck(l3v8z[1], l3v1z);
  _if (l3v1z = l2v8z) _then eqstr := true;
_);

_function F3404(l3a1z, l3a2z: alfa):alfa;
_var l3v1z, l3v2z, l3v3z: alfa;
_(
  l3v1z := '7DDDDD';
  l3v2z := 'D{3770000';
  l3v3z := '{375{3760000';
  code(3сч4=3сб6,3см5=3сб7,3рб10=сд/-17/,мр=17лс,);
  F3404 := ;
_);
_procedure putNchars(l3a1z:char; l3a2z:integer);
_var l3v1z:integer;
_(
  _for l3v1z := 1 _to l3a2z _do write(l3a1z);
_);

_procedure packBoth(_var from:unpboth; _var to:pckboth);
_(
  packPits(from[jinn], to[jinn]);
  packPits(from[user], to[user]);
_);

_procedure unpckBoth(_var to:unpboth; _var from:pckboth);
_(
  unpackPits(to[jinn], from[jinn]);
  unpackPits(to[user], from[user]);
_);

_function F3475(_var l3a1z:unpboth; l3a2z:integer):integer;
_label 3520;
_type fake = _array [0..15] _of contents;
_var l3v1z:player;
l3v2z,l3v3z:integer;
l3v4z:integer;
l3v5z:player;
l3v6z:integer;
l3v7z:integer;
l3v8z:player;
l3v9z:integer;
l3v10z:@fake;
l3v11z,l3v12z,l3v13z:@integer;
_(
  l3v1z := l3a1z[user].move.i;
  l3v5z := ;
  l3v10z := ref(l3a1z);
  l3v6z := l3v10z@[l3v1z*8+l3a2z].val;
  _if (l3v6z = 0) _then _( F3475 := 0; exit _);
  l3v10z@[l3v1z*8+l3a2z].val := 0;
3520:
  code(3сч6=ср13,3зч15=); (* l3v8z := _not l3v1z *)
  _if (l3v1z = l3v5z) _then
    l3v4z := 7
  _else
    l3v4z := 6;

  _for l3v3z := 1 _to l3v6z _do _(
    l3v2z := (l3a2z + l3v3z);
    _if (l3v2z <= l3v4z) _then _(
      l3v13z := ref(l3v10z@[l3v1z*8+l3v2z]);
      l3v13z@ := l3v13z@ + 1;
      l3v7z := ;
      _if (l3v3z = l3v6z) _then _(
        _if l3v2z = 7 _then _(
          F3475 := 2;
        _) _else _(
          F3475 := 1;
          l3a1z[jinn].move.i := l3v5z;
          code(ср13=);
          l3a1z[user].move := ;
          _if (l3v7z = (1C)) _and (l3v1z = l3v5z) _then _(
            l3v11z := ref(l3v10z@[l3v8z*8+7-l3v2z]);
            l3v9z := l3v11z@;
            _if (l3v9z > (0C)) _then _(
              l3v12z := ref(l3v10z@[l3v5z*8+7]);
              l3v12z@ := l3v12z@ + l3v9z + 1;
              l3v13z@ := 0;
              l3v11z@ := ;
            _);
            exit
          _)
        _)
      _);
    _) _else _(
      l3v6z := ((l3v6z - l3v3z) + (1C));
      code(3cч6=ср13,3зч6=); (* l3v1z := _not l3v1z *)
      l3a2z := (0C);
      _goto 3520;
    _)
  _)
_);

_functin performMove(_var l3a1z:unpboth; l3a2z:integer):integer;
_label 4171;
_var l3v1z:integer;
l3v2z:integer; l3v3z:player; l3v4z, l3v5z, l3v6z, l3v7z, l3v8z, l3v9z, l3v10z: integer;
l3v11z, l3v12z:integer; l3v13z:char;
_procedure drawMove(l4a1z: player; l4a2z: integer);
_var l4v1z, l4v2z, l4v3z,l4v4z,l4v5z,l4v6z,l4v7z:integer;
l4v8z:char;
_(
  _if l4a2z = 7 _then _(
    l4v5z := (0C);
    _if l4a1z = user _then
      l4v4z := 18 + 36
    _else
      l4v4z := 18 - 1;
  _) _else _(
    _if (l4a1z = user) _then _(
      l4v6z := l4a2z;
      l4v5z := -1;
    _) _else _(
      l4v6z := 7 - l4a2z;
      l4v5z := 1;
    _);
    l4v4z := (l4v6z * 5) + 18;
  _);
  _if (l4v4z > l3v11z) _then _(
    l4v8z := right;
    l4v3z := (l4v4z - l3v11z);
  _) _else _(
    _if (l4v4z < l3v11z) _then _(
      l4v8z := left;
      l4v3z := (l3v11z - l4v4z);
    _) _else _(
      l4v3z := (0C); (q) _exit q
    _);
  _);
  _for l4v2z := 1 _to l4v3z _do _(
    _for l4v1z := 1 _to gl28z _do _(
      write(delay);
    _);
    write(l4v8z);
  _);
  _if (l4v5z > l3v12z) _then _(
    l4v8z := up;
    l4v3z := (l4v5z - l3v12z);
  _) _else _(
    _if (l3v12z > l4v5z) _then _(
      l4v8z := down;
      l4v3z := (l3v12z - l4v5z);
    _) _else _(
      l4v3z := 0; (q) _exit q
    _)
  _);
  _for l4v2z := 1 _to l4v3z _do _(
    _for l4v1z := 1 _to gl28z _do _(
      write(delay);
    _);
    write(l4v8z);
  _);
  l4v7z := l3a1z[l4a1z].pits[l4a2z].val;
  _if l4v7z = 0 _then
    write(space:2)
  _else
    write(l4v7z:2);
  putNchars(delay, gl28z );
  l3v11z := l4v4z + 2;
  l3v12z := l4v5z;
_);
_( (* performMove *)
  l3v12z := 0;
  l3v1z := l3a1z[user].move.i;
  l3v5z := ;
  _if (l3a2z = 0) _then _(
    l3v8z := 0;
    l3v6z := ;
    l3v11z := 0;
    _for l3v3z := 1 _to 6 _do _(
      l3v8z := l3a1z[jinn].pits[l3v3z].val + l3v8z;
      l3v6z := l3a1z[user].pits[l3v3z].val + l3v6z;
    _);
    _if l3v8z = 0 _then l3v3z := 1 _else l3v3z := 0; (* !!! l3v3z := ord(l3v8z = 0) *)
    l3v6z := (l3v6z + l3v8z);
    putNchars(up, l3v1z);
    _for l3v4z := 1 _to 6 _do _(
      _if l3a1z[l3v3z].pits[l3v4z].val > 0 _then _(
        l3a1z[l3v3z].pits[l3v4z].val := 0;
        drawMove(l3v3z, l3v4z);
      _)
    _);
    l3a1z[l3v3z].pits[7].val := l3a1z[l3v3z].pits[7].val + l3v6z;
    drawMove(l3v3z, 7);
  _) _else _( (* 4035 *)
    l3v11z := 7;
    l3v6z := l3a1z[l3v1z].pits[l3a2z].val;
    l3a1z[l3v1z].pits[l3a2z].val := 0;
    putNchars(up, l3v1z);
    write(l2v65z:4);
    write(space:3);
    drawMove(l3v1z, l3a2z);
    (loop) _(
     l3v8z := 1-l3v1z; (* !!! l3v8z := _not l3v1z *)
    _if (l3v1z = l3v5z) _then _(
      l3v4z := 7;
    _) _else _(
      l3v4z := 6;
    _);
% L4066:
    _for l3v3z := 1 _to l3v6z _do _(
      l3v2z := (l3a2z + l3v3z);
      _if (l3v2z <= l3v4z) _then _(
        l3a1z[l3v1z].pits[l3v2z].val := l3a1z[l3v1z].pits[l3v2z].val + 1;
        l3v7z := ;
        drawMove( l3v1z, l3v2z );
        _if (l3v3z = l3v6z) _then _(
          _if l3v2z = 7 _then _(
            performMove := 2;
          _) _else _(
            performMove := 1;
            l3a1z[jinn].move.i := l3v5z;
            code(ср13=);
            l3a1z[user].move := ;
            _if (l3v7z = (1C)) _and (l3v1z = l3v5z) _then _(
              l3v10z := ((7C) - l3v2z);
              l3v9z := l3a1z[l3v8z].pits[l3v10z].val;
              _if (l3v9z > (0C)) _then _(
                l3a1z[l3v8z].pits[l3v10z].val := 0;
                drawMove( l3v8z, l3v10z );
                l3a1z[l3v1z].pits[l3v2z].val := 0;
                drawMove( l3v1z, l3v2z );
                l3a1z[l3v5z].pits[7].val := l3a1z[l3v5z].pits[7].val + l3v9z + 1;
                drawMove( l3v5z, (7C) );
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
        l3v1z := 1-l3v1z; (* !!! l3v1z := _not l3v1z *)
        l3a2z := (0C);
        _goto loop;
      _); 
% L4167:
    _)
  _)
  _); (* 4171 *)
4171:
  putNchars(left, l3v11z);
  _if l3v12z > 0 _then _(
    l3v13z := down;
  _) _else _if l3v12z < 0 _then _(
    l3v12z := -l3v12z;
    l3v13z := up;
  _);
  putNchars( l3v13z, l3v12z );
  TTOUT;
_);
_function F4210(_var l3a1z:unpboth): boolean;
_var l3v1z, l3v2z: integer; l3v3z: _array[0..1] _of integer;
_(
  _for l3v1z := 0 _to 1 _do _(
    l3v3z[l3v1z] := 0;
    _for l3v2z := 1 _to 6 _do _(
      l3v3z[l3v1z] := l3a1z[l3v1z].pits[l3v2z].val + l3v3z[l3v1z];
    _);
    _if (l3v3z[l3v1z] = (0C)) _then _( F4210 := true; exit _);
  _);
  F4210 := false;
_);
_procedure U4241; (* unused *)
_var l3v1z, l3v2z: integer;
_(
  _for l3v1z := 0 _to 1 _do 
  _for l3v2z := 1 _to 6 _do _(
    unpState[l3v1z].pits[7].val := unpState[l3v1z].pits[7].val + unpState[l3v1z].pits[l3v2z].val;
    unpState[l3v1z].pits[l3v2z].val := 0;
  _)
_);

_function U4273(_var l3a1z:unpboth; l3a2z:player):bitset; (* unused *)
_var l3v1z, l3v2z, l3v3z:integer; l3v4z:bitset;
_(
  l3v4z := [];
  _for l3v3z := 1 _to 6 _do _(
    l3v2z := l3a1z[l3a2z].pits[l3v3z].val;
    _if (l3v2z > 0) _then _(
      l3v1z := (l3v2z + l3v3z);
      _if (l3v1z = 7) _or (l3v1z = 20) _then
        l3v4z := [l3v3z] + l3v4z;
    _)
  _);
  U4273 := l3v4z;
_);

_function F5206(l3a1z, l3a2z, l3a3z:integer):integer;
_var l3v1z, l3v2z, l3v3z, l3v4z, l3v5z: integer;
l3v6z, l3v7z, l3v8z, l3v9z, l3v10z,
l3v11z, l3v12z, l3v13z, l3v14z, l3v15z, l3v16z, l3v17z, l3v18z, l3v19z, l3v20z,
l3v21z, l3v22z, l3v23z, l3v24z, l3v25z, l3v26z, l3v27z, l3v28z, l3v29z, l3v30z,
l3v31z, l3v32z, l3v33z, l3v34z, l3v35z, l3v36z, l3v37z, l3v38z, l3v39z, l3v40z,
l3v41z, l3v42z, l3v43z, l3v44z, l3v45z, l3v46z, l3v47z, l3v48z, l3v49z, l3v50z,
l3v51z, l3v52z, l3v53z, l3v54z, l3v55z, l3v56z, l3v57z, l3v58z, l3v59z, l3v60z,
l3v61z, l3v62z, l3v63z, l3v64z, l3v65z, l3v66z, l3v67z, l3v68z, l3v69z, l3v70z,
l3v71z, l3v72z, l3v73z, l3v74z, l3v75z, l3v76z, l3v77z: integer;
_function diff(_var l4a1z:unpboth):integer;
_var l4v1z, l4v2z, l4v3z, l4v4z:integer;
_(
  l4v3z := l4a1z[user].move.i;
  code(CP13=);
  l4v4z := ;
  l4v1z := 0;
  _for l4v2z := 1 _to 7 _do _(
    l4v1z := l4a1z[l4v3z].pits[l4v2z].val + l4v1z - l4a1z[l4v4z].pits[l4v2z].val;
  _);
  _if l4v1z > 0 _then diff := 100000 
  _else _if l4v1z < 0 _then diff := 37777777474540C (* !!! -100000 remains an expression *)
  _else _( diff := 0; (q) _exit q _)
_);

_function estimate(_var l4a1z: unpboth):integer;
_var (* 22 locals *)
l4v1z, l4v2z: integer;
l4v3z, l4v4z: integer;
l4v5z, l4v6z, l4v7z, l4v8z, l4v9z, l4v10z,
l4v11z, l4v12z, l4v13z, l4v14z, l4v15z, l4v16z, l4v17z, l4v18z,
l4v19z, l4v20z: integer;
l4v21z, l4v22z: @unppits;

_(
  l4v3z := l4a1z[user].move.i;
  code(CP13=); l4v4z := ;
  l2v73z := (l2v73z + (1C));
  _if (l4v3z = (0C)) _then _(
    l4v21z := ref(l4a1z[jinn]);
    l4v22z := ptr(ord(l4v21z) + 8);
  _) _else _(
   l4v22z := ref(l4a1z[jinn]);
   l4v21z := ptr(ord(l4v22z) + 8);
  _);
  l4v19z := l4v21z@.pits[7].val;
  l4v20z := l4v22z@.pits[7].val;
  _if _not l2v17z _then _(
    _if (l4v19z > (44C)) _then _(
      estimate := (303240C);
      exit
    _);
    _if (l4v20z > (44C)) _then _(
      estimate := (37777777474540C);
      exit
    _);
  _);
  l4v11z := (0C);
  l4v12z := ;
  l4v13z := ;
  l4v14z := ;
  l4v15z := ;
  l4v16z := ;
  l4v17z := ;
  l4v18z := ;
  l4v9z := (l4v19z * l3v71z);
  l4v10z := (l4v20z * l3v71z);
  code(=7ПA7,);
  _for l4v1z := (1C) _to (6C) _do _(
    code(=7СА-1,ВИ7=);
    l4v2z := ;
    l4v7z := l4v21z@.pits[l4v1z].val;
    _if (l4v7z > (0C)) _then _(
      l4v11z := (l4v11z + l4v7z);
      l4v5z := (l4v7z + l4v1z);
      l4v6z := (l4v5z - (15C));
      _if (l4v5z < (7C)) _then _(
        l4v17z := ((l4v17z + l4v7z) + (7C));
      _) _else _(
        _while (l4v5z >= (24C)) _do 
          l4v5z := (l4v5z - (15C));
        l4v17z := ((abs(((15C) - l4v5z)) + l4v17z) + l4v2z);
      _);
      _if (l4v5z = (7C)) _then _(
         l4v9z := (l4v9z + l3v72z);
      _) _else _(
        _if (l4v7z = (15C)) _then 
          l4v13z := ((l4v22z@.pits[l4v2z].val + (3C)) + l4v13z);
        _if (l4v5z > (7C)) _then _(
          l4v9z := (l4v9z + l3v74z);
          _if (l4v6z > (7C)) _then
            l4v9z := (l4v9z + l3v74z);
        _);
      _);
    _) _else _(
      l4v15z := (l4v22z@.pits[l4v2z].val + l4v15z);
    _);
    l4v8z := l4v22z@.pits[l4v1z].val;
    _if (l4v8z > (0C)) _then _(
      l4v12z := (l4v12z + l4v8z);
      l4v5z := (l4v8z + l4v1z);
      l4v6z := (l4v5z - (15C));
      _if (l4v5z < (7C)) _then _(
        l4v18z := ((l4v18z + l4v8z) + (7C));
      _) _else _(
        _while (l4v5z >= (24C)) _do
          l4v5z := (l4v5z - (15C));
        l4v18z := ((abs(((15C) - l4v5z)) + l4v18z) + l4v2z);
      _);
      _if (l4v5z = (7C)) _then _(
        l4v10z := (l4v10z + l3v72z);
      _) _else _(
        _if (l4v8z = (15C)) _then _(
          l4v14z := l4v21z@.pits[l4v2z].val + 3 + l4v14z;
        _);
        _if (l4v5z > (7C)) _then _(
          l4v10z := (l4v10z + l3v74z);
          _if (l4v6z > (7C)) _then
            l4v10z := (l4v10z + l3v74z);
        _);
      _);
    _) _else _(
      l4v16z := (l4v21z@.pits[l4v2z].val + l4v16z);
    _);
  _);
  _if (l4v11z = (0C)) _or (l4v12z = (0C)) _then _(
    estimate :=   diff( l4a1z );
    exit
  _); 
  l4v9z := (((((l4v15z * l3v73z) + (l4v13z * l3v75z)) + (l4v11z * l3v76z)) + (l4v17z * l3v77z)) + l4v9z);
  l4v10z := (((((l4v16z * l3v73z) + (l4v14z * l3v75z)) + (l4v12z * l3v76z)) + (l4v18z * l3v77z)) + l4v10z);
  estimate := (l4v9z - l4v10z);
_);
_function F4612(_var l4a1z:unpboth; l4a2z, l4a3z: integer; _var l4a4z, l4a5z: integer):integer;
_label 5050, 5054, 5070, 999;
_var
l4v1z, l4v2z, l4v3z, l4v4z, l4v5z, l4v6z, l4v7z, l4v8z, l4v9z, l4v10z,
l4v11z, l4v12z, l4v13z, l4v14z, l4v15z, l4v16z, l4v17z, l4v18z, l4v19z, l4v20i:integer;
l4v20z:_array [1..7] _of integer;
l4v28z, l4v44z:unpboth; 
_(
  _if (l4a2z = (0C)) _then _(
    l4v10z :=   estimate( l4a1z );
    _goto 5070; (* a potential hack, could something + goto 5054 *)
    _goto 5054;
  _);
  l4v28z := l4a1z;
  l4v10z := (37777202417400C);
  l4v11z := l4a4z;
  l4v12z := l4a5z;
  l4v7z := (0C);
  l4v8z := ;
  l4v14z := ;
  l4v15z := l2v73z;
  l4v16z := l4a3z;
  l4v4z := (1C);
  l4v17z := ;
  l4v5z := (6C);
  l4v2z := l4v28z[user].move.i;
  l4v1z := l4v28z[jinn].move.i;
  _for l4v3z := (6C) _downto (1C) _do _(
    l4v6z := l4v28z[l4v2z].pits[l4v3z].val;
    _if (l4v6z > (0C)) _then l4v17z := (l4v17z + (1C));
    l4v6z := (l4v6z + l4v3z);
    l4v8z := l4v28z[l4v1z].pits[l4v3z].val + l4v8z;
    _if (l4v6z = (7C)) _or (l4v6z = (24C)) _then _(
      l4v20z[l4v4z] := l4v3z;
      l4v4z := (l4v4z + (1C));
    _) _else _if (l4v6z <> l4v3z) _then _(
      l4v20z[l4v5z] := l4v3z;
      l4v5z := (l4v5z - (1C));
    _);
  _);

  _if (l4v8z = (0C)) _then _(
    l4v10z := diff(l4v28z);
    l2v39z := (0C);
    _goto 5070;
  _); 

  _if (l4v4z > (1C)) _and (l4a2z > (1C)) _then
    l4a2z := (l4a2z - (1C));
  _for l4v3z := l4v4z _to l4v5z _do
    l4v20z[l4v3z] := (0C);
% L4727
  _for l4v3z := (1C) _to (6C) _do _(
    _if ((l2v73z - l4v15z) > l4a3z) _and (l4v7z <> (0C)) _then _(
      l2v44z := (l2v44z + (1C));
      _goto 5050
    _); (* 4737 *)
    (*=m+ may be unnecessary, but helps matching code for mul/mod/div by powers of 2 *)
    l4v4z := l4v20z[l4v3z];
    _if (l4v4z = (0C)) _then _goto 999;
    _if (l4a2z > (1C)) _then _(
      l4v16z := trunc(((l4a3z - l2v73z) + l4v15z) * 2 / l4v17z);
      l4v17z := (l4v17z - (1C));
    _) _else _(
      l4v16z := l4a3z;
    _);
    l4v44z := l4v28z;
    l4v19z :=   F3475(l4v44z, l4v4z );
    _if (l4v19z = (1C)) _then _(
      l4v9z := - F4612(l4v44z, l4a2z-1, l4v16z, l4v12z, l4v11z);
    _) _else _if (l4v19z = (2C)) _then _(
      l4v13z := l4v12z;
      l4v9z :=   F4612(l4v44z, l4a2z, l4a3z, l4v11z, l4v13z);
    _) _else _if (l4v19z = (0C)) _then _(
        _goto 999; (* a potential hack: could be something + fall through to 5025 *)
        (q) _exit q;
    _); (* 5025 *)
    _if (l4v9z > l4v10z) _then _(
      l4v10z := l4v9z;
      l4v14z := l4v4z;
    _); (* 5031 *)
    l4v7z := (l4v7z + (1C));
    _if (l4v10z >= l4a5z) _and (l4v10z <> (7346545000C)) _then _(
      l4v10z := l4a5z;
      _goto 5054
    _);
999:;
  _); (* 5042 *)
  _if (l4v7z = (0C)) _then _(
    l4v10z := diff(l4v28z);
  _); 
5050:
  _if (l4v10z < l4a5z) _then l4a5z := l4v10z;
5054:
  l2v39z := l4v14z;
  _if (l4v14z = (0C)) _and _not F4210(l4v28z) _then _(
    writeln('"ЧП" ДЕРЦЕН');
    _GOTO 12561;
  _);
5070: 
 F4612 := l4v10z;
_);

_procedure assertOpenings(l4a1z: bitset);
_(
  _if l4a1z=[] _then _(
    writeln('"ЧП" ДЕБЮТОВ !!':36);
    _GOTO 12561;
  _);
_);

_function F5104(_var l4a1z: unpboth; l4a2z:integer):integer;
_var
l4v1z:unpboth; l4v17z, l4v18z, l4v19z:integer;
l4v20z:word;
_(
  _if l4a2z > 8415 _then l4v19z := 1 _else _(
    _if l4a2z > 1547 _then l4v17z := l4a2z - 224
    _else l4v17z := l4a2z;
    l4v18z := (7 - l4v17z _MOD 8) * 6;
    l4v20z.i := sel(bufptr@[l4v17z _div 8], l4v18z, 6);
    assertOpenings( l4v20z.s );
    l4v19z := 0;
    l4a2z := l4a2z * 6;

    _while l4v20z.s <> [] _do _(
      l4v18z := minel(l4v20z.s);
      l4v20z.s := l4v20z.s - [l4v18z];
      l4v18z := (l4v18z - (51C));
      l4v1z := l4a1z;
      l3v42z := F3475(l4v1z, l4v18z );
      _if (l3v42z = (1C)) _then _(
        l4v19z := (l4v19z + (1C));
      _) _else _(
        l4v19z := F5104(l4v1z, l4a2z + l4v18z) + l4v19z;
        (q) _exit q
      _); 
    _)
  _); (* 5204 *)
  F5104 := l4v19z;
_);
(*=m- ... and back to non-negative multiplicative ops *)
_( (* F5206 *)
  age := 1547;
  age := 224;
  writeln('ПУСТАЯ ЛУНКА В ДЕБЮТАХ - "ЧП" !');
  writeln('ИСТОРИЯ ', l2v70z:1);
  age := 4212T;
  assertOpenings([]);
  writeln('ОШ ДРЕВД');
  _GOTO 12561;
  F5206 := l3v6z;
  jinnTicks := ((  remTime  - l3v9z) + jinnTicks);
_);

_function correction(l3a1z:integer):integer;
_var l3v1z, l3v2z, l3v3z, l3v4z:integer;
_(
  write('!CORR!');
  writeln('"ЧП" - ИСПОРЧЕНЫ КОРРЕКЦИИ');
  age := 32767;
  age := 777777777777777C;
  
_);

_procedure phrase;
_label 6553, 7650, 7660; 
_var pckName:_array [0..1] _of alfa;l3v3z, l3v4z, l3v5z, l3v6z, jstones, ustones, l3v9z, l3v10z: integer;
l3v11z:boolean; l3v12z, l3v13z:integer; l3v14z:char; l3v15z: _array[0..5] _of integer;
l3v21z, l3v22z, l3v23z: integer;
l3v24z:_array [1..7] _of integer;
unpName:_array [1..12] _of char;
l3v43z:_array [1..6] _of char;
_function chkRandom(l4a1z:integer):integer;
_var l4v1z:integer;
_(
  _if (l3v9z > (0C)) _then _(
   l4v1z := trunc(l4a1z * random) + 1;
   _if (l4v1z _IN l2v186z[l3v9z]) _then _GOTO 6553;
   chkRandom := l4v1z;
   l2v186z[l3v9z] := [l4v1z] + l2v186z[l3v9z];
  _) _else _(
   l3v9z := trunc(l4a1z * random) + 1;
   chkRandom := ;
  _)
_);

_procedure Dear;
_(
  _if knownGender = MASC _then write(', ДОРОГОЙ')
  _else _if knownGender = FEM _then write(', ДОРОГАЯ');
_);

_procedure maybeFeminine;
_(
  _if knownGender = FEM _then write(femEnding);
  write(excl:2);
_);
_function countEnding(l4a1z:integer):integer;
_(
 _if (l4a1z >= 20) _then _(
   l4a1z := l4a1z _MOD 10;
  _if (l4a1z <> (1C)) _then 
  _if (l4a1z > (1C)) _and (l4a1z < (5C)) _then
    l4a1z := 2
  _else
    l4a1z := (3C);
 countEnding := l4a1z;
  _);
_);
_( (* phrase *)
  pckName[0] := ogchezk;
  getName(pckName[0], pckName[1]);
  _if NgameToday = 0 _then
    write(' ПРИВЕТСТВУЮ ТЕБЯ, ')
  _else _if NgameToday = 1 _then
    write(' САЛАМ АЛЕЙКУМ, ')
  _else
    write(' САЛАМ, ');
  unpck(unpName[1], pckName[0]);
  unpck(unpName[7], pckName[1]);
  wrongGender := false;
  _if (knownGender = MASC) _or (knownGender = FEM) _then _(
    _if (age > (0C)) _then 
    _if (age < 20) _then write('ЮН')
    _else _if (age < 50) _then write('УВАЖАЕМ')
    _else write('ПОЧТЕНН');
    _if (knownGender = MASC) _then write('ЫЙ ')
    _else write('АЯ ');
  _);
  (loop) _for l3v4z := 1 _to 12 _do _(
    l3v14z := unpName[l3v4z];
    _if l3v14z = space _then _exit loop;
    write(l3v14z);
  _);

  pckName[0] := '      ';
  unpck(l3v43z[1], pckName[0]);
  _for l3v5z := (1C) _to (3C) _do _(
  _if ((l3v4z - l3v5z) > (0C)) _then
    l3v43z[l3v5z] := unpName[(l3v4z - l3v5z)];
  _);
  _if (knownGender = MASC) _then _(
    wrongGender := checkEnding( 'ОВА  4') _or
      checkEnding( 'ЕВА  4') _or
      checkEnding( 'ИНА  4') _or
      checkEnding( 'АЯ   3');
  _) _else _if knownGender = FEM _then _(
    wrongGender := checkEnding( 'ОВ   3') _or
      checkEnding( 'ЕВ   3') _or
      checkEnding( 'ИН   3') _or
      checkEnding( 'ИЙ   3'); 
  _);
  _if (knownGender = MASC) _then write('-ХАН')
  _else _if (knownGender = FEM) _then write('-ХАНУМ');
  efendi := Level = 4;
  _if efendi _then _(
    _if (knownGender = MASC) _then write(', ЭФЕНДИ');
    write('  !!');
  _);
% L6367  
  _if l2v17z _then _(
    l3v4z :=   randint(8);
    _if l3v4z = 0 _then write('ПРОДОЛЖАТЬ НЕТ СМЫСЛА.')
    _else _if l3v4z = 1 _then write('ДАВАЙ КОНЧИМ.')
    _else _if l3v4z = 2 _then write('ТЕПЕРЬ УЖЕ НИЧЕГО НЕ ИЗМЕНИШЬ.')
    _else _if l3v4z = 3 _then write('НЕ БУДЕМ ТЕРЯТЬ ВРЕМЕНИ.');
    _goto 7660;
   _) _else _( (* 6414 *)
     _if (jstones > 36) _or (ustones > 36) _then _(
       l2v17z := true;
       _if (jstones > 36 ) _then _(
       _if Level = 1 _then _(
         write('ЛЮБЛЮ ОБЫГРЫВАТЬ НОВИЧКОВ !');
         _goto 7660;
       _);
       l3v4z :=   randint( (5C) );
       _if (l3v4z = (0C)) _then write('СЛАВА АЛЛАХУ - Я ВЫИГРАЛ !')
       _else _if (l3v4z = (1C)) _then write('Я УЖЕ ВЫИГРАЛ. ПОРА КОНЧАТЬ !')
       _else _if (l3v4z <> (2C)) _then _(
         write('ТЫ ПРОИГРАЛ'); maybeFeminine;
         write('  ТЫ ПРОИГРАЛ');  maybeFeminine;  write('!!');
       _) _else _if (l3v4z = (3C)) _then write('НЕ ПЕЧАЛЬСЯ, УДАЧА БУДЕТ ЖДАТЬ ТЕБЯ ЗАВТРА !')
       _else _( write('СДАВАЙСЯ, ТЫ УЖЕ ПРОИГРАЛ'); maybeFeminine; _)
  _) _else  (* 6465 *)
  _if (ustones > 36) _then (again) _(
    l3v4z :=   randint(8);
    _if (l3v4z = (0C)) _then write('СЛЕДУЮЩИЙ РАЗ ОБЯЗАТЕЛЬНО ВЫИГРАЮ !')
    _else _if (l3v4z = (1C)) _then write('НЕ ПОНИМАЮ, КАК ЭТО Я ПРОИГРАЛ . . .')
    _else _if (l3v4z = (2C)) _then write('ПОГОДИ !  СЛЕДУЮЩИЙ РАЗ Я ТЕБЕ ПОКАЖУ КАК НАДО ИГРАТЬ !')
    _else _if (l3v4z = (3C)) _then write('Я ПРОИГРАЛ - НЕПОНЯТНО . . .')
    _else _if (l3v4z = (4C)) _then  write('ШАЙТАН ТЕБЕ ДРУГ !!')
    _else _if (l3v4z = (5C)) _then _(
      _if (knownGender <> MASC) _or
         ((userScore - jinnScore) < (3C)) _or
         (Level < (4C)) _then _goto again;
        write('О, ЭФЕНДИ, ТЫ ДОСТОИН ЗВАНИЯ ИМАМА !');
     _) _else _if (l3v4z = (6C)) _then _(
     _if (Level < (4C)) _then _goto again;
       write('ВЫИГРАЕШЬ У МЕНЯ 12 РАЗ ПОДРЯД - ПОЛУЧИШЬ ВОЛШЕБНОЕ КОЛЬЦО !');
     _) _else _(
       write('О, ШАЙТАН !  ТЫ МЕНЯ ОБЫГРАЛ');  maybeFeminine;
     _)
  _); _goto 7660 (* 6545 *)
  _) _else _( (* 6546 *)
  _if (l2v40z > (0C)) _then _(
    l2v18z := false;
    l2v19z := ;
  _);
  _if l2v18z _then _goto 7660;
6553:
  l3v9z := (0C);
  l3v4z :=   chkRandom( (36C) );
  _if (l3v4z < (6C)) _and (l2v40z = (0C)) _and (l2v65z > (4C)) _then _(
    l3v4z :=   chkRandom( (6C) );
    _if (l2v19z) _then _(
      l2v18z := true;
      write('РАЗ ТЫ МОЛЧИШЬ, ТО И Я БУДУ МОЛЧАТЬ !');
      _goto 7660;
    _);
    write('ПОЧЕМУ');
    _if (l3v4z < (4C)) _then write(' НИЧЕГО НЕ ГОВОРИШЬ')
    _else write(' МОЛЧИШЬ');
    l2v40z := (0C);
    l2v19z := true;
    Dear;
    write(qmark:2);
    _goto 7650
  _);
% 6611
   _if (l3v4z = (1C)) _and night _then _(
     l3v4z :=   chkRandom( (2C) );
     _if (l3v4z = (1C)) _then write('СХОДИ УМОЙСЯ ЛУННЫМ СВЕТОМ !')
     _else write('ЗВЕЗДА АЛЬТАИР ВЗОШЛА, СДЕЛАЙ НАМАЗ.');
     _goto 7650;
   _); (* 6626 *)
   _if (l3v4z = (2C)) _and (jstones > ustones) _then _(
     l3v4z :=   chkRandom( (1C) );
     write('Я ПОКА ВЫИГРЫВАЮ');
     _goto 7650;
   _); (* 6636 *)
   _if (l3v4z = (3C)) _and  (l3v10z = (2C)) _then _(
     l3v4z :=   chkRandom( (3C) );
     _if (l3v4z = (1C)) _then write('ЛЮБЛЮ ХОДИТЬ В КАЛАХ !')
      _else _if (l2v126z = (2C)) _then write('ЕЩЕ РАЗ В КАЛАХ - ХОРОШО !');
      _goto 7650;
   _); (* 6654 *)
   _if (l3v4z = (4C)) _then _(
     l3v4z :=   chkRandom( (6C) );
     _if (l3v4z = (1C)) _then  write('ДАВАЙ ОТЛОЖИМ, МНЕ ПОРА ДЕЛАТЬ НАМАЗ.')
     _else _if (l3v4z = (2C)) _then  write('ЧЕЛОВЕК ПРОТИВ ДЖИННА НЕ УСТОИТ !')
     _else _if (l3v4z = (3C)) _then  write('БУДУ ДУМАТЬ КРЕПЧЕ.')
     _else _if (l3v4z = (4C)) _then write('ПРИЯТНО ПОИГРАТЬ В КАЛАХ !')
     _else write('Х-ММ !'); 
    _goto 7650;
  _); (* 6704 *)
  _if (l3v4z = (5C)) _and (jstones > ustones) _and (l2v58z <= l2v59z) _then _(
    l3v4z :=   chkRandom( (7C) );
    write('СЕЙЧАС У МЕНЯ БУДЕТ ');
    write(jstones);
    write(', А У ТЕБЯ ');
    write(ustones);
    _goto 7650;
  _);
   _if (l3v4z = (6C)) _and (jstones < ustones) _then _(
     l3v4z :=   chkRandom( (2C) );
     write('Я КАЖЕТСЯ ПРОИГРЫВАЮ');
     _goto 7650;
  _); (*  6734 *)
  _if (l3v4z = (7C)) _and (jstones < (ustones - (6C))) _then _(
    l3v4z :=   chkRandom( (2C) );
    write('НЕУЖЕЛИ Я ПРОИГРАЮ ?');
  _goto 7650;
  _); (* 6745 *)
  _if (l3v4z = (10C)) _and (abs((jstones - ustones)) < (3C)) _then _(
    l3v4z :=   chkRandom( (2C) );
    write('ПОСМОТРИМ КТО ВЫИГРАЕТ ?');
    _goto 7650;
  _); (* 6756 *)
 _if (l3v4z = (11C)) _and (jstones > ustones) _then _(
    l3v4z :=   chkRandom( (1C) );
    write('Я ТЕБЕ НЕ ГОРНЫЙ ГУЛЬ !');
    _goto 7650;
  _); (* 6766 *)
  _if (l3v4z = (12C)) _and l2v25z _then _(
    l3v4z :=   chkRandom( (3C) );
    l3v4z := l2v80z;
    _if (l3v4z = (0C)) _then l3v4z := (1C);
    write('Я ПРОСМОТРЕЛ ', l3v4z, ' ПОЗИЦИ');
   l3v4z :=   countEnding( l3v4z );
   _if (l3v4z = (1C)) _then l3v14z := 'Ю'
   _else _if (l3v4z = (2C)) _then l3v14z := 'И'
   _else l3v14z := 'Й';
   write(l3v14z, ', А ТЫ ?');
   _goto 7650;
  _); (* 7024 *)
  _if (l3v4z = (13C)) _and ((ustones - jstones) > (4C)) _then _(
    l3v4z :=   chkRandom( (1C) );
    write('КАК БЫ ТЫ МЕНЯ НЕ ОБЫГРАЛ'); maybeFeminine;
    _goto 7650;
  _); (* 7036 *)
  _if (l3v4z = (14C)) _and (spentThinking > (1000)) _then _(
    l3v4z :=   chkRandom( (2C) );
    write('ОЧЕНЬ ДОЛГО ДУМАЕШЬ');
    Dear;
    write(excl:2);
    _goto 7650
  _); (* 7051 *)
  _if (l3v4z = (15C)) _and efendi _and ((knownGender = MASC) _or (knownGender = FEM)) _then _(
   l3v4z :=   chkRandom( (6C) );
   write('НЕТ ТЕБЕ РАВНО');
   _if (knownGender = FEM) _then write('Й') _else write('ГО');
   write(' СРЕДИ ');
   _if (l3v4z = (1C)) _then write('АРАБОВ')
   _else _if (l3v4z = (2C)) _then write('МАВРОВ')
   _else _if (l3v4z = (3C)) _then write('БЕДУИНОВ')
   _else _if (l3v4z = (4C)) _then write('ЧЕРНОКОЖИХ')
   _else _if (l3v4z = (5C)) _then  write('ТУАРЕГОВ')
   _else write('ЭФИОПОВ');
   write(excl:2);
   _goto 7650
  _); (* 7125 *)
  _if (l3v4z = (16C)) _and (l3v10z <> (2C)) _and
    l2v26z _and  (l2v72z > (0C)) _then _(
    l3v4z :=   chkRandom( (1C) );
    write('КАЖЕТСЯ Я ДЕЛАЮ ПЛОХОЙ ХОД.');
    _goto 7650
  _); (* 7140 *)
  _if (l3v4z > (16C)) _and (l3v4z < (21C)) _and
      ((jstones - l2v58z) > (4C)) _then _(
    l3v4z :=   chkRandom( (5C) );
    write('Я ВЫИГРАЛ ', jstones - l2v58z, ' КАМНЕЙ !');
    _goto 7650
  _); (* 7157 *)
  _if (l3v4z = (21C)) _then _(
    l3v4z :=   chkRandom( (11C) );
    _if (l3v4z = (1C)) _then write('ЗНАЙ НАШИХ !')
    _else _if (l3v4z = (2C)) _then write('УФФ-УФФ !!')
    _else _if (l3v4z = (3C)) _and (knownGender = FEM) _and (age < (31C)) _and (age > (0C)) _then
      write('ТЫ, НАВЕРНОЕ, ТОНКА, КАК КИПАРИС !')
    _else _if (l3v4z = (4C)) _then write('СОВЕРШИ МОЛИТВУ В ТРИ РАКАТА !')
    _else _if (l3v4z = (5C)) _and  (knownGender = FEM) _and (age < (26C)) _and (age > (0C)) _then
      write('ХОТЕЛ БЫ ПОСМОТРЕТЬ НА ТЕБЯ, ДОРОГАЯ !')
    _else _if (l3v4z = (6C)) _then  write('Я ЗНАЮ ВЕЛИЧАЙШЕЕ ИЗ 99 ИМЕН АЛЛАХА !')
    _else _if (l3v4z = (7C)) _then  write('ПЕЧАТЬ СОЛОМОНА МНЕ НЕ СТРАШНА !')
    _else _if (l3v4z = (10C)) _then write('КУПИ СЕБЕ ВЕРБЛЮДА !')
    _else write('АЛЛАХ ВЕЛИК !!!');
    _goto 7650
    _); (* 7241 *)
  
    _if (l3v4z = (22C))
  _and
  ((ustones - l2v59z) > (12C)) _then _(
      l3v4z := chkRandom( (1C) );
      write('КАКОЙ УДАР ТЫ МНЕ НАНЕС');
      _if (knownGender = FEM) _then write('ЛА');
      write(excl:2);
      _goto 7650;
    _);
    _if (l3v4z = (23C)) _and (wrongGender) _and (l2v65z > (20C)) _then _(
      l3v4z :=   chkRandom( (1C) );
      _if (knownGender = MASC) _then write('Я ДУМАЮ, ТЫ ВСЕ-ЖЕ ХАНУМ.')
      _else _if (knownGender = FEM) _then write('Я ДУМАЮ, ВСЕ-ЖЕ ТЫ НЕ ХАНУМ.');
      _goto 7650;
    _); (* 7276 *)
    _if (l3v4z = (24C)) _and (spentThinking > (300)) _then _(
      l3v4z :=   chkRandom( (6C) );
      write('ТЫ ДУМАЛ');
      _if (knownGender = FEM) _then write(femending);
      l3v4z := ((spentThinking + (31C)) _DIV 50);
      write(space, l3v4z, ' СЕКУНД');
      l3v4z :=   countEnding( l3v4z );
      _if (l3v4z = (1C)) _then  l3v14z := 'У'
      _else _if (l3v4z = (2C)) _then l3v14z := 'Ы'
      _else _if (l3v4z = (3C)) _then l3v14z := space;
      write(l3v14z, excl:2);
      _goto 7650
    _); (* 7340 *)
    _if (l3v4z = (25C)) _and ((ustones - jstones) > (12C)) _and  (Level > (3C)) _then _(
      l3v4z :=   chkRandom( (1C) );
      write('СДАВАЙСЯ, ПОДАРЮ ТЕБЕ ');
      _if ((ustones - jstones) > (17C)) _then write('ВЕРБЛЮДА !')
      _else write('БУХАРСКУЮ ДЫНЮ !');
      _goto 7650;
    _); (* 7361 *)
    _if (l3v4z = (26C)) _and (l3v10z <> (2C)) _then _(
      l3v4z :=   chkRandom( (2C) );
      (loop) _for l3v5z := (1C) _to (6C) _do _(
        l3v4z := l3v24z[l3v5z];
        _if (l3v4z > (0C)) _then _(
          l3v3z := (l3v4z + l3v5z);
          l3v6z := ((7C) - l3v3z);
          _if (l3v3z < (7C)) _and  (l3v24z[l3v3z] = (0C)) _and (l3v15z[l3v6z] <> (0C)) _then _(
            l3v4z :=   chkRandom( (4C) );
            _if (l3v4z < (1C)) _then write('НЕ БЕРИ МОЮ ', l3v6z, ' ЛУНКУ.')
            _else _(
              write('ВОЗЬМИ МОЮ ', l3v6z, ' ЛУНКУ - Я ');
              _if (l3v4z = (2C)) _then write('НАРОЧНО ');
              write('ПОДСТАВИЛ.');
            _);
            _exit loop
          _)
        _)
      _);
      _goto 7650
    _); (* 7436 *)
    _if (l3v4z = (27C)) _and (Level > (2C)) _then _(
      l3v4z :=   chkRandom( (10C) );
      _if (l3v4z = (1C)) _then  write('КРАСНЫЕ ')
      _else _if (l3v4z = (2C)) _then  write('ЧЕРНЫЕ ');
      _if (l3v4z < (3C)) _then write('ДЖИННЫ ОЧЕНЬ ОПАСНЫ !');
      _goto 7650
    _); (* 7457 *)
    _if (l3v4z = (30C)) _then _(
      l3v4z :=   chkRandom( (10C) );
      _if (l3v4z = (1C)) _then _(
        write('ПРОШУ ТЕБЯ, НЕ ГОВОРИ "БИСМИЛЛА РАХМАН РАХИМ" !');
      _) _else _(
      _if (l3v4z < (4C)) _and (age > (0C)) _and (age < (36C)) _then _(
        _if (l3v4z = (2C)) _then write('Я ДУМАЮ ')
        _else write('НАВЕРНОЕ ');
        write('МАХАББА ТЕБЕ НЕ НУЖНА.');
      _) _else _(
        _if (l3v4z = (4C)) _and (age > (36C)) _then
          write('ЕСЛИ ТЕБЕ НУЖНА МАХАББА, СООБЩИ МНЕ ОБ ЭТОМ.');
      _)
    _);
    _goto 7650
  _); (* 7514 *)
  _if (l3v4z = (31C)) _and (Level > (2C)) _and ((jstones - ustones) > (12C)) _then _(
    l3v4z :=   chkRandom( (2C) );
    write('ВЫИГРАЕШЬ - ');
    _if (l3v4z = (1C)) _then  write('ПОЛУЧИШЬ ТАМРИД.')
    _else write('ДАМ ТЕБЕ ТЕТВИФ.');
    _goto 7650
  _); (* 7534 *)
  _if (l3v4z = (32C)) _and (knownGender = MASC) _and (Level > (2C)) _and (l2v65z > (5C)) _then _(
    l3v4z :=   chkRandom( (6C) );
    _if (l3v4z = (1C)) _then  write('СКАЖИ МНЕ, ЛАЛЛА МИРА')
    _else _if (l3v4z = (2C)) _then  write('СОЗНАЙСЯ, АЙША КАДЕША');
    _if (l3v4z < (3C)) _then write(' С ТОБОЙ НЕ ВСТРЕЧАЛАСЬ ?');
  _goto 7650;
  _); (* 7560 *)
  _if (l3v10z <> (2C)) _then _(
    l3v6z := (0C);
    l3v12z := ;
    l3v13z := ;
    _for l3v5z := (1C) _to (6C) _do _(
      l3v4z := l3v24z[l3v5z];
      _if (l3v4z > (0C)) _then _(
        l3v3z := (l3v4z + l3v5z);
        l3v6z := (l3v6z + (1C));
        _if (l3v3z = (7C)) _or (l3v3z = (24C)) _then l3v12z := (1C)
        _else l3v13z := (1C);
      _)
    _); (* 7605 *)
    l3v4z :=   chkRandom( (4C) );
   _if (l3v6z = (1C)) _then _(
     _if (l3v4z = (1C)) _then write('НЕЧЕГО ДУМАТЬ - ХОДИ !')
     _else _(
       _if (l3v4z = (2C)) _then write('ТЕПЕРЬ ТЕБЕ ДУМАТЬ НЕЧЕГО - ХОДИ !')
       _else write('У ТЕБЯ ВСЕГО ОДИН ХОД.');
     _) (* 7624 *)
   _) _else _(
     _if (l3v12z <> 0) _and (l3v13z <> 0) _then _(
       _if (l3v4z = (1C)) _then write('НЕ СОВЕТУЮ ХОДИТЬ В КАЛАХ.')
       _else _if (l3v4z = (2C)) _then write('СОВЕТУЮ ПОЙТИ В КАЛАХ.')
       _else _if (l3v4z = (3C)) _then write('НА ХОД В КАЛАХ ОСОБЕННО НЕ НАДЕЙСЯ.')
       _else write('ПОСМОТРЮ, ПОЙДЕШЬ ЛИ В КАЛАХ ?');
     _)
   _) (* 7647 *)
  _) (* 7650 *)
   _)
 _);
 7650:;
  _if (l3v11z) _then _goto 7660;
  code(СЧ75205=3ЗЧ7,СЧ75224=3ЗЧ10,);
  l3v11z := true;
  _if ((l3v4z + (1C)) = l3v5z) _then _goto 6553;
7660:
 _if (l2v126z = (2C)) _then putNchars( delay, (gl28z * 4) );
 P2747;
 spentThinking := (0C);
 l2v126z := l3v10z;
 l2v58z := jstones;
 l2v59z := ustones;
_);
_procedure P7674;
_var l3v1z:integer;
_(
  reset(tempfile);
  l2v64z := 5;
  _if (tempfile@ _in digit) _then l2v64z := l2v64z + 1;
_);
_procedure sigRestore;
_(
  oldHandler := oldHandler;
  code(7ПА3=Э050103,ВИ7=Э050102,)
_);
_procedure P7743;
_label 10017;
_var l3v1z:char;
_(
  TTOUT;
  write((NgameToday + (1C)));
  title;
  write(space:25);
  writeJinn;
  write(jinnScore:4);
  write(userScore:7);
  write(space:3);
  writeUser;
  _if (Level = (1C)) _then l3v1z := 'Ю'
  _else _if (Level = (2C)) _then l3v1z := K
  _else _if (Level = (3C)) _then l3v1z := 'У'
  _else _if (Level = (4C)) _then l3v1z := 'Э';
  write(l3v1z:3);
  TTOUT;
  _if ((jinnScore + userScore) >= (255)) _and  (l2v13z = 0) _then _(
    TTOUT;
    write('В А Ш   Т У Р Н И Р   О К О Н Ч Е Н':54);
10017:
    TTOUT;
    sigrestore;
    _GOTO 12561;
  _);
  _if (l2v11z <> 0) _then write('ПРОДОЛЖЕНИЕ ОТЛОЖЕННОЙ ПАРТИИ':51)
  _else _if (NgameToday >= (5C)) _then _(
    TTOUT;
    write('СЕГОДНЯ ИГРАТЬ БОЛЬШЕ НЕ БУДУ':51);
    _goto 10017
  _);
  _if (l2v13z <> 0) _then _(
    write('Т Р Е Н И Р О В О Ч Н А Я':49);
  _) _else _if ((31C) _IN gl87z) _and _not ([3,6] <= gl73z) _then _(
    TTOUT;
    write('ТУРНИР ДЛЯ ВАС ЗАКРЫТ':47);
    _goto 10017
  _);
  l2v29z := gl90z;
  gl90z := false;
  code(СЧ13=ЗЧ76013,); (* C/2013 := (1C); ??? *)
  write(lf, lf, lf);
  drawField(currentState);
  putNchars(up, 2);
  TTOUT;
_);

_( (* playKalah *)
  checkOpen;
  RAND0;
  l2v38z := (100);
  l2v15z := true;
  l2v43z := 1000000;
  oneOverLn2 := 1.0 / LN(2);
   l2v73z := (0C);
  jinnTicks := ;
  userTicks := ;
 l2v77z := ;
 l2v78z := ;
 l2v70z := ;
 l2v71z := ;
 l2v44z := ;
 l2v72z := ;
 l2v26z := ;
 l2v9z := ;
 l2v45z := ;
 l2v48z := ;
 l2v49z := ;
 l2v16z := ;
 gl15z := ;
 l2v17z := ;
 l2v21z := ;
 l2v24z := ;
 l2v64z := ;
 l2v25z := ;
 l2v28z := ;
 l2v67z := ;
 l2v22z := ;
 l2v18z := ;
 l2v19z := ;
 l2v58z := ;
 l2v59z := ;
 l2v14z := ;
 l2v129z := ;
 l2v40z := ;
  _if ((33C) _IN gl87z) _then  writeln('НЕПОНЯТНО'); (* sync up literals *)

 _if (l2v36z = (0C)) _or (l2v50z = (2C)) _then _(
 _if (l2v36z = (0C)) _then  writeln('КАТЕГОРИЯ ? <Ю,К,У,Э>')
 _else _if (l2v50z = (2C)) _then  writeln('КТО НАЧИНАЕТ ? <ДЖИН,ПОЛЬЗ>');
 TTIN(false);
  (* goto 10266 *)
  _) _else _(
   writeln('ТУРНИР ЗАКРЫТ');
   _GOTO 12561;
  _);
  writeln(F5206(0,0,0));
  phrase
_);
(* main program *)

_(      
  i := remTime; i := ticks; writeJinn; writeUser; ttin(true); gl90z := checkTime;
  checkNo; i := F1631(1); P1634(0); write(getTime); printTenths(54); readZone(0,0); writeZone(0,0);
  enq66; deq66; gl90z := getminel(i, b); P2023(ls); toLargeSet(1, ls); gl90z := inLargeSet(1, ls);
  i := getDays + F2355(0,0) + zeller(0,0,0) + F2573B(0,0);
  checkOpen; playKalah; 
  TTOUT; P2747;
  12561 :; 12633 :
_).     
