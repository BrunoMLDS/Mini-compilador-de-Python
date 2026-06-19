parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial ajustada com uma regra genérica de comandos
code
    : command* EOF
    ;

// Regra auxiliar que define o que pode aparecer no fluxo do código
command
    : stat
    | condicional
    | loop_while
    | loop_for
    | func
    ;

// 2. Linhas isoladas simples
stat
    : (expr | query) NEWLINE
    | NEWLINE
    ;

// 3. Estrutura Condicional
condicional
    : IF query COLON NEWLINE command+ (ELIF query COLON NEWLINE command+)* (ELSE COLON NEWLINE command+)?
    ;

// 4. Estruturas de Repetição
loop_while
    : WHILE query COLON NEWLINE command+                        # whileLoopRule
    ;

loop_for
    : FOR ID IN expr COLON NEWLINE command+                     # forLoopRule
    ;

// 5. Funções
func
    : DEF ID LPAREN RPAREN COLON NEWLINE command+               # definicaoFuncaoRule
    ;

// ATUALIZADO: Aceita 'ID()' ou 'print()'
func_call
    : (ID | PRINT) LPAREN RPAREN                                # chamadaFuncaoRule
    ;

// 6. Expressões Matemáticas e Atribuição
expr
    : ID ASSIGN expr                          # atribuicaoRule
    | func_call                               # chamadaFuncaoNaExprRule
    | ID                                      # idsRule
    | NUMBER                                  # numerosRule
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoesRule
    | LPAREN expr RPAREN                      # expressoesEntreParentesesRule
    ;

// 7. Queries Booleanas / Lógica
query
    : (TRUE | FALSE)                               # valoresBooleanosRule
    | query (AND | OR) query                       # operacoesBooleanasRule
    | LPAREN query RPAREN                          # queryEntreParentesesRule
    | expr (EQ | NEQ | GT | LT | GTE | LTE) expr   # relacoesEntreExpressoesRule
    ;