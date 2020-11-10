{
  function extractList(list, index) {
    return list.map(function(element) { return element[index]; });
  }

  function buildList(head, tail, index) {
    return [head].concat(extractList(tail, index));
  }

}


Expression
  = head:Child tail:(_ Child)* {
      return buildList(head, tail, 1);
    }

Child
 = Comment
   / PedsBlock
   / CarsBlock
   / ObjsBlock
   / WeapsBlock
   / HierBlock
   / EMPTY_LINE

NL 'new line' =
    '\r'
  / '\n'
  / '\r\n'
  / '\n\r'

Comment 'comment' = '#' any* NL {
	return {
    	type: 'COMMENT',
        text: text(),
    }
}

any = [^\r\n] {
	return text();
}

_ "whitespace"
  = [ \t]*

PedsBlock
  = "peds" NL
  head:Peds tail:(_ Peds)*
  "end" NL {
  	return {
    	type: "PEDS_BLOCK",
    	peds: buildList(head, tail, 1)
    }
  }

Peds =
   Comment
 / Ped
 / EMPTY_LINE

Ped
 =  n: NUMERIC _ "," _
 	id: TEXT _ "," _
 	name: TEXT _ "," _
 	WWW: TEXT _ "," _
 	STA: TEXT _ "," _
 	anim: TEXT _ "," _
 	aaaa: TEXT _ "," _
 	unk: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _
   NL {
   	return {
    	n, id, name, WWW, STA, anim, aaaa, unk, unk1, unk2
    }
   }



CarsBlock
  = "cars" NL
  head:Cars tail:(_ Cars)*
  "end" NL {
  	return {
    	type: "CARS_BLOCK",
    	cars: buildList(head, tail, 1)
    }
  }

Cars =
   Comment
 / Vehicle
 / EMPTY_LINE

Vehicle =
 Car
 / Boat
 / Heli
 / Bike
 / Plane

Car
 =  n: TEXT _ "," _
 	modelName: TEXT _ "," _
 	txdName: TEXT _ "," _
 	type: "car" _ "," _
 	handlingId: TEXT _ "," _
 	gamename: TEXT _ "," _
 	anims: TEXT _ "," _
 	className: TEXT _ "," _
 	frq: TEXT _ "," _
 	lvl: TEXT _ "," _
 	compRules: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _
   NL {
   	return {
    	n, modelName, txdName, type, handlingId, gamename,
        anims, className, frq, lvl, compRules, unk1, unk2
    }
  }

Boat
 =  n: TEXT _ "," _
 	modelName: TEXT _ "," _
 	txdName: TEXT _ "," _
 	type: "boat" _ "," _
 	handlingId: TEXT _ "," _
 	gamename: TEXT _ "," _
 	anims: TEXT _ "," _
 	className: TEXT _ "," _
 	frq: TEXT _ "," _
 	lvl: TEXT _ "," _
 	compRules: TEXT _
   NL {
   	return {
    	n, modelName, txdName, type, handlingId, gamename,
        anims, className, frq, lvl, compRules
    }
  }

Heli
 =  n: TEXT _ "," _
 	modelName: TEXT _ "," _
 	txdName: TEXT _ "," _
 	type: "heli" _ "," _
 	handlingId: TEXT _ "," _
 	gamename: TEXT _ "," _
 	anims: TEXT _ "," _
 	className: TEXT _ "," _
 	frq: TEXT _ "," _
 	lvl: TEXT _ "," _
 	compRules: TEXT _
   NL {
   	return {
    	n, modelName, txdName, type, handlingId, gamename,
        anims, className, frq, lvl, compRules
    }
  }

Bike
 =  n: TEXT _ "," _
 	modelName: TEXT _ "," _
 	txdName: TEXT _ "," _
 	type: "bike" _ "," _
 	handlingId: TEXT _ "," _
 	gamename: TEXT _ "," _
 	anims: TEXT _ "," _
 	className: TEXT _ "," _
 	frq: TEXT _ "," _
 	lvl: TEXT _ "," _
 	compRules: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _
   NL {
   	return {
    	n, modelName, txdName, type, handlingId, gamename,
        anims, className, frq, lvl, compRules, unk1, unk2
    }
  }

Plane
 =  n: TEXT _ "," _
 	modelName: TEXT _ "," _
 	txdName: TEXT _ "," _
 	type: "plane" _ "," _
 	handlingId: TEXT _ "," _
 	gamename: TEXT _ "," _
 	anims: TEXT _ "," _
 	className: TEXT _ "," _
 	frq: TEXT _ "," _
 	lvl: TEXT _ "," _
 	compRules: TEXT _ "," _
 	unk1: TEXT _
   NL {
   	return {
    	n, modelName, txdName, type, handlingId, gamename,
        anims, className, frq, lvl, compRules, unk1
    }
  }









ObjsBlock
  = "objs" NL
  head:Objs tail:(_ Objs)*
  "end" NL {
  	return {
    	type: "OBJS_BLOCK",
    	objs: buildList(head, tail, 1)
    }
  }


Objs =
   Comment
 / Obj1
 / Obj2
 / EMPTY_LINE

Obj1
 =  n: TEXT _ "," _
 	id: TEXT _ "," _
 	name: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _ "," _
 	unk3: TEXT _ "," _
 	unk4: TEXT _
   NL  {
   	return {
    	n, id, name, unk1, unk2, unk3, unk4
    }
  }


Obj2
 =  n: TEXT _ "," _
 	id: TEXT _ "," _
 	name: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _ "," _
 	unk3: TEXT _
   NL {
   	return {
    	n, id, name, unk1, unk2, unk3
    }
  }

WeapsBlock
  = "weap" NL
  head:Weaps tail:(_ Weaps)*
  "end" NL {
  	return {
    	type: "WEAPS_BLOCK",
    	peds: buildList(head, tail, 1)
    }
  }


Weaps =
   Comment
 / Weap
 / EMPTY_LINE

Weap
 =  n: TEXT _ "," _
 	id: TEXT _ "," _
 	name: TEXT _ "," _
 	unk1: TEXT _ "," _
 	unk2: TEXT _ "," _
 	unk3: TEXT _ "," _
 	unk4: TEXT _
   NL {
   	return {
    	n, id, name, unk1, unk2, unk3, unk4
    }
   }






HierBlock
  = "hier" NL
  head:Hiers tail:(_ Hiers)*
  "end" NL  {
  	return {
    	type: "HIER_BLOCK",
    	hier: buildList(head, tail, 1)
    }
  }


Hiers =
   Comment
 / Hier
 / EMPTY_LINE

Hier
 =  n: TEXT _ "," _
 	id: TEXT _ "," _
 	name: TEXT _
   NL {
   	return {
    	n, id, name
    }
   }









TEXT 'text' = [\.0-9a-zA-Z_-]+ {
	return text();
}

NUMERIC = [0-9.]+ {
	return parseFloat(text());
}

EMPTY_LINE = _ NL {
	return "";
}
