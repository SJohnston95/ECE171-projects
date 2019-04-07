module Comparitors(EQT,GT,LT,I);
input [3:0] I;
output EQT,GT,LT; 
wire l1, l2;
Greaterthans F1(GT,I);
Equaltos F2(EQT,I);
//not (l1,EQT), (l2,GT);
and F3(LT,~EQT,~GT);

endmodule