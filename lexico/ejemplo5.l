%option noyywrap
%{
	#include<stdio.h>
%}

%%
[a-zA-Z]+[0-9]+ {fprintf(yyout,"reconocido como ID\n");}

[0-9]+		{fprintf(yyout,"reconocido como NUMERO\n");}


%%
int main()
{

    yyin = fopen("C:\\Users\\Baruchs Delgado\\OneDrive\\Desktop\\Entradas.txt", "r");
    yyout = fopen("C:\\Users\\Baruchs Delgado\\OneDrive\\Desktop\\Salidas.txt", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);
    
    return 0;

}
