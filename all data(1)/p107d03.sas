data work.subset3;
   length First_Name $ 12 Last_Name $ 18 
          Gender $ 1 Job_Title $ 25 
          Country $ 2;
   infile 'sales.csv' dlm=',';
   input Employee_ID First_Name $ Last_Name $ 
         Gender $ Salary Job_Title $ Country $ 
         Birth_Date :date. 
         Hire_Date :mmddyy.;
run;

proc print data=work.subset3;
run;
