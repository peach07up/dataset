*** s105d04a ***;  

proc sql;
   select catx(', ',Last_name,First_name) 
          format=$25. as Name
      from orion.Sales
      where First_name ="John"
;
quit;
