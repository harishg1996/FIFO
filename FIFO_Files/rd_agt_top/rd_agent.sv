class rd_agent extends uvm_agent;
`uvm_component_utils(rd_agent)

rd_agt_config rcfg;
rd_agt_driver drv;
rd_agt_monitor mon;
rd_agt_sequencer seq;

function new(string name="rd_agent",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 if(!uvm_config_db#(rd_agt_config)::get(this,"","RD_CONFIG",rcfg))
   `uvm_fatal("rd_agent","COULDNT GET")

mon=rd_agt_monitor::type_id::create("mon",this);
if(rcfg.is_active==UVM_ACTIVE)
begin
drv=rd_agt_driver::type_id::create("drv",this);
seq=rd_agt_sequencer::type_id::create("seq",this);
end

endfunction

function void connect_phase(uvm_phase phase);
  if(rcfg.is_active==UVM_ACTIVE)
    drv.seq_item_port.connect(seq.seq_item_export);
endfunction

endclass

