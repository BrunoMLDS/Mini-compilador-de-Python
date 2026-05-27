parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial
code
    : stat* EOF
    ;

// 2. Cada linha agora aceita uma expressão matemática OU uma query booleana
stat
    : (expr | query) NEWLINE
    | NEWLINE
    ;

// 3. Regras para as Expressões Matemáticas
expr
    : ID                                      # ids
    | NUMBER                                  # numeros
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoes
    | LPAREN expr RPAREN                      # expressoesEntreParenteses
    ;

// 4. Estrutura da Query Booleana
query
    : (TRUE | FALSE)                               # valoresBooleanos
    | query (AND | OR) query                       # operacoesBooleanasEntreQueryys
    | LPAREN query RPAREN                          # queryEntreParenteses
    | expr (EQ | NEQ | GT | LT | GTE | LTE) expr   # relacoesEntreExpressoes
    ;