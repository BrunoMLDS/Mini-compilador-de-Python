parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial atualizada com as funções e o loop while
code
    : (stat | condicional | func | func_call | loop_while)* EOF
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

// 4. REGRAS NOVAS (Fase 6): Definição e Chamada de Funções
func
    : DEF ID LPAREN RPAREN COLON NEWLINE stat+                  # definicaoFuncaoRule
    ;

func_call
    : ID LPAREN RPAREN                                          # chamadaFuncaoRule
    ;

// 5. REGRA NOVA (Fase 6.5): Estrutura de Repetição While
loop_while
    : WHILE query COLON NEWLINE stat+                           # whileLoopRule
    ;

// 6. Expressões Matemáticas e Atribuição (Atualizado para incluir func_call!)
expr
    : ID ASSIGN expr                          # atribuicaoRule
    | func_call                               # chamadaFuncaoNaExprRule
    | ID                                      # idsRule
    | NUMBER                                  # numerosRule
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoesRule
    | LPAREN expr RPAREN                      # expressoesEntreParentesesRule
    ;

// 7. Queries Booleanas / Lógica (Fase 4)
query
    : (TRUE | FALSE)                               # valoresBooleanosRule
    | query (AND | OR) query                       # operacoesBooleanasRule
    | LPAREN query RPAREN                          # queryEntreParentesesRule
    | expr (EQ | NEQ | GT | LT | GTE | LTE) expr   # relacoesEntreExpressoesRule
    ;