%{

/********************************************************************/
/*  Contact.lex                                                      */
/*  Authors:                                                        */
/*      Derrik Fleming                                              */
/*      Nathan Lindenbaum                                           */ 
/********************************************************************/

#include <stdio.h>
#include "Contact.h"

%}

%%

[A-Z][a-z]+                       {return NAME;}
[2-9][0-9]{2}-[0-9]{4}            {return PHONE;} 
[1-9][0-9]{3}                     {return STREET_NUM;} 
[a-z]+			 	  {return STREET_NAME;} 
[DR|RD|AV]			  {return STREET_TYPE;} 
[0-9]{5}			  {return ZIPCODE;} 

[ \t\n]				  ;
.				  {printf("Unexpected input!\n");}

%%
int yywrap(void) {
	return 1;
}
