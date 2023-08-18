`timescale 1ns / 1ps
`define clk_period 10
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2023 05:44:59 PM
// Design Name: 
// Module Name: sync_fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module sync_fifo_tb();

reg clk_t,rst_t,wr_t,rd_t;
reg [7:0] data_i_tb;
wire full_t,empty_t;
wire [7:0] data_o_tb;
integer i;
sync_fifo s1(.empty(empty_t),
             .full(full_t),
             .data_i(data_i_tb),
             .data_o(data_o_tb),
             .clk(clk_t),
             .rst(rst_t),
             .wr_en(wr_t),
             .rd_en(rd_t)
            );
initial clk_t=1'b1;    
always #(`clk_period/2) clk_t=~clk_t;
initial
    begin
             rst_t=1'b0;
             wr_t=1'b0;
             rd_t=1'b0;
             data_i_tb=0;
             #(`clk_period);
             rst_t=1'b1;     //reset system
             #(`clk_period);
             rst_t=1'b0;          //finish reset
             
             //WRITE DATA
             wr_t=1'b1;
             rd_t=1'b0;
             for(i=0;i<8;i=i+1) begin
             data_i_tb=i;
             #(`clk_period);
             end
             
               //Read DATA
             wr_t=1'b0;
             rd_t=1'b1;
             for(i=0;i<8;i=i+1) begin
             #(`clk_period);
             end
               //WRITE DATA
             wr_t=1'b1;
             rd_t=1'b0;
             for(i=0;i<8;i=i+1) begin
             data_i_tb=i+12;
             #(`clk_period);
             end
                //Read DATA
             wr_t=1'b0;
             rd_t=1'b1;
             for(i=0;i<8;i=i+1) begin
             #(`clk_period);
             end
             #(`clk_period);
             #(`clk_period);
             #(`clk_period);
             $stop;
    end
 
endmodule