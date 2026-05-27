lexer grammar PythonLexer;

// ==========================================
// 1. TOKENS DE SÍMBOLOS (OPERADORES E AFINS)
// ==========================================

// Contas (Aritméticos)
PLUS     : '+' ;
MINUS    : '-' ;
MULT     : '*' ;
DIV      : '/' ;
IDIV     : '//' ;
MOD      : '%' ;
POW      : '**' ;

// Comparações (Relacionais)
EQ       : '==' ;
NEQ      : '!=' ;
GT       : '>' ;
LT       : '<' ;
GTE      : '>=' ;
LTE      : '<=' ;

// Bits (Bitwise)
BIT_AND  : '&' ;
BIT_OR   : '|' ;
BIT_XOR  : '^' ;
BIT_NOT  : '~' ;

// Atribuições
ASSIGN   : '=' ;
ADD_ASSIGN  : '+=' ;
SUB_ASSIGN  : '-=' ;
MULT_ASSIGN : '*=' ;
DIV_ASSIGN  : '/=' ;

// Identificadores de Tipos e Blocos
SQUOTE   : '\'' ;
DQUOTE   : '"' ;
LBRACK   : '[' ;
RBRACK   : ']' ;
LBRACE   : '{' ;
RBRACE   : '}' ;
LPAREN   : '(' ;
RPAREN   : ')' ;
COLON    : ':' ;

// ==========================================
// 2. TOKENS DE PALAVRAS-CHAVE (KEYWORDS)
// ==========================================

// Mandar nos Blocos
IF       : 'if' ;
ELIF     : 'elif' ;
ELSE     : 'else' ;
FOR      : 'for' ;
WHILE    : 'while' ;
DEF      : 'def' ;
CLASS    : 'class' ;

// Tipos de Dados
INT_TYPE   : 'int' ;
FLOAT_TYPE : 'float' ;
STR_TYPE   : 'str' ;
BOOL_TYPE  : 'bool' ;
LIST_TYPE  : 'list' ;
DICT_TYPE  : 'dict' ;
TUPLE_TYPE : 'tuple' ;

// Funções Nativas (Built-in)
PRINT    : 'print' ;
INPUT    : 'input' ;
LEN      : 'len' ;
RANGE    : 'range' ;
TYPE     : 'type' ;

// Palavras Lógicas
AND      : 'and' ;
OR       : 'or' ;
NOT      : 'not' ;

// O Resto das Palavras
IMPORT   : 'import' ;
FROM     : 'from' ;
IN       : 'in' ;
AS       : 'as' ;
RETURN   : 'return' ;
PASS     : 'pass' ;
BREAK    : 'break' ;
CONTINUE : 'continue' ;

// Valores Booleanos
TRUE     : 'True' ;
FALSE    : 'False' ;


// =================================================================
// 3. REGRAS OBRIGATÓRIAS NO FINAL DO ARQUIVO (EXATAMENTE NESTA ORDEM)
// =================================================================

// Identificadores (Nomes de variáveis/funções: começam com letra/underscore)
ID : (LETTER | '_') (LETTER | DIGIT | '_')* ;

// Letras (Maiúsculas e Minúsculas)
fragment LETTER : [a-zA-Z] ;

// Dígitos (Números de 0 a 9)
fragment DIGIT : [0-9] ;

// Para reconhecer números reais no código (ex: 10, 5, 42)
NUMBER : DIGIT+ ;

// Detetar a quebra de linha
NEWLINE : '\r'? '\n' ;

// WS -> skip (Ignorar espaços em branco, tabs e quebras de linha)
WS : [ \t]+ -> skip ;