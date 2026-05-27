parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial: o código é um conjunto de várias linhas (stat) até ao fim do ficheiro (EOF)
code
    : stat* EOF
    ;

// 2. Cada linha (stat) é uma expressão seguida de uma quebra de linha
stat
    : expr NEWLINE
    ;

// 3. Regras para as Expressões
expr
    : ID                                      # ids
    | NUMBER                                  # numeros
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoes
    | LPAREN expr RPAREN                      # expressoesEntreParenteses
    ;