*** s107d11 ***; 
libname test '.'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* z/OS mainframe */
proc sql;
   create view test.Level_II as
      select Employee_ID, Gender, 
             Job_Title as Title
         from test.Staff
         where scan(Job_Title,-1) ='II'
	           and Emp_Term_Date is missing
;
   select * 
      from test.Level_II;
quit;
proc sql;
   select * 
      from orion.Level_II;
quit;
libname test clear;
