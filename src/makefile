all:
	lex ast.l
	yacc -d ast.y
	gcc lex.yy.c y.tab.c graph.c -o aste -ll

clean:
	rm -rf lex.yy.c y.tab.c y.tab.h aste
