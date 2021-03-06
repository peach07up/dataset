data work.countries(keep=Customer_Country);
   set orion.supplier;
   Customer_Country=Country;
run;

proc means data=orion.customer_dim
           classdata=work.countries
           lclm mean uclm alpha=0.10;
   class Customer_Country;
   var Customer_Age;
   title 'Average Age of Customers in Each Country';
run;
