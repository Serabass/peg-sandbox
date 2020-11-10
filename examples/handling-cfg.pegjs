{
  function extractList(list, index) {
    return list.map(function(element) { return element[index]; });
  }

  function buildList(head, tail, index) {
    return [head].concat(extractList(tail, index));
  }
}

Expression
  = head:Line tail:(_ Line)* {
      return buildList(head, tail, 1);
    }

Line
 = Comment
 / EmptyLine
 / CarLine
 / BoatLine
 / BikeLine
 / PlaneLine

EmptyLine = NL

Comment
 = ';' text* NL {
 	return {
    	type: 'COMMENT',
        text: text(),
    };
 }

_ = ws*

__ = ws+

ws = [ \t]

text = [^\r\n]+

CarLine =
 A: Identifier  _
 B: Float _
 C: Float _
 D: Float _
 E: Float _
 F: Float _
 G: Float _
 H: Float _
 I: int _
 J: Float _
 K: Float _
 L: Float _
 M: int _
 N: Float _
 O: Float _
 P: WD _
 Q: EngineType _
 R: Float _
 S: Float _
 T: int _
 U: Float _
 V: Float _
 W: Float _
 X: Float _
 Y: Float _
 Z: int _
 aa: Float _
 ab: Float _
 ac: Float _
 ad: Float _
 ae: Hex _
 af: int _
 ag: int _ NL {
 	return {
      A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,
      Q,R,S,T,U,V,W,X,Y,Z,
      aa,ab,ac,ad,
      ae,ad,ag
    }
 }

BoatLine =
'%' _
	A: Identifier _
    B: Float _
    C: Float _
    D: Float _
    E: Float _
    F: Float _
    G: Float _
    H: Float _
    I: Float _
    J: Float _
    K: Float _
    L: Float _
    M: Float _
    N: Float _
    O: Float _
    NL {
        return {
          A,B,C,D,E,F,G,H,I,J,K,L,M,N,O
        }
     }

BikeLine =
'!' _
	A: Identifier _
    B: Float _
    C: Float _
    D: Float _
    E: Float _
    F: Float _
    G: Float _
    H: Float _
    I: Float _
    J: Float _
    K: Float _
    L: Float _
    M: Float _
    N: Float _
    O: Float _
    P: Float NL {
 	return {
      A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P
    }
    }

PlaneLine =
'$' _
	A: Identifier _
    B: Float _
    C: Float _
    D: Float _
    E: Float _
    F: Float _
    G: Float _
    H: Float _
    I: Float _
    J: Float _
    K: Float _
    L: Float _
    M: Float _
    N: Float _
    O: Float _
    P: Float _
    Q: Float _
    R: Float _
    S: Float NL {
      return {
        A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S
      }
   }

NL =
   '\n'
 / '\r'
 / '\r\n'


Identifier = [A-Za-z0-9]+ {
	return text();
}

int = [0-9]+ {
	return parseInt(text(), 10)
}

Decimal = '-'? int

Float = '-'? int '.' int {
	return parseFloat(text());
}

EOF = !.

Hex
 = [A-F0-9]+ {
 	return text();
 }

WD
  = '4'
  / 'R'
  / 'F'

EngineType
 = 'P'
 / 'D'
 / 'E'
 / 'p'
