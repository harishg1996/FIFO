class rd_agt_seqs extends uvm_sequence#(read_xtn);
 `uvm_object_utils(rd_agt_seqs)

function new(string name="rd_agt_seqs");
super.new(name);
endfunction

/*task body;
req=read_xtn::type_id::create("req");

start_item(req);
assert(req.randomize() );
finish_item(req);

endtask*/
endclass

