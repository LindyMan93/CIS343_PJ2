%{
/********************************************************************/
/*  Contact.l                                                       */
/*  Authors:                                                        */
/*      Derrik Fleming                                              */
/*      Nathan Lindenbaum                                           */ 
/********************************************************************/
#include <stdio.h>
#include "contact.h"


%}

%%
[A-Z][a-z]*[-][A-Z][a-zA-Z]*	{ return NAME; } /* not sure what to do here */
[2-9][0-9]{2}[-][0-9]{4}		{ return PHONE; }
[1-9][0-9]{3}					{ return STREET_NUM; }
[A-Z][a-z]*						{ return STREET_NAME; }
[A-Z][a-z]"."					{ return STREET_TYPE; }
[0-9]{5}						{ return ZIPCODE; }

[ \t\n]							;
.								printf("Unexpected input!\n");

%%
