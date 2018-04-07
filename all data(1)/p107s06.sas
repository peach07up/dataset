data work.prices;
   infile 'prices.dat' dlm='*' missover;
   input ProductID StartDate :date. EndDate :date. 
         UnitCostPrice :dollar. UnitSalesPrice :dollar.;
   label ProductID='Product ID'
         StartDate='Start of Date Range'
         EndDate='End of Date Range'
         UnitCostPrice='Cost Price per Unit'
         UnitSalesPrice='Sales Price per Unit';
   format StartDate EndDate mmddyy10.
          UnitCostPrice UnitSalesPrice 8.2; 
run;

proc print data=work.prices label;
run;
