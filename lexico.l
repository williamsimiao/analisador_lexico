%{
#include <stdio.h>
%}
id	[a-zA-Z][a-zA-Z0-9]*\n
teste [0-9][a-zA-Z]*\n
digito   [0-9]
unsigned_int    {digito}+\n
signed_int  [+-]{unsigned_int}
unsigned_float  {digito}*"."{digito}+\n|{digito}+"."{digito}*\n
signed_float    [+-]{digito}+"."{digito}*\n
comment "(""*".*"*"")"\n
numero  {unsigned_int}|{signed_int}|{unsigned_float}|{signed_float}
outro	.*\n
%%
{id}		{printf("Identificador\n");}
{teste} 	{printf("Teste\n");}
{numero}    {printf("numero\n");}
{comment}   {printf("Comentario\n");}
{outro}		{printf(":-(\n");}
%%
/* recomendavel declarar sempre
   funcao yywrap() */
int yywrap ();

/* programa principal */
main() {
  yylex(); /* scanner gerado por Flex */
}

int yywrap() {
 return 1;
}
