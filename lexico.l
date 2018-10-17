%{
#include <stdio.h>

// EXPRESSÃO REGULAR DO TOKEN 'COMMENT': \(\*C*\*((C'C*\*)|\*)*\)
// Notação:
// 		\* -> Caracter asterisco.
//		* -> Operador estrela.
//		\( -> Caracter '('

enum tokens{LER, IMPRIMIR, INICIO, END, NUM, COMMENT, OUTRO, ID};

%}
id	[a-zA-Z][a-zA-Z0-9]*\n
digito   [0-9]
unsigned_int    {digito}+\n
signed_int  [+-]{unsigned_int}
unsigned_float  {digito}*"."{digito}+\n|{digito}+"."{digito}*\n
signed_float    [+-]{digito}+"."{digito}*\n
clinha [a-zA-Z0-9\!\@\#\$\%\&\(\¹\²\³\£\¢\¬\,\<\.\>\;\"\?\·\°\^\~\}\º\{\ª\`\'\"\'\[\]\/\\]
cComParenteses {clinha}|\)
comment  \(\*{cComParenteses}*\*(({clinha}{cComParenteses}*\*)|\*)*\)\n
numero  {unsigned_int}|{signed_int}|{unsigned_float}|{signed_float}
begin (abre)\n
end (fecha)\n
outro	.*\n

%%
ler       {return LER;}
imprimir  {return IMPRIMIR;}
{begin}		{return INICIO;}
{end}		  {return END;}
{id}		  {return ID;}
{numero}  {return NUM;}
{comment} {return COMMENT;}
[ \t\n]+  {;}
{outro}		{return yytext[0];}
%%

int yywrap ();
int yywrap() {
 return 1;
}
