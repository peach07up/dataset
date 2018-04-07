/*********************************************************
*  1. Submit the program.                                *
*  2. Determine the reason for the invalid data that     *
*     appears in the SAS log.                            * 
*  3. Which statement best describes the invalid data?   *   
*     The data in the raw data file is bad.	             *
*     The programmer incorrectly read the data.	         *
*********************************************************/

data work.nonsales;
   infile 'nonsales.csv' dlm=',';
   input Employee_ID First $ Last;
run;

proc print data=work.nonsales;
run;
