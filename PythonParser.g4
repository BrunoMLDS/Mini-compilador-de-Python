parser grammar PythonParser;

options { tokenVocab=PythonLexer; }

// 1. Regra inicial atualizada para aceitar também blocos de repetição
code
    : (stat | condicional | repeticao)* EOF
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

// 4. Estruturas de Repetição (Mapeia o WHILE e o FOR pedidos!)
repeticao
    : WHILE query COLON NEWLINE stat+                          # whileLoopRule
    | FOR ID IN expr COLON NEWLINE stat+                       # forLoopRule
    ;

// 5. Expressões Matemáticas e Atribuição (Fase 3)
expr
    : ID ASSIGN expr                          # atribuicaoRule
    | ID                                      # idsRule
    | NUMBER                                  # numerosRule
    | expr (PLUS | MINUS | MULT | DIV) expr   # operacoesComExpressoesRule
    | LPAREN expr RPAREN                      # expressoesEntreParentesesRule
    ;

// 6. Queries Booleanas / Lógica (Fase 4)
query
    : (TRUE | FALSE)                               # valoresBooleanosRule
    | query (AND | OR) query                       # operacoesBooleanasRule
    | LPAREN query RPAREN                          # queryEntreParentesesRule
    | expr (EQ | NEQ | GT | LT | GTE | LTE) expr   # relacoesEntreExpressoesRule
    ;