%{
    #include <stdio.h>
    #include <stdlib.h>
    
    extern int yylex();
    extern int yylineno;    
    extern char *yytext;    
    extern FILE *yyin;      
    
    void yyerror(const char *s);
%}

%union {
    float num;
    char *id;
}

%token <num> ENTERO DECIMAL
%token <id> ID
%token IF THEN WHILE FOR SWITCH CASE DEFAULT
%token SUMA RESTA MULTI DIVI ASIG
%token P_I P_D P_COMA DIF MAQ MEQ MAI MEI EQ
%token L_CORCHETE R_CORCHETE COLON

%%

programa:
    lista_instrucciones
    ;

lista_instrucciones:
    instruccion
    | lista_instrucciones instruccion
    ;

instruccion:
    expresion P_COMA          { printf("Línea %d: Expresión matemática correcta.\n", yylineno); }
    | asignacion P_COMA       { printf("Línea %d: Asignación de variable correcta.\n", yylineno); }
    | estructura_if           { printf("Línea %d: Estructura IF correcta.\n", yylineno); }
    | estructura_while        { printf("Línea %d: Estructura WHILE correcta.\n", yylineno); }
    | estructura_for          { printf("Línea %d: Estructura FOR correcta.\n", yylineno); }
    | estructura_switch       { printf("Línea %d: Estructura SWITCH correcta.\n", yylineno); }
    | error P_COMA            { yyerrok; }
    ;

asignacion:
    ID ASIG expresion
    ;

estructura_if:
    IF P_I condicion P_D THEN bloque
    ;

estructura_while:
    WHILE P_I condicion P_D bloque
    ;

estructura_for:
    FOR P_I asignacion P_COMA condicion P_COMA asignacion P_D bloque
    ;

estructura_switch:
    SWITCH P_I ID P_D L_CORCHETE lista_casos R_CORCHETE
    ;

lista_casos:
    caso
    | lista_casos caso
    ;

caso:
    CASE ENTERO COLON lista_instrucciones
    | DEFAULT COLON lista_instrucciones
    ;

condicion:
    expresion operador_rel expresion
    ;

operador_rel:
    MAQ | MEQ | MAI | MEI | EQ | DIF
    ;

bloque:
    instruccion
    | L_CORCHETE lista_instrucciones R_CORCHETE
    ;

expresion:
    expresion SUMA termino
    | expresion RESTA termino
    | termino
    ;

termino:
    termino MULTI factor
    | termino DIVI factor
    | factor
    ;

factor:
    P_I expresion P_D
    | ENTERO
    | DECIMAL
    | ID
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error sintáctico en línea %d, cerca de '%s': %s\n", yylineno, yytext, s);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            printf("Error: No se pudo abrir el archivo %s\n", argv[1]);
            return 1;
        }
        printf("--- Analizando el archivo: %s ---\n", argv[1]);
    } else {
        printf("Uso correcto: %s <archivo.txt>\n", argv[0]);
        return 1;
    }
    yyparse();
    
    fclose(yyin);
    printf("--- Análisis finalizado ---\n");
    return 0;
}
