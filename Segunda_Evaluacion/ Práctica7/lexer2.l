%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser2.tab.h"
%}

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser2.tab.h"
%}

/* Activa el conteo automático de líneas */
%option yylineno

DIGITO [0-9]
ID     [a-zA-Z][a-zA-Z0-9]*

%%
"if"        { return IF; }
"then"      { return THEN; }
"while"     { return WHILE; }
"for"       { return FOR; }
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }

{DIGITO}+ { yylval.num = atof(yytext); return ENTERO;}

{DIGITO}+"."{DIGITO}+ { yylval.num = atof(yytext); return DECIMAL;}

{ID} { yylval.id = strdup(yytext);  return ID;}

">="        { return MAI; }
"<="        { return MEI; }
"=="        { return EQ; }
"!="        { return DIF; }
">"         { return MAQ; }
"<"         { return MEQ; }

"+"         { return SUMA; }
"-"         { return RESTA; }
"*"         { return MULTI; }
"/"         { return DIVI; }
"="         { return ASIG; }

"{"         { return L_CORCHETE; }
"}"         { return R_CORCHETE; }
":"         { return COLON; }
"("         { return P_I; }
")"         { return P_D; }
";"         { return P_COMA; }

[ \t\r\n]   {  }

. {
    printf("Error léxico en línea %d: Carácter no reconocido '%s'\n", yylineno, yytext);
}

%%

int yywrap(void) {
    return 1;
}
