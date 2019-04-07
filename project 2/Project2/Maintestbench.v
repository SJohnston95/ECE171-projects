//
// Testbench for  8-bit Comparator
//


module GoldenDevice(A, B, IEQ, ILT, IGT, OEQ, OLT, OGT);
input [7:0] A, B;
input IEQ, ILT, IGT;
output OEQ, OLT, OGT;
reg OEQ, OLT, OGT;

always @(A, B, IEQ, ILT, IGT)
begin
if (ILT)
	OLT = 1;
else
	OLT = 0;
	
if (IGT)
	OGT = 1;
else
	OGT = 0;

if (IEQ)
  begin
  if (A>B)
  	begin
  	OEQ = 0;
  	OGT = 1;
  	end
  else if (A<B)
  	begin
  	OLT = 1;
  	OEQ = 0;
  	end
  else
  	OEQ = 1;
  end
else
	OEQ = 0;
end
endmodule





module Compare8BitTest;
integer i,j;
reg [7:0] A, B;
reg IEQ, ILT, IGT;

wire GoldenOLT, GoldenOEQ, GoldenOGT;		// response from Golden device
wire OLT, OEQ, OGT;							// response from DUT

reg Error;


Compare8Bit DUT(A, B, IEQ, ILT, IGT, OEQ, OLT, OGT);
GoldenDevice GD(A, B, IEQ, ILT, IGT, GoldenOEQ, GoldenOLT, GoldenOGT);

initial
begin
IEQ = 1;
ILT = 0;
IGT = 0;
Error = 0;
for (i = 0; i < 256; i = i+1)    // iterate over all values of A, B
	for (j= 0; j < 256; j = j+1)
     begin
     A = i;
     B = j;
     #100
     if ({GoldenOEQ, GoldenOLT, GoldenOGT} !== {OEQ, OLT, OGT})
         begin
         $display("*** Error: A = %8b, B = %8b, expected OEQ = %1b, OLT = %1b, OGT = %1b but OEQ = %1b, OLT = %1b, OGT = %1b\n",A,B, GoldenOEQ, GoldenOLT, GoldenOGT, OEQ, OLT, OGT);
         Error = 1;
         end
     end
     
A = 8'bX;
B = 8'bX;
ILT = 1;
IEQ = 0;
#100
if ({GoldenOEQ, GoldenOLT, GoldenOGT} !== {OEQ, OLT, OGT})
	begin
	$display("*** Error: A = %8b, B = %8b, expected OEQ = %1b, OLT = %1b, OGT = %1b but OEQ = %1b, OLT = %1b, OGT = %1b\n",A,B, GoldenOEQ, GoldenOLT, GoldenOGT, OEQ, OLT, OGT);
	Error = 1;
	end
IGT = 1;
ILT = 0;
#100
if ({GoldenOEQ, GoldenOLT, GoldenOGT} !== {OEQ, OLT, OGT})
	begin
	$display("*** Error: A = %8b, B = %8b, expected OEQ = %1b, OLT = %1b, OGT = %1b but OEQ = %1b, OLT = %1b, OGT = %1b\n",A,B, GoldenOEQ, GoldenOLT, GoldenOGT, OEQ, OLT, OGT);
	Error = 1;
	end	
	
if (!Error)
  $display("*** Congratulations!   No errors detected\n");
else
  $display("*** Sorry.  Try again.\n");
  
$finish();
end
endmodule