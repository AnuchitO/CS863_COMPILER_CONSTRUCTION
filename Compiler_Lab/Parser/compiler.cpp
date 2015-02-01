#include <iostream>
#include "AST.h"

using namespace std;
using namespace adb;

#ifndef yyscan_t
#define yyscan_t void*
#endif
#include "parserRule.tab.hpp"
#include <cstdio>

extern int yyparse (adb::ast *ptcl, yyscan_t yyscanner);
extern int yylex_init(yyscan_t* ptr_yy_globals);
extern int yylex_destroy( yyscan_t yyscanner ) ;
extern void yyset_in ( FILE * in_str , yyscan_t scanner );

int main(int argc,char *argv[])
{
  ast* ir;

  yyscan_t scanner;

  ir = new adb::ast;


  FILE* inf;

  if (argc != 2){
    cerr << "Usage:" << argv[0] << " input_file_name" << endl;
    return 1;
  }
  else {
    if ((inf = fopen(argv[1],"r")) == NULL) {
        cerr << "Can't open input file" << argv[1] << endl ;
        return 1;
    }
  }

  yylex_init(&scanner);
  yyset_in(inf, scanner);
  yyparse(ir, scanner); 


    yylex_destroy (scanner) ;

  cout << *ir;

  return 0;
}
