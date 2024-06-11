/*Lex program to count the characters, words, spaces and lines in a given input*/
/*Definition Section*/
%{
	#include<stdio.h>
	int ch=0;
	int word=0;
	int space=0;
	int line=0;
	int others = 0;
%}

/*Rules Section*/
%%

[a-zA-Z] {ch++; printf("%s is a character\n",yytext);}

[a-zA-Z][a-zA-Z]* {word++; printf("%s is a word\n",yytext);}

" " {space++; printf("%s space\n",yytext);}

"\n" {line++; printf("%s new line\n",yytext);}
. {others++;}

%%
/*Main Section*/
int main()
{
	yyin = fopen("input.c","r");
	yylex();
	printf("char is %d,\nword is %d,\nspace is %d,\nline is %d",ch,word,space,line);
	return 0;
}
int yywrap()
{
return 1;
}