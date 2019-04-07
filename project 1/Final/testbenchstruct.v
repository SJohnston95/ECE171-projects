module Test();
reg [3:0] I;
wire EQT,GT,LT;
Comparitors I0 (EQT,GT,LT,I);



initial
begin
    I = 4'b0000;
   #35 I = 4'b0001;
    #35 I = 4'b0010;
    #35 I = 4'b0011;     
  #35 I = 4'b0100;
 #35 I = 4'b0101;
  #35 I = 4'b0110;
  #35 I = 4'b0111;
   #35 I = 4'b1000;
    #35 I = 4'b1001;
     #35 I = 4'b1010;
      #35 I = 4'b1011;
      #35 I = 4'b1100;
       #35 I = 4'b1101;
        #35 I = 4'b1110;
   #35 I = 4'b1111;
   #35 I = 4'b0000;
$finish();
end
endmodule
