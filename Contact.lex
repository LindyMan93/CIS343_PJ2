%{

/********************************************************************/
/*  Contact.lex                                                      */
/*  Authors:                                                        */
/*      Derrik Fleming                                              */
/*      Nathan Lindenbaum                                           */ 
/********************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include "Contact.tab.h"

%}

%%

[A-Z][a-z]+                       {printf("Name: %s\n", yytext); yylval.sVal = yytext; return NAME;}
[2-9][0-9]{2}-[0-9]{4}            {printf("Phone"); yylval.sVal = yytext; return PHONE;} 
[1-9][0-9]{3}                     {printf("sNumber"); yylval.iVal = atoi(yytext); return STREET_NUM;} 
[a-z]+			 	  {printf("sName"); yylval.sVal = yytext; return STREET_NAME;} 
[DR|RD|AV]			  {printf("sType"); yylval.sVal = yytext; return STREET_TYPE;} 
[0-9]{5}			  {printf("Zip"); yylval.iVal = atoi(yytext); return ZIPCODE;} 

[ \t\n]				  ;
.				  {printf("Unexpected input!\n");}

%%
int yywrap(void) {
	return 1;
}
