%{
#include <iostream>
#include <string>

using namespace std;
#define YY_NO_UNISTD_H
%}     

%option reentrant stack noyywrap never-interactive

     
%%

"class"                 {cout<<"Found a CLASS\n";}
[a]{3,5}                 {cout<<"Found a ID\n";}
[a-zA-Z]+[0-9]			{cout<<"Found a Go Home\n";}
   
%%
     
int main ( int argc, char * argv[] )
{
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

    yyscan_t scanner;
     
    yylex_init ( &scanner );
	yyset_in(inf, scanner);
    yylex ( scanner );
    yylex_destroy ( scanner );
	return 0;
}
                                                               //Pattamapong Rattanapong 5209650521
