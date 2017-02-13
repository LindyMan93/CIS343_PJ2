%code top {
/********************************************************************/
/*  Contact.y                                                       */
/*  Authors:                                                        */
/*      Derrik Fleming                                              */
/*      Nathan Lindenbaum                                           */ 
/********************************************************************/

#include <stdio.h>
int yylex (void);
int yyerror(char* msg);
}
%union{
	int iVal;
	char *sVal;
}

%start file 				/* Not sure about this part */
%token NAME
%type<sVal> NAME
%token PHONE
%type<sVal> PHONE
%token EMAIL
%type<sVal> EMAIL
%token STREET_NUM
%type<iVal> STREET_NUM
%token STREET_NAME
%type<sVal> STREET_NAME
%token STREET_TYPE
%type<sVal> STREET_TYPE
%token ZIPCODE
%type<iVal> ZIPCODE
%type<sVal> contact



%%
file:			contact
                      |	contact file
;
contact:	     NAME NAME STREET_NUM STREET_NAME STREET_TYPE ZIPCODE;
%%
int main(void){
	yyparse();
	printf("Your Contact has been set");
}
int yyerror (char *msg) {
	return fprintf (stderr, "YACC: %s\n", msg);
}