*** s108s05  ***;

  /* a. */
proc sql;
title "2007 Purchases by Country";
   select Country, 
          sum(Total_Retail_Price) format=dollar10.2 as Purchases 
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
        and year(Order_Date)=2007
      group by Country
      order by Purchases desc
;
quit;
title;

  /* b. */
proc sql;
title  "2007 US Customer Purchases";
title2 "Total US Purchases: $10,655.97" ;
   select Customer_Name, 
          sum(Total_Retail_Price) format=dollar10.2 as Purchases
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
            and year(Order_Date)=2007
           and Country="US"
      group by Customer_Name
      order by Purchases desc
;
quit;
title;

  /* c. */
proc sql noprint;
   select Country, 
          sum(Total_Retail_Price) format=dollar10.2 as Purchases
          into :Country, :Country_Purchases
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
            and year(Order_Date)=2007
      group by Country
      order by Purchases desc
;
reset print;

title  "2007 &Country Customer Purchases";
title2 "Total &Country Purchases: &Country_Purchases" ;  
   select Customer_Name, 
          sum(Total_Retail_Price) format=dollar10.2 as Purchases 
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
        and year(Order_Date)=2007
        and Country="&Country"
      group by Customer_Name
      order by Purchases desc
;
quit;
title;

  /* d. */
proc sql noprint;
   select Country, 
          sum(Total_Retail_Price) format=dollar10.2 as Purchases 
          into :Country, :Country_Purchases
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
           and year(Order_Date)=2007
      group by Country
      order by Purchases /*ascending requires no keyword*/
;
reset print;
title  "2007 &Country Customer Purchases";
title2 "Total &Country Purchases: &Country_Purchases" ;
   select Customer_Name, 
          sum(Total_Retail_Price) As Purchases
          format=dollar10.2
      from orion.Customer as c,
           orion.Order_fact as o
      where c.Customer_ID=o.Customer_ID
            and year(Order_Date)=2007
           and Country="&Country"
      group by Customer_Name
      order by Purchases desc
;
quit;
title;
