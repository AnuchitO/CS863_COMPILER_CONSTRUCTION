#if !defined(AST_H)
#define AST_H

#include <vector>
#include <iostream>

using namespace std;

namespace adb{

	class ast{
		/**
		* Output stream displaying the content of this ASTNode object
		*/
		friend ostream& operator<<(ostream& s, ast obj);

	public:
		/**
		* default constructor
		*/
		ast();

		/**
		* copy constructor
		*/
		ast(const ast&);

		/**
		* default destructor
		*/
		~ast();

		/**
		* assignment operator
		*/
		ast& operator=(const ast&);

	void setname(string s);
	void setSize(int i){count=i;};

	private:
		string name;
		int count;
	};


}



#endif // AST_H
