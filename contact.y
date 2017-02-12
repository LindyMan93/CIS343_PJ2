%code top {
/********************************************************************/
/*  Contact.y 														*/
/*	Authors:														*/
/*		Derrik Fleming												*/
/*		Nathan Lindenbaum											*/ 
/********************************************************************/

#include <stdio.h>
}
%union{
	int iVal;
	char *sVal;
}

%start contactlist 				/* Not sure about this part */
%token NAME
%type<sVal> NAME
%token PHONE
%type<sVal> PHONE
%token EMAIL
type<sVal> EMAIL
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
contactlist:		contact
|					contact contactlist
;
contact:			

%%
int main(void){
	yyparse();
}

int yyerror (char *msg) {
	return fprintf (stderr, "YACC: %s\n", msg);
}