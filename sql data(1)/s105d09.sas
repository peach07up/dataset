*** s105d09 ***;

%include "s105d00a.sas" /source2; /* Windows and Unix */
*%include ".WORKSHOP.SASCODE(S105D00A)" /source2; /* z/OS mainframe */
proc sql;
select * 
   from one full join two
   on one.x = two.x;
quit;
