`timescale 1ns / 1ps

module MUL_Stage #(parameter WIDTH=8,ind=0)(
    input[WIDTH-1:0] Mpd_in,
    input[WIDTH-1:0] ppd_in,
    input clk,
    input rst,
    input Multiplier_bit, 
    output reg[WIDTH-1:0] Mpd_out,
    output reg[WIDTH-1:0] ppd_out
    );
    wire[WIDTH-1:0] Mpd_out_w=(ind)?{Mpd_in,1'b0}:Mpd_in;

    always @(posedge clk or negedge rst) begin
        if(rst==1'b0) begin
            ppd_out<={WIDTH{1'b0}};
            Mpd_out<={WIDTH{1'b0}};
        end
        else begin
            ppd_out<=ppd_in+(Mpd_out_w&{WIDTH{Multiplier_bit}});
            Mpd_out<=Mpd_out_w;
        end
    end
endmodule
            
module Pipeline_MUL_4x4(
    input [3:0] A,
    input [3:0] B,
    input clk,
    input rst,
    output [7:0] Y
    );
    wire[7:0] stage_w[4:0];
    wire[7:0] Mpd_stage[4:0];
    wire[3:0] Multiplier_bit;
    assign stage_w[0]=8'b0,Mpd_stage[0]=A,Y=stage_w[4];
    
    Pipeline_ShiftReg#(4) sReg(.D(B),
                           .clk(clk),
                           .rst(rst),
                           .sr_out(Multiplier_bit));
                              
    generate
    genvar i;
    for(i=0;i<4;i=i+1) begin
        MUL_Stage#(8,i) st(.Mpd_in(Mpd_stage[i]),
                           .ppd_in(stage_w[i]),
                           .clk(clk),
                           .rst(rst),
                           .Multiplier_bit(Multiplier_bit[i]),
                           .Mpd_out(Mpd_stage[i+1]),
                           .ppd_out(stage_w[i+1]));
    end
    endgenerate
endmodule
