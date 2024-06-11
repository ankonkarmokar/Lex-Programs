/* Lex program to identify whether a given sentence is simple, complex or compound */
/* Definition Section */
%{
	#include<stdio.h>
	int flag=0;
%}

/*Rules Section */
%%

and|or|but|if|then|nevertheless  { flag=1; }
although|Although|because|Because|before|Before|even|Even|though|Though|if|If|since|Since|until|Until|when|When { flag=2; }
.  {}
\n { return 0; }

%%

int main()
{
	printf("Enter the sentence:\n");
	yylex();
	if(flag==0)
		printf("Simple sentence\n");
	else if(flag==1)
		printf("compound sentence\n");
	else
		printf("Complex sentence\n");
}

int yywrap( )
{
	return 1;
}
