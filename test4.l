%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[A-ZÑ&]{3,4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])[A-Z0-9]{3}$   {printf("Reconocido como RFC \n");}
%%
int main()
{

	return yylex();
}