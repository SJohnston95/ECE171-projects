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