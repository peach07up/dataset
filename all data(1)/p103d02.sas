*----------------------------------------*
|   This program creates and uses the    |
|   data set called work.NewSalesEmps.   |
*----------------------------------------*; 

data work.NewSalesEmps;
   length First_Name $ 12 Last_Name $ 18
          Job_Title $ 25;
   infile 'newemps.csv' dlm=',';
   input First_Name $ Last_Name $  
         Job_Title $ Salary /*numeric*/;
run;

/*
proc print data=work.NewSalesEmps;
run;
*/

proc means data=work.NewSalesEmps;
   *class Job_Title;
   var Salary;
run;
