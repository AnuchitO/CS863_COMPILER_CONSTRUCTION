
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
%token ELSE
%%
program 	: statement {cout << "1.statement" << endl;} 
			| program statement {cout << "2.program statement" << endl;} 
			;

statement 	: assignStmt {cout << "3.assignStmt" << endl;} 
			| ifStmt {cout << "4.ifStmt" << endl;} 
			;

assignStmt 	: ID EQ expr SEM {cout << "5.ID EQ expr SEM" << endl;}
			;

ifStmt 		: IF ORB expr CRB OP statement CP {cout << "6.IF ORB expr CRB statement" << endl;}
			| IF ORB expr CRB OP statement CP ELSE OP statement CP{cout << "7.IF ORB expr CRB statement ELSE statement" << endl;}
			;

expr 		: ID {cout << "7.ID" << endl;}
			| INT {cout << "8.INT" << endl;}
			| expr ADD expr {cout << "9.expr ADD expr" << endl;}
			;


%%
int yyerror (adb::ast* ir, yyscan_t yyscanner, const char* msg)
{
 	std::cout << msg << std::endl;
  return 0;
}
