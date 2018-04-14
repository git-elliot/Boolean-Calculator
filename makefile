all: 
	flex bcalc.l
	bison bcalc.y -d
	gcc bcalc.tab.c -ll -ly
