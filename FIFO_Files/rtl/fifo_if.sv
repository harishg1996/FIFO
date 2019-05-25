interface fifo_if(input bit clk);

logic rst,we,re,full,empty;
logic [7:0]data_in,data_out;

clocking wrdrv_cb@(posedge clk);
 default input #1 output #1;
output rst;
output we;
output re;
output data_in;
endclocking

clocking wrmon_cb@(posedge clk);
 default input #1 output #1;
input we;
input re;
input rst;
input data_in;
input data_out;
endclocking

clocking rddrv_cb@(posedge clk);
 default input #1 output #1;
output re;
endclocking

clocking rdmon_cb@(posedge clk);
 default input #1 output #1;
input rst;
input re;
input we;
input data_out;
endclocking

modport WRDRV(clocking wrdrv_cb);
modport WRMON(clocking wrmon_cb);
modport RDDRV(clocking rddrv_cb);
modport RDMON(clocking rdmon_cb);

endinterface
