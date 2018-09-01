%{
#include <stdio.h>

// ---- functions area
void abrir();
void fechar();

%}
id	[a-zA-Z][a-zA-Z0-9]*\n
digito   [0-9]
unsigned_int    {digito}+\n
signed_int  [+-]{unsigned_int}
unsigned_float  {digito}*"."{digito}+\n|{digito}+"."{digito}*\n
signed_float    [+-]{digito}+"."{digito}*\n
comment "(""*".*"*"")"\n
numero  {unsigned_int}|{signed_int}|{unsigned_float}|{signed_float}
begin "abre"\n
end "fecha"\n
outro	.*\n
%%
{begin}		{abrir();}
{end}		{fechar();}
{id}		{printf("LOG: Identificador\n");}
{numero}    {printf("LOG: Numero\n");}
{comment}   {printf("LOG: Comentario\n");}
{outro}		{printf("LOG: :-(\n");}
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

void abrir() {
	printf("LOG: Abrir. (abrir o que?)\n");			
}

void fechar() {
	printf("LOG: Encerrando...\n");
	exit(1);				
}
