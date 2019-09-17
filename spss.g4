
grammar spss;

NUMBER:     [0-9]+;
WHITESPACE: [ \r\n\t]+ -> skip;

// Rules

stmt_list
    : stmt_list stmt
    | stmt
    ;

stmt
    : missing_stmt
    | string_stmt
    | compute_stmt
    | do_stmt
    ;

string_stmt
    : 'string' '=' '(' ident ')'
    ;

missing_stmt
    :
    'missing' 'val' 'all' '(' ')'
    ;

compute_stmt
    : 'compute' ident '=' expr_list
    ;

do_stmt
    :
    'do

expr_list
   : expr_list ',' expr
   | expr
   ;

expr
   : expr op factor
   | factor
   ;

op
   : '+'
   | '-'
   ;

ident
   : ID
   ;

ID
   : ('a' .. 'z' | 'A' .. 'Z')+
   ;

NUMBER
   : ('0' .. '9')+
   ;

WS
   : [ \r\n] -> skip
   ;