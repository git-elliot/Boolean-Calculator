# Boolean-Calculator

Boolean calculator for lex and yacc which performs operations like not, and, or, nor, xnor, nand, etc.
Check [grammar specification](grammar\ specification) file for more information about grammar used in this calculator.

# How to compile 

 ```C
 flex bcalc.l
 bison bcalc.y -d
 gcc bcalc.tab.c -ll -ly
 ```
 or use single command make
 
 ```c
 make
 ````
# How to Run

 ```c
 ./a.out
 ````

 After running the a.out file, your calculator runs and you have to enter the input. e.g., 1 xor 0.


