module Comparitor(EQT,GT,LT,I);
input [3:0] I; 
output EQT,GT,LT; 

Greaterthan I1 (GT,I);
Equalto I2 (EQT,I);
assign LT = ~GT & ~EQT;


endmodule