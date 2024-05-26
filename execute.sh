bison -d syntactical.y
flex lexical.l
gcc syntactical.tab.c lex.yy.c -lfl -o proy.exe
./proy.exe queries.txt results.txt
