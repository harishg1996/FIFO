module fifo(clk,rst,data_in,data_out,we,re,full,empty);

parameter FIFO_DEPTH=16,
	  FIFO_WIDTH=8;

input  clk,rst,we,re;
input [FIFO_WIDTH-1:0]data_in;
output reg [FIFO_WIDTH-1:0]data_out;
output  full,empty;

reg [FIFO_WIDTH-1:0]fifo_mem[FIFO_DEPTH-1:0];
reg [4:0]wr_ptr=0;
reg [4:0]rd_ptr=0;

always@(posedge clk)
begin
    if(rst)
      begin
	foreach(fifo_mem[i])
	   fifo_mem[i]=0;
      end

      else 
	begin
	 if(we && (~re) && (~full))
            fifo_mem[wr_ptr]=data_in;
         if(re && (~we) && (~empty))
	    data_out=fifo_mem[rd_ptr];
         if(re && (~we) && empty)
	    data_out='z;
        end
end

always@(posedge clk)
begin
    if(rst)
       begin
         wr_ptr<=0;
         rd_ptr<=0;
       end
    
       else
	 begin
           if(we && (~re) &&(~full))
              wr_ptr<=wr_ptr+1;
           if(re && (~we) && (~empty))
              rd_ptr<=rd_ptr+1;
         end
end

assign full=(wr_ptr[4]!=rd_ptr[4]) && (wr_ptr[3:0]==rd_ptr[3:0]);
assign empty=(wr_ptr==rd_ptr);

endmodule
         
