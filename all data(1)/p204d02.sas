data contacts;
   infile 'address.dat';  *PC and Unix;
   *infile '.workshop.rawdata(address)'; *Z/OS Mainframe;
   input FullName $30.;
   input;
   input Address2 $25.;
   input Phone $8. ;    
run;

proc print data=contacts noobs;
run;
