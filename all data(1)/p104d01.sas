data work.NewSalesEmps;
   length First_Name $ 12 Last_Name $ 18
          Job_Title $ 25;
   infile 'newemps.csv' dlm=',';
   input First_Name $ Last_Name $  
         Job_Title $ Salary;
run;

proc contents data=work.NewSalesEmps;
run;
