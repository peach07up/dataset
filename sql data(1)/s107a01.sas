*** s107a01 ***;
proc sql;
   create table discounts
      (Product_ID num format=z12.,
       Start_Date date,
       End_Date date,
       Discount num format=PERCENT.,
	   constraint ok_discount 
       check (Discount le .5))
;
quit;
proc sql undo_policy=none;
   insert into discounts
      values (240500200009,'01Mar2007'd,
              '31Mar2007'd,.45)
      values (220200200036,'01Mar2007'd,
              '31Mar2007'd,.54)
      values (220200200038,'01Mar2007'd,
              '31Mar2007'd,.25);
quit;
