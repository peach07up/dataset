proc transpose 
     data=orion.employee_donations 
     out=rotate2 (rename=(col1=Amount))
     name=Period;
   by employee_id;
run;

proc freq data=rotate2;
   tables Period/nocum nopct;
   label Period=" ";
run;
