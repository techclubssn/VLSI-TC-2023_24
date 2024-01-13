module D_Latch(
    input D,En,
    output Q,Qc
    );
    wire w1,w2,w3;
    not(w2,D);
    nand(w1,D,En);
    nand(w3,w2,En);
    nand(Q,w1,Qc);
    nand(Qc,w3,Q);
endmodule
