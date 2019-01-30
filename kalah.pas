(*=p-,t-,l+*)_program КАЛАХ;
_label 12561, 12633;
_const list = 64000B; zero = 0; one = 1;
c54 = 54; z236 = 2400236B; c517 = 517; c523 = 523;
z730 = 1660730B; z153 = 400153B; z635 = 660635B; c522 = 522;
z600 = 660600B; z611 = 660611B; c4 = 4; c5 = 5; c25 = 25;
etx = '{377'; c62 = 62; c1008 = 1008; space = ' '; c14 = 14;
c13 = 13; c10 = 10; c11 = 11; lf = '{214'; cr = '{175'; c212 = 21;
spaces = '      '; arrow = ' =++> '; admin = '417700'; sleep = 'sle   ';
fin = '(FIN){175'; c31 = 31; oparen = '('; cparen = ')'; excl = '!'; c94 = 94;
c49 = 49; c45 = 45; c47 = 47; c36 = 36; c50 = 50; c32 = 32; c61 = 61;
K = 'K'; c51 = 51; c60 = 60; z = 'z'; c9 = 9; e10p1 = 1777B; c6 = 6;
c7 = 7; c2 = 2; c12=12; c30=30; c39=39;
_type
bitset = _set _of 0..47;
letter = 'a' .. 'z';
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
player = (jinn, user);
contents = _record val:integer _end;
unppits = _record move:player; pits:_array [1..7] _of contents _end;

_var
gl10z,
gl11z:integer;
gl12z:alfa;
gl13z,gl14z,gl15z,logidx,charidx,gl18z:integer;gl19z,gl20z:boolean;
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

