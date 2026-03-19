%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[a-zA-Z]{1}[a-zA-Z0-9_]+$		{printf("Reconocido como VARIABLE \n");}
%%
int main()
{

	return yylex();
}
