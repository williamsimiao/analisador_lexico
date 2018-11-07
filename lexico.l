%{
#include <stdio.h>

// EXPRESSÃO REGULAR DO TOKEN 'COMMENT': \(\*C*\*((C'C*\*)|\*)*\)
// Notação:
// 		\* -> Caracter asterisco.
//		* -> Operador estrela.
//		\( -> Caracter '('

enum tokens{LER, IMPRIMIR, INICIO, END, NUM, COMMENT, OUTRO, ID};

%}
id	[a-zA-Z][a-zA-Z0-9]*
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
outro	.*

%%
ler       {printf("LER\n"); return LER;}
imprimir  {printf("IMPRIMIR\n"); return IMPRIMIR;}
{begin}	  {printf("INICIO\n"); return INICIO;}
{end}	  {printf("END\n"); return END;}
{id}	  {printf("ID\n"); return ID;}
{numero}  {printf("NUM\n"); return NUM;}
{comment} {printf("COMMENT\n"); return COMMENT;}
[ \t\n]+  {;}
{outro}		{printf("OUTRO\n"); return yytext[0];}
%%

int yywrap ();
main() {
  yylex(); /* scanner gerado por Flex */
}

int yywrap() {
 return 1;
}
