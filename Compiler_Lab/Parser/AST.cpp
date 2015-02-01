#include "AST.h"
#include <string.h>
using namespace std;

namespace adb
{

	ostream & operator << ( ostream & s, ast obj )
	{
		s << "Name (" << obj.name.c_str() << ") contains " 
			<< obj.count << " address(es)" << endl;

		return s;
	};

	ast::ast()
	{
	};

	ast::ast( const ast & p )
	{
		name = p.name;
		count = p.count;
	};


	ast & ast::operator = ( const ast & p )
	{
		name = p.name;
		count = p.count;
		return * this;
	};



	ast::~ast()
	{
	};

	void ast::setname(string s)
	{
		name = s;
	};


};
