%option noyywrap
%{
	#include<stdio.h>
%}

%%
^[a-z]{2}[0-9]{6}"@uaeh.edu.mx"$	{printf("Reconocido como CORREO INSTITUCIONAL \n");}
%%
int main()
{

	return yylex();
}
