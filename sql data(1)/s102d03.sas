*** s102d03 ***;

proc sql;
   validate
   select Employee_ID, Employee_Gender, Salary,
      from orion.Employee_Payroll
      where Employee_Gender = 'F'
      order by Salary desc;
quit;
