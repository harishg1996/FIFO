class wr_agt_seqs extends uvm_sequence#(write_xtn);
 `uvm_object_utils(wr_agt_seqs)
  int k;
int j;
function new(string name="wr_agt_seqs");
super.new(name);
endfunction

task body;
begin
req=write_xtn::type_id::create("req");

repeat(25)
begin
start_item(req);
k=req.randomize with {rst==0;};
//req.disp;
finish_item(req);
//req.disp("SEQUENCE");
end
end
endtask
endclass

