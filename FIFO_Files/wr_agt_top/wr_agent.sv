class wr_agent extends uvm_agent;
`uvm_component_utils(wr_agent)

wr_agt_config wcfg;
wr_agt_driver drv;
wr_agt_monitor mon;
wr_agt_sequencer seq;

function new(string name="wr_agent",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
 if(!uvm_config_db#(wr_agt_config)::get(this,"","WR_CONFIG",wcfg))
   `uvm_error("wr_agent","COULDNT GET")

mon=wr_agt_monitor::type_id::create("mon",this);
if(wcfg.is_active==UVM_ACTIVE)
begin
drv=wr_agt_driver::type_id::create("drv",this);
seq=wr_agt_sequencer::type_id::create("seq",this);
end

endfunction

function void connect_phase(uvm_phase phase);
  if(wcfg.is_active==UVM_ACTIVE)
    drv.seq_item_port.connect(seq.seq_item_export);
endfunction

/*task run_phase(uvm_phase phase);
uvm_top.print_topology;
endtask
*/
endclass

