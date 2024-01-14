module D_Flip_flop_tb;
    reg D,clk,rst,set;
    wire Q;
    D_FlipFLop UUT(.D(D),
                   .clk(clk),
                   .rst(rst),
                   .set(set),
                   .Q(Q));
    initial begin
        D=0;
        clk=0;
        rst=0;
        set=1;
        #10
        rst=1;
        D=1;
        #3
        D=0;
        #3
        D=1;
        #9
        D=0;
        #3
        D=1;
        #3
        D=0;
        #14
        D=0;
        #3
        D=1;
        #3
        D=0;
        #15
        set=0;
        #3
        set=1;
//        #5
//        set=0;
//        rst=0;
        #5
        $finish();
    end
    
    always #20 clk=~clk;
endmodule
