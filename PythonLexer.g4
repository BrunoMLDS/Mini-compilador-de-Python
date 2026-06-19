lexer grammar PythonLexer;

// ==========================================
// OPERADORES E SÍMBOLOS
// ==========================================

PLUS     : '+' ;
MINUS    : '-' ;
MULT     : '*' ;
DIV      : '/' ;
IDIV     : '//' ;
MOD      : '%' ;
POW      : '**' ;

EQ       : '==' ;
NEQ      : '!=' ;
GT       : '>' ;
LT       : '<' ;
GTE      : '>=' ;
LTE      : '<=' ;

BIT_AND  : '&' ;
BIT_OR   : '|' ;
BIT_XOR  : '^' ;
BIT_NOT  : '~' ;

ASSIGN   : '=' ;
ADD_ASSIGN  : '+=' ;
SUB_ASSIGN  : '-=' ;
MULT_ASSIGN : '*=' ;
DIV_ASSIGN  : '/=' ;

SQUOTE   : '\'' ;
DQUOTE   : '"' ;
LBRACK   : '[' ;
RBRACK   : ']' ;
LBRACE   : '{' ;
RBRACE   : '}' ;
LPAREN   : '(' ;
RPAREN   : ')' ;
COLON    : ':' ;
COMMA    : ',' ; // <- NOVO: Necessário para separar elementos de listas/dicts

// ==========================================
// PALAVRAS-CHAVE (KEYWORDS)
// ==========================================

IF       : 'if' ;
ELIF     : 'elif' ;
ELSE     : 'else' ;
FOR      : 'for' ;
WHILE    : 'while' ;
DEF      : 'def' ;
CLASS    : 'class' ;

INT_TYPE   : 'int' ;
FLOAT_TYPE : 'float' ;
STR_TYPE   : 'str' ;
BOOL_TYPE  : 'bool' ;
LIST_TYPE  : 'list' ;
DICT_TYPE  : 'dict' ;
TUPLE_TYPE : 'tuple' ;

PRINT    : 'print' ;
INPUT    : 'input' ;
LEN      : 'len' ;
RANGE    : 'range' ;
TYPE     : 'type' ;

AND      : 'and' ;
OR       : 'or' ;
NOT      : 'not' ;

IMPORT   : 'import' ;
FROM     : 'from' ;
IN       : 'in' ;
AS       : 'as' ;
RETURN   : 'return' ;
PASS     : 'pass' ;
BREAK    : 'break' ;
CONTINUE : 'continue' ;

TRUE     : 'True' ;
FALSE    : 'False' ;

// ==========================================
// REGRAS ESTRUTURAIS FINAIS
// ==========================================

ID : (LETTER | '_') (LETTER | DIGIT | '_')* ;
NUMBER : DIGIT+ ;

// NOVO: Padrão STRING (aceita aspas duplas ou simples e texto lá dentro)
STRING : '"' (~["\r\n])* '"' | '\'' (~['\r\n])* '\'' ;

fragment LETTER : [a-zA-Z] ;
fragment DIGIT : [0-9] ;

NEWLINE : '\r'? '\n' ;
WS : [ \t]+ -> skip ;