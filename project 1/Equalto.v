module Equalto(EQT, I);
input [3:0] I;
output EQT;
assign #6 EQT =(~I[0]&~I[1]&~I[2]&~I[3]) | (~I[0]&I[1]&~I[2]&I[3])|(I[0]&I[1]&I[2]&I[3])|(I[2]&~I[3]&I[0]&~I[1]);
endmodule