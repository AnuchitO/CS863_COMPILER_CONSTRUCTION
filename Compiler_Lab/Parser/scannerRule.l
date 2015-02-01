%{
#include <iostream>
#include <string>
#include "AST.h"
#include "parserRule.tab.hpp"
using namespace std;

%}

%option never-interactive bison-bridge reentrant noyywrap
 


DIGIT    [0-9]
CHAR     [A-Za-z]

%%
[\/\/].*[\n\r]?		{}
[ \r\t\c] {}
":"		{return COL;}
"("  	{return ORB;}
")" 	{return CRB;}
"{" 	{return OP;}
"}" 	{return CP;}
"="		{return EQ;}
";" 	{return SEM;}
"+" 	{return ADD;}
"if"	{return IF;}

{DIGIT}		{
			yylval_param->num = atoi(_strdup(yytext));
			return INT;}
[a-c|i-k|n|x|y|z]	{
			yylval_param->charstr = _strdup(yytext);
			return ID;}



%%