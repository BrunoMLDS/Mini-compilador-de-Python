parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial
code
    : (stat | condicional)* EOF
    ;

// 2. Linhas isoladas
stat
    : (expr | query) NEWLINE
    | NEWLINE
    ;

// 3. Estrutura Condicional
condicional
    : IF query COLON NEWLINE stat+ (ELIF query COLON NEWLINE stat+)* (ELSE COLON NEWLINE stat+)?
    ;

// 4. Expressões Matemáticas e Atribuição
expr
    : ID ASSIGN expr                          # atribuicaoRule
    | ID                                      # ids
    | NUMBER                                  # numeros
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoes
    | LPAREN expr RPAREN                      # expressoesEntreParenteses
    ;

// 5. Queries Booleanas
query
    : (TRUE | FALSE)                               # valoresBooleanos
    | query (AND | OR) query                       # operacoesBooleanasEntreQuerys
    | LPAREN query RPAREN                          # queryEntreParenteses
    | expr (EQ | NEQ | GT | LT | GTE | LTE) expr   # relacoesEntreExpressoes
    ;