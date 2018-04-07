data work.us_customers;
   length Name $ 20 Gender $ 1 AgeGroup $ 12;
   infile 'custus.dat' dlm=' ' dsd;
   input Name $ ID Gender $ BirthDate :date.
         Age AgeGroup $;
   format BirthDate monyy7.;
run;

proc print data=work.us_customers;
   var Name Gender BirthDate AgeGroup Age;
run;
