
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
%token EQ
%token SEM

%token ORB
%token CRB
%token OP
%token CP
%token COL
%token ADD
%token IF

%%
program 	: statement {cout << "statement" << endl;} 
			| program statement {cout << "program statement" << endl;} 
			;

statement 	: assignStmt {cout << "assignStmt" << endl;} 
			| ifStmt {cout << "ifStmt" << endl;} 
			;

assignStmt 	: ID EQ expr SEM {cout << "ID EQ expr SEM" << endl;}
			;

ifStmt 		: IF ORB expr CRB statement {cout << "IF ORB expr CRB statement" << endl;}
			;

expr 		: ID {cout << "ID" << endl;}
			| INT {cout << "INT" << endl;}
			| expr ADD expr {cout << "expr ADD expr" << endl;}
			;


%%
int yyerror (adb::ast* ir, yyscan_t yyscanner, const char* msg)
{
 	std::cout << msg << std::endl;
  return 0;
}
