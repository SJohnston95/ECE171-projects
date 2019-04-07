module Equaltos(EQT, I);
input [3:0] I;
output EQT;
wire x1,x2,x3,x4,in1,in2,in3,in4;
//not (in1,I[0]), (in2,I[1]), (in3,I[2]), (in4,I[3]);
and I1(x1,~I[0],~I[1],~I[2],~I[3]),
    I2(x2,~I[0],I[1],~I[2],I[3]), 
    I3(x3,I[0],I[1],I[2],I[3]),
    I4(x4,I[2],~I[3],I[0],~I[1]);
or O1(EQT,x1,x2,x3,x4);
endmodule