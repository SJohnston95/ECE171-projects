module Comparitors(EQT,GT,LT,I);
input [3:0] I;
output EQT,GT,LT; 
wire l1, l2;
Greaterthans F1(GT,I);
Equaltos F2(EQT,I);
//not (l1,EQT), (l2,GT);
and F3(LT,~EQT,~GT);

endmodule

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

module Greaterthans(GT,I);
input [3:0] I;
output GT;
wire y1,y2,y3;
//not (j1,I[0]), (j2,I[1]), (j3,I[2]), (j3, I[3]);
and J1(y1,~I[0],~I[1],I[2]),
    J2(y2,~I[1],I[3]), 
    J3(y3,~I[0],I[2],I[3]);
or O2(GT,y1,y2,y3);
endmodule