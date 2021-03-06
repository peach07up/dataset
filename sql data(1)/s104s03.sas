*** s104s03 ***;

proc sql;
title "Level I or II Purchasing Agents";
title2 "Who are older than ALL Purchasing Agent IIIs";
   select Employee_ID, Job_Title, Birth_Date,
          int(('24Nov2007'd-Birth_Date)/365.25) as Age
      from orion.Staff
      where Job_Title  in ('Purchasing Agent I', 
                           'Purchasing Agent II') 
        and Birth_Date < all 
               (select Birth_Date
                   from orion.Staff
                   where Job_Title='Purchasing Agent III')
;
quit;
title;
                              
*** Alternate Solution ***;
proc sql;
title "Level I or II Purchasing Agents";
title2 "Who are older than ALL Purchasing Agent IIIs";
   select Employee_ID, Job_Title, Birth_Date,
          int(('24Nov2007'd-Birth_Date)/365.25) as Age
      from orion.Staff
      where Job_Title  in ('Purchasing Agent I', 
                           'Purchasing Agent II') 
        and Birth_Date < 
               (select min(Birth_Date)
                   from orion.Staff
                where Job_Title='Purchasing Agent III')
;
quit;
title;
