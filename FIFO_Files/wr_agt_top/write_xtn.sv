class write_xtn extends uvm_sequence_item;
`uvm_object_utils(write_xtn)

function new(string name="write_xtn");
super.new(name);
endfunction

rand bit rst;
rand bit we;
rand bit re;
rand bit [7:0]data_in;
       logic [7:0]data_out;
     bit full;
     bit empty;

constraint ENABLE {we!=re;}
constraint DIST{we dist {0:=4,1:=6};}
constraint DIST2{re dist {1:=4,0:=6};}


function void do_print(uvm_printer printer);
super.do_print(printer);

printer.print_field("we",	this.we,	1,	UVM_HEX);
printer.print_field("re",	this.re,	1,	UVM_HEX);
printer.print_field("data_in",	this.data_in,	8,	UVM_DEC);
printer.print_field("data_out",	this.data_out,	8,	UVM_DEC);

endfunction

endclass
