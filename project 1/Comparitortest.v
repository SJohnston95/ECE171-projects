module Comparitor(EQT,GT,LT,I);
input [3:0] I; 
output EQT,GT,LT; 

Greaterthan I1 (GT,I);
Equalto I2 (EQT,I);
assign LT = ~GT & ~EQT;


endmodule

module Equalto(EQT, I);
input [3:0] I;
output EQT;
assign #6 EQT =(~I[0]&~I[1]&~I[2]&~I[3]) | (~I[0]&I[1]&~I[2]&I[3])|(I[0]&I[1]&I[2]&I[3])|(I[2]&~I[3]&I[0]&~I[1]);
endmodule

module Greaterthan(GT,I);
input [3:0] I;
output GT;
assign #6 GT = (~I[0]&~I[1]&I[2])|(~I[1]&I[3])|(~I[0]&I[2]&I[3]);
endmodule
