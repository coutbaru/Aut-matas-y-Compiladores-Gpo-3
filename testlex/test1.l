%option noyywrap
%{
	#include<stdio.h>
%}

%%

^[0-9]+$		{printf("Reconocido como NUMERO entero \n");}

%%
int main()
{

	return yylex();
}
