/*Lex program to identify integer,float,exponential number*/
/*definition part*/
%{
	#include<stdio.h>
	int in=0;
	int flt=0;
	int expp=0;
	int others=0;
%}

/*Rules Part*/
%%

[+-]?[0-9]+ {
in++; 
printf("%s is integer\n",yytext);
}

[+-]?[0-9]*"."[0-9]+ {
flt++; 
printf("%s is float\n",yytext);
}

[+-]?[0-9]+[Ee][-+]?[0-9]+ {
expp++; 
printf("%s is exponentital\n",yytext);
}

. {others++;}
%%

/*Main part*/
int main()
{
	yyin=fopen("demo.txt","r");
	yylex();		
	return 0;
}
int yywrap()
{
	return 1;
}