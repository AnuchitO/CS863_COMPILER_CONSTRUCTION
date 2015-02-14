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
[\n\r\t] {}
":"		{return COL;}
"("  	{return OPEN_BRACES;}
")" 	{return CLOSE_BRACES;}
"{" 	{return OPEN_CURLY_BRACKETS;}
"}" 	{return CLOSE_CURLY_BRACKETS;}
"name"	{return NAME;}
"AddressBook" {return ADDRBOOK;}

{DIGIT}+		{
			yylval_param->num = atoi(strdup(yytext));
			return INT;}
({CHAR}|_)({CHAR}|_|{DIGIT})*	{
			yylval_param->charstr = strdup(yytext);
			return ID;}



%%