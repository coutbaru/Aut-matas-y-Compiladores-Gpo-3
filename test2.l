%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[0-9]+.[0-9]+$		{printf("Reconocido como NUMERO decimal \n");}
%%
int main()
{

	return yylex();
}