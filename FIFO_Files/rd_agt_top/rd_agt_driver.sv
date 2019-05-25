class rd_agt_driver extends uvm_driver#(read_xtn);
`uvm_component_utils(rd_agt_driver)

virtual fifo_if.RDDRV vif;
rd_agt_config rcfg;

function new(string name="rd_agt_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);

if(!uvm_config_db#(rd_agt_config)::get(this,"","RD_CONFIG",rcfg))
  `uvm_fatal("RD_DRIVER","COULDNT GET")
endfunction

function void connect_phase(uvm_phase phase);
vif=rcfg.vif;
endfunction

endclass

