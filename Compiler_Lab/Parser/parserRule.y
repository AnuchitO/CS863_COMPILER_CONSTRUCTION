
%{
#include <iostream>
#include <string>
#include <vector>
#include "AST.h"

using namespace std;
using namespace adb;


#ifndef yyscan_t
#define yyscan_t void*
#endif
#include "parserRule.tab.hpp"

int yyerror (adb::ast*, yyscan_t yyscanner, const char*);
int yylex (YYSTYPE * yylval_param , yyscan_t yyscanner);

%}

%pure_parser

%parse-param {adb::ast *ir}
%parse-param {yyscan_t yyscanner}
%lex-param {yyscan_t yyscanner}

%union{
  char* charstr;
  int   num;
}

%token <int> INT
%token <charstr> ID
%token ADDRBOOK
%token OPEN_BRACES
%token CLOSE_BRACES
%token OPEN_CURLY_BRACKETS
%token CLOSE_CURLY_BRACKETS
%token NAME
%token COL

%%
program :ADDRBOOK OPEN_BRACES ID CLOSE_BRACES OPEN_CURLY_BRACKETS list CLOSE_CURLY_BRACKETS {ir->setname($3);}
list : NAME COL ID {cout << $3 << endl ;}

%%
int yyerror (adb::ast* ir, yyscan_t yyscanner, const char* msg)
{
 	std::cout << msg << std::endl;
  return 0;
}
