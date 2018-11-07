all:
	lex lexico.l
	gcc lex.yy.c -o lex01
	./lex01
