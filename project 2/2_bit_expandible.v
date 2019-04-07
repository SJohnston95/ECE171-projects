module Compare8Bit (A, B, IEQ, ILT, IGT, OEQ, OLT, OGT);
input [7:0] A, B;
input IEQ, ILT, IGT;
output OEQ, OLT, OGT; 

program A1 (A[1:0],B[1:0],IEQ,ILT,IGT,OEQ,OLT,OGT);

endmodule




///////////////////////////////////////////////////////////////////////////
/////////////As requested, the files are placed into a single program
module program (A,B, INEQ, INLT, INGT, OEQ, OLT, OGT);
input [1:0] A,B;
input INEQ, INLT, INGT;
output OEQ, OLT, OGT;
assign #6 OGT = INGT
|(INEQ&~INLT&((~B[0]&~B[1]&A[0])
|(~B[1]&A[1])
|(~B[0]&A[0]&A[1])));
///////////////////////////////////////////////////////////////////////////
assign #6 OEQ = (~INGT)&(~INLT)&(INEQ)&((~B[0]&~B[1]&~A[0]&~A[1]) 
| (~B[1]&B[0]&~A[1]&A[0])
|(A[0]&A[1]&B[1]&B[0])
|(A[1]&~A[0]&B[1]&~B[0]));

assign #6 OLT = (~INGT)&(INLT)
|(INEQ&(~OGT & ~OEQ));

endmodule