class rd_agt_config extends uvm_object;
`uvm_object_utils(rd_agt_config)

virtual fifo_if vif;

function new(string name="rd_agt_config");
super.new(name);
endfunction

uvm_active_passive_enum is_active=UVM_PASSIVE;

endclass
