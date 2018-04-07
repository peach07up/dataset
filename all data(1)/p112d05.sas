proc means data=orion.sales;
run; 

********** VAR Statement **********;
proc means data=orion.sales;
   var Salary;
run; 

********** CLASS Statement **********;
proc means data=orion.sales;
   var Salary;
   class Gender Country;
run;

********** Additional Statements **********;
proc format;
   value $ctryfmt 'AU'='Australia'
                  'US'='United States';
run;

options nodate pageno=1;

ods html file='p112d05.html';
proc means data=orion.sales;
   var Salary;
   class Gender Country;
   where Job_Title contains 'Rep';
   format Country $ctryfmt.;
   title 'Sales Rep Summary Report';
run;
ods html close;

********** PROC MEANS Statisctics **********;
proc means data=orion.sales sum mean range;
   var Salary;
   class Country;
run;

********** PROC MEANS Statement Options **********;
proc means data=orion.sales maxdec=0;
   var Salary;
   class Country;
run;

proc means data=orion.sales maxdec=1;
   var Salary;
   class Country;
run;

proc means data=orion.sales;
   var Salary;
   class Country;
run;

proc means data=orion.sales fw=15;
   var Salary;
   class Country;
run;

proc means data=orion.sales nonobs;
   var Salary;
   class Country;
run;

proc means data=orion.sales noprint;
   var Salary;
   class Country;
   output out=work.means;
run;
