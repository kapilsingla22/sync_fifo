`timescale 1ns / 1ps
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



module sync_fifo( input [7:0] data_i,
                  input wr_en,
                  input rd_en,
                  input clk,
                  input rst,
                  output empty,
                  output full,
                  output reg [7:0] data_o          
    );
parameter DEPTH=8;    
reg [7:0] fifo[DEPTH-1:0];           // Declaration of FIFO
reg [2:0] wr_ptr,rd_ptr;       // Declaration of write pointer and read pointer for accessing elements of FIFO    
reg [3:0] count;               // For seeing if fifo full or empty

assign full = (count==DEPTH)?1:0;
assign empty=(count==0)?1:0;

//    -----------------------------writing into FIFO-------------------------------------------
always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                wr_ptr<=3'b000;
            end
        else
            begin
                if(wr_en)
                    begin
                         fifo[wr_ptr]<=data_i;
                         wr_ptr<=wr_ptr+1;
                    end        
            end
    end

// --------------------------Reading from FIFO------------------------------------------------------
always@(posedge clk or posedge rst)
    begin
        if(rst)
            rd_ptr<=3'b000;
        else
            begin
                if(rd_en)
                    data_o<=fifo[rd_ptr];
                    rd_ptr<=rd_ptr+1;
            end   
    end

// -----------------------Managing count value---------------------------------
always@(posedge clk or posedge rst)
    begin
        if(rst)
            count<=4'b0000;
        else
            begin
                case({wr_en,rd_en})
                    2'b10:count<=count+1;
                    2'b01:count<=count-1;
                    2'b00:count<=count;
                    2'b11:count<=count;
                    default: count<=count;
                endcase
            end
    end
endmodule