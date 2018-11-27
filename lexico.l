%{
#include <stdio.h>

// EXPRESSÃO REGULAR DO TOKEN 'COMMENT': \(\*C*\*((C'C*\*)|\*)*\)
// Notação:
// 		\* -> Caracter asterisco.
//		* -> Operador estrela.
//		\( -> Caracter '('

enum tokens{LER, IMPRIMIR, INICIO, END, NUM, COMMENT, OUTRO, ID, EXPRESSAO};

%}
id	[a-zA-Z][a-zA-Z0-9]*
operador	[*\/\+-]
digito   [0-9]
unsigned_int    {digito}+
signed_int  [+-]{unsigned_int}
unsigned_float  {digito}*"."{digito}+\n|{digito}+"."{digito}*
signed_float    [+-]{digito}+"."{digito}*
clinha [a-zA-Z0-9\!\@\#\$\%\&\(\¹\²\³\£\¢\¬\,\<\.\>\;\"\?\·\°\^\~\}\º\{\ª\`\'\"\'\[\]\/\\]
cComParenteses {clinha}|\)
comment  \(\*{cComParenteses}*\*(({clinha}{cComParenteses}*\*)|\*)*\)
numero  {unsigned_int}|{signed_int}|{unsigned_float}|{signed_float}
begin (abre)\n
end (fecha)\n
outro	.

%%
ler       {printf("LER\n");}
imprimir  {printf("IMPRIMIR\n");}
{begin}	  {printf("INICIO\n");}
{end}	  {printf("END\n");}
{id}	  {printf("ID\n");}
{operador} {printf("OPERADOR\n");}
{numero}  {printf("NUM: %s , valor %d\n", yytext, atoi( yytext ));}
{comment} {printf("COMMENT\n");}
[ \t\n]+  {;}
{outro}		{printf("OUTRO\n");}
%%

int yywrap ();
main() {
  yylex(); /* scanner gerado por Flex */
}

int yywrap() {
 return 1;
}
