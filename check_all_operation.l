/* Assignment :
Write a LEX program s*/

%{
	#include<stdio.h>
	int keyword = 0, 
	cmnt = 0, 
	A_op = 0, 
	R_op = 0,
	As_op=0,
	U_op=0, 
	L_op=0,
	pre =0,
	func =0,
	number=0,
	id=0; 
	
%}
%%
auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|const|short|float|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while     {keyword++; printf("\"%s\" is a keyword\n\n",yytext);}


"#".*"\n" {pre++; printf("\"%s\" is a preprocessor directive\n\n",yytext);}


"/*".*("\n")*.*"*/"   {cmnt++;printf("\"%s\" is a multi line comment\n\n",yytext);}

[ \t]*"//".*"\n"  {cmnt++;printf("\"%s\" is a single line comment\n\n",yytext);}




"+"|"-"|"*"|"/"|"+="|"-="|"*="|"/="|"%" {A_op++;printf("\"%s\" is a arithmatic operator\n\n",yytext);}



"++"|"--" {U_op++;printf("\"%s\" is unary operator\n\n",yytext);}



"<"|">"|"=="|">="|"<="|"!=" {R_op++;printf("\"%s\" is a relational operator\n\n",yytext);}



([^><]"=") {As_op++;printf("\"%s\" is a assignment operator\n\n",yytext);}



"||"|"&&"|"!" {L_op++;printf("\"%s\" is a logical operator\n\n",yytext);}

"main(".*")"|"printf(".*")"|"scanf(".*")"  {func++; printf("\"%s\" is a function\n\n",yytext);}

[+-]?[0-9]+[.]?[0-9]* {number++; printf("\"%s\" is a number\n\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {	id++; 
				printf("\"%s\" is identifier\n\n",yytext);
			}


 
.|"\n" { ;} 

%%


int main(){

	yyin = fopen("input.c","r");
	yylex();
	printf("The no. of Preprocessors is: %d\n",pre);
	printf("The no. of Keywords is: %d\n",keyword);
	printf("The no. of comments is: %d\n",cmnt);
        printf("The no. of Arithmatic operator is: %d\n",A_op);
 	printf("The no. of Unary operator is: %d\n",U_op);
	printf("The no. of Relational operator is: %d\n",R_op);
	printf("The no. of Assignment operator is: %d\n",As_op);
	printf("The no. of Logical operator is: %d\n",L_op);
	printf("The no. of Function is: %d\n",func);
	printf("The no. of Numbers is: %d\n",number);
	printf("The no. of Identifiers is: %d\n",id);
	return 0;
}
int yywrap()
{ return 1;
}