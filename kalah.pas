(*=p-,t-,l+*)_program КАЛАХ;
_label 12561, 12633;
_const zoneaddr = 64000B; zero = 0; one = 1;
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
both = _record a:alfa; c:_array[1..6] _of char _end;
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
_var
gl10z,
gl11z,gl12z,gl13z,gl14z,gl15z,gl16z,gl17z,gl18z:integer;gl19z,gl20z:boolean;
gl21z,gl22z,gl23z,gl24z,gl25z,gl26z,gl27z,gl28z:integer;bufptr:@zone;
gl29z:_array[1..5] _of word;
gl35z,gl36z,gl37z,gl38z,gl39z,gl40z:integer;
gl41z,gl42z,gl43z,gl44z,gl45z,gl46z,gl47z,gl48z,gl49z,gl50z:integer;
gl51z,gl52z,gl53z,gl54z,gl55z,gl56z,gl57z,gl58z,gl59z,gl60z:integer;
gl61z,gl62z,gl63z,gl64z,gl65z,gl66z,gl67z,gl68z,gl69z,gl70z:integer;
gl71z,gl72z,gl73z:bitset;gl74z,gl75z,gl76z,gl77z,gl78z,gl79z,gl80z:integer;
gl81z,gl82z,gl83z,gl84z:integer;gl85z,gl86z:bitset;
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
% (q) _exit q; (q) _exit q;
 (q) _exit q;
%   (q) _exit q; (q) _exit q;
% (q) _exit q;
 (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
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
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;
(q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q; (q) _exit q;

_);
_function remTime:integer;
_( code(Э0634=,); remTime := ; _);

_function ticks:integer;
_( code(Э05310=,); ticks := ; _);
_procedure unused; _( writeln_);
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
      gl87z := (gl87z + [47]);
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
  _if ((gl80z - l2v1z) < 120) _then _(
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
  _if l2v2z > 0C _then _(
    gl24z := l2v2z;
    P1634(l2a1z - 1);
    gl24z := 1C;
  _);
  _if gl25z = 1 _then _(
    l2v3z := (44C);
  _) _else _(
    l2v3z := (26C);
  _);
  _if (l2a1z <= l2v3z) _and (l2a1z > 0) _then P1634(0);
_);

_function getTime:alfa;
_var l2v1z, l2v2z:integer;
l2v:_array [1..6] _of char; l2v9z:alfa;
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
  _var v1: integer; v2: alfa;
_(  
 v1 := 377777600000B;
 v2 := '3 1   ';
  code(Э050114=,2Э0204=2Э0215,СД/20/=2ЗЧ4,МР=СД/-10/,2ЗЧ5=МР,2СМ5=СД/40/,17ЛС0=2СМ4,СД/-20/=17ЛС0,);
  getDate := ;
_);

_function F2112(a:alfa):integer;
_type date = _record d10, d1, m10, m1, y10, y1: integer _end;
_var p:@date; c:_array[0..5] _of char; 
_(
  unpck(c[0], a);
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
 v2 := (2C);
 v1 := (35C);
  _) _else _(
 _if (a > (74C)) _and  v4 _then a := (a - (1C));

  _select 
  a > 334: _(v2 := (14C);v1 := (334); _);
  a > 304: _(v2 := (13C);v1 := (304); _);
  a > 273: _(v2 := (12C);v1 := (273); _);
  a > 243: _(v2 := (11C);v1 := (243); _);
  a > 212: _(v2 := (10C);v1 := (212); _);
  a > 181: _(v2 := (7C);v1 := (181); _);
  a > 151: _(v2 := (6C);v1 := (151); _);
  a > 120: _(v2 := (5C);v1 := (120); _);
  a > 132C: _(v2 := (4C);v1 := (132C); _);
  a > 73C: _(v2 := (3C);v1 := (73C); _);
  a > 37C: _(v2 := (2C);v1 := (37C); _);
  true: _(v2 := (1C); v1 := (0C); _)
  _end;
 v1 := a - v1;
  _);
 F2227 := ((((v3 * (100)) + v2) * (100)) + v1);
  _);

_function F2355(l2a1z, l2a2z:integer):integer;
_(
  F2355 := F2227( (F2211( l2a1z) + l2a2z) );
_);

_function zeller(l2a1z, l2a2z, l2a3z:integer):integer;
_(
 _if (l2a2z < (3C)) _then l2a3z := (l2a3z - (1C));
 l2a2z := (l2a2z + (11C));
 _if (l2a2z > (13C)) _then l2a2z := (l2a2z - (14C));
 l2a2z := (l2a2z + (1C));
 zeller := (((((l2a1z + l2a3z) + (l2a3z _div 4)) + ((((15C) * l2a2z) - (1C)) _DIV 5)) - (34C)) _MOD (7C));
  _);

_procedure checkOpen;
_label 1, 2;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z:integer;
l2v6z:alfa;
t:_array [1..6] _of char;
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

_procedure packPits(_var l2a1z:_array [0..7] _of integer; _var l2a2z:word);
_var l2v2z:integer;
_( code(2ИК3=СЧ,СД/-6/=17ЗЧ,);
  _for l2v2z := 1 _to 6 _do 
    code(2СЧ5=УИ7,2ИК3=7СЧ,17ЛС=СД/-6/,17ЗЧ=);
  
  code(17СЧ=СД/-3/,2ИК3=ЛС7,);
  l2a2z :=;
_);

_procedure unpackPits(_var l2a1z:_array [0..7] _of integer; l2a2z:word);
_var l2v1z:integer;
_(
  code(2СЧ4=СД/-3/,2ЗЧ4=МР,);
  l2a1z[0] := ;
  _for l2v1z := (1C) _to 6 _do _(
    code(2СЧ4=СД/-6/,2ЗЧ4=MP,17ЗЧ=2СЧ5,2АС3=17ЗЧ,17ИК=ИА,15ПА=17СЧ,15ЗЧ=)
  _);
  code(2СЧ4=СД/-11/,МР=2ИК3,ЗЧ7=);
_);

_procedure getName(_var l2a1z:alfa; _var l2a2z:alfa);
_var l2v1z:_array[1..6] _of char; l2v7z: boolean; l2v8z:integer;
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
_var l2v1z, l2v2z:integer;l2v3z:_array[0..7] _of integer;
_procedure drawPit(pit:integer);
_(
  write(oparen:2);
  l2v2z := l2v3z[pit];
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

(* main program *)

_(      
  i := remTime; i := ticks; writeJinn; writeUser; ttin(true); gl90z := checkTime;
  checkNo; i := F1631(1); P1634(0); write(getTime); printTenths(54); readZone(0,0); writeZone(0,0);
  enq66; deq66; gl90z := getminel(i, b); P2023(ls); toLargeSet(1, ls); gl90z := inLargeSet(1, ls);
  i := getDays + F2355(0,0) + zeller(0,0,0) + F2573B(0,0);
  checkOpen; packPits(gl94z, gl89z); unpackPits(gl94z, gl89z);
  TTOUT; P2747;
  12561 :; 12633 :
_).     
