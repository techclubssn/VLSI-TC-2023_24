module D_Latch(
    input D,En,
    output Q,Qc
    );
    wire w1,w2,w3;
    assign w2=~D;
    assign w1=~(D&En);
    assign w3=~(w2&En);
    assign Q=~(w1&Qc);
    assign Qc=~(w3&Q);
endmodule
