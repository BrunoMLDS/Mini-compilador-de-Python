parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial atualizada com as funções, o while e agora o for
code
    : (stat | condicional | func | func_call | loop_while | loop_for)* EOF
    ;

// 2. Linhas isoladas
stat
    : (expr | query) NEWLINE
    | NEWLINE
    ;

// 3. Estrutura Condicional (Fase 5)
condicional
    : IF query COLON NEWLINE stat+ (ELIF query COLON NEWLINE stat+)* (ELSE COLON NEWLINE stat+)?
    ;

// 4. Estruturas de Repetição (Fases 6.5 e 6.75)
loop_while
    : WHILE query COLON NEWLINE stat+                           # whileLoopRule
    ;

loop_for
    : FOR ID IN expr COLON NEWLINE stat+                        # forLoopRule
    ;

// 5. Funções (Fase 6)
func
    : DEF ID LPAREN RPAREN COLON NEWLINE stat+                  # definicaoFuncaoRule
    ;

func_call
    : ID LPAREN RPAREN                                          # chamadaFuncaoRule
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