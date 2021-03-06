  *** s107s02 ***;
 /* a. */
proc sql;
   create view orion.T_Shirts as
      select d.Product_ID, Supplier_Name format=$20., 
             Product_Name ,
             Unit_Sales_Price as Price 'Retail Price'
         from orion.Product_dim as d, orion.Price_list as l
         where d.Product_ID=l.Product_ID  
              and lowcase(Product_Name) like '%t-shirt%'
;
quit;
  /* b. */
proc sql flow=6 35;
title "Available T-Shirts";
   select * 
      from orion.T_Shirts
      order by Supplier_Name, Product_ID
;
quit;
title;

  /* c. */
proc sql;
title "T-Shirts under $20";
   select Product_ID, Product_Name, Price format=dollar6.2
      from orion.T_Shirts
      where Price < 20
      order by Price
;
quit;
title;