(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
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
_var v1:integer; v2: boolean;
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

v2 := (y _mod 4 = 0) _and (m > 2);
 months := (y-1) * 365 + (y-1) _div 4 + ord(v2) + v1 + d;
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
  l2v2z := ((((ord(t[2]) * (12C)) + ord(t[3])) * 2) + (((ord(t[5]) * (12C)) + ord(t[6])) _DIV 30));
  _if _not (l2v2z _IN l2v13z) _then _(
    writeln('ИГРА СЕЙЧАС ЗАКРЫТА');
    _repeat
      l2v2z := (l2v2z + (1C));
      _if (l2v2z _IN l2v13z) _then _(
        write('ОТКРОЕТСЯ В ');
        l2v1z := (l2v2z _div 2);
        l2v2z := ((l2v2z - (l2v1z * 2)) * (36C));
        printTenths( l2v1z );
        write(chr(16B));
        printTenths( l2v2z );
        writeln(' - СЕЙЧАС', getTime);
2:
        rewrite(tempfile);
        write(tempfile,'ВЫХ  {377');
        gl18z := (0C);
        _GOTO 12633;
      _);
    _until (l2v2z >= (57C));
    writeln('СЕГОДНЯ НЕ ОТКРОЕТСЯ');
    _goto 2
  _);
  gl19z := (l2v2z < (15C)) _or (l2v2z > (51C));
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
cba = 8415; cbb = 72; cbc = 114; cbd = 121; cbe = 102;
cbf = 126; cbg = 127; cbh = 98;
_type
unpboth = _array [jinn..user] _of unppits;
pckboth = _array [jinn..user] _of word;
_var locvars:_array[1..7] _of word;
l2v8z:alfa;
locv2:_array[9..365] _of word;
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
  l3v1z := l3a1z[user].move;
  l3v5z := ;
  l3v10z := ref(l3a1z);
  l3v6z := l3v10z@[ord(l3v1z)*8+l3a2z].val;
  _if (l3v6z = 0) _then _( F3475 := 0; exit _);
  l3v10z@[ord(l3v1z)*8+l3a2z].val := 0;
3520:
   code(3сч6=ср13,3зч15=);
  _if (l3v1z = l3v5z) _then
    l3v4z := 7
  _else
    l3v4z := 6;

  _for l3v3z := 1 _to l3v6z _do _(
    l3v2z := (l3a2z + l3v3z);
    _if (l3v2z <= l3v4z) _then _(
      l3v13z := ref(l3v10z@[ord(l3v1z)*8+l3v2z]);
      l3v13z@ := l3v13z@ + 1;
      l3v7z := ;
      _if (l3v3z = l3v6z) _then _(
        _if (l3v2z = (7C)) _then _(
          F3475 := (2C);
        _) _else _(
          F3475 := 1;
          l3a1z[jinn].move := l3v5z;
          code(ср13=);
          l3a1z[user].move := ;
          _if (l3v7z = (1C)) _and (l3v1z = l3v5z) _then _(
            l3v11z := ref(l3v10z@[ord(l3v8z)*8+7-l3v2z]);
            l3v9z := l3v11z@;
            _if (l3v9z > (0C)) _then _(
              l3v12z := ref(l3v10z@[ord(l3v5z)*8+7]);
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
      code(3cч6=ср13,3зч6=);
      l3a2z := (0C);
      _goto 3520;
    _)
  _)
_);

_functin performMove(_var l3a1z:unpboth; l3a2z:integer):integer;
_var l3v:_array [1..10] _of integer;
     l3v11z, l3v12z, l3v13z:integer;
_procedure drawMove(l4a1z: player; l4a2z: integer);
_var l4v1z, l4v2z, l4v3z,l4v4z,l4v5z,l4v6z,l4v7z:integer;
l4v8z:char;
_(
  _if (l4a2z = (7C)) _then _(
    l4v5z := (0C);
    _if (l4a1z = user) _then
      l4v4z := ((22C) + (44C))
    _else
      l4v4z := ((22C) - (1C));
  _) _else _(
    _if (l4a1z = user) _then _(
      l4v6z := l4a2z;
      l4v5z := -1;
    _) _else _(
      l4v6z := ((7C) - l4a2z);
      l4v5z := (1C);
    _);
    l4v4z := ((l4v6z * (5C)) + (22C));
  _);
  _if (l4v4z > l3v11z) _then _(
    l4v8z := chr(121);
    l4v3z := (l4v4z - l3v11z);
  _) _else _(
    _if (l4v4z < l3v11z) _then _(
      l4v8z := chr(102);
      l4v3z := (l3v11z - l4v4z);
    _) _else _(
      l4v3z := (0C); (q) _exit q
    _);
  _);
  _for l4v2z := (1C) _to l4v3z _do _(
    _for l4v1z := (1C) _to gl28z _do _(
      write(chr(142B));
    _);
    write(l4v8z);
  _);
  _if (l4v5z > l3v12z) _then _(
    l4v8z := chr(126);
    l4v3z := (l4v5z - l3v12z);
  _) _else _(
    _if (l3v12z > l4v5z) _then _(
      l4v8z := chr(127);
      l4v3z := (l3v12z - l4v5z);
    _) _else _(
      l4v3z := (0C); (q) _exit q
    _)
  _);
  _for l4v2z := (1C) _to l4v3z _do _(
    _for l4v1z := (1C) _to gl28z _do _(
      write(chr(142B));
    _);
    write(l4v8z);
  _);
  l4v7z := l3a1z[l4a1z].pits[l4a2z].val;
  _if (l4v7z = (0C)) _then
    write(space:2)
  _else
    write(l4v7z:2);
  putNchars( chr(142B), gl28z );
  l3v11z := (l4v4z + (2C));
  l3v12z := l4v5z;
_);
_( (* performMove *)
_);
_( (* playKalah *)
_);
(* main program *)

_(      
  i := remTime; i := ticks; writeJinn; writeUser; ttin(true); gl90z := checkTime;
  checkNo; i := F1631(1); P1634(0); write(getTime); printTenths(54); readZone(0,0); writeZone(0,0);
  enq66; deq66; gl90z := getminel(i, b); P2023(ls); toLargeSet(1, ls); gl90z := inLargeSet(1, ls);
  i := getDays + F2355(0,0) + zeller(0,0,0) + F2573B(0,0);
  checkOpen; 
  TTOUT; P2747;
  12561 :; 12633 :
_).     
