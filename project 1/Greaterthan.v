module Greaterthan(GT,I);
input [3:0] I;
output GT;
assign #6 GT = (~I[0]&~I[1]&I[2])|(~I[1]&I[3])|(~I[0]&I[2]&I[3]);
endmodule