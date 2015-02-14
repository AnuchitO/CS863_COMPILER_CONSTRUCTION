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
<<<<<<< HEAD
"("  	{return ORB;}
")" 	{return CRB;}
"{" 	{return OP;}
"}" 	{return CP;}
"="		{return EQ;}
";" 	{return SEM;}
"+" 	{return ADD;}
"if"	{return IF;}

{DIGIT}		{
			yylval_param->num = atoi(strdup(yytext));
			return INT;}
[a-c|i-k|n|x|y|z]	{
=======
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
>>>>>>> e8a02d5c73238ab1286a26ee060605f1267a0b1a
			yylval_param->charstr = strdup(yytext);
			return ID;}



%%