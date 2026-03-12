%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z]+[0-9]+ {printf("reconocido como ID\n");}

[0-9]+		{printf("reconocido como NUMERO\n");}
%%
int main()
{

	return yylex();
}

