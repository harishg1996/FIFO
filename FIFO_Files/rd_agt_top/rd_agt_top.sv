class rd_agt_top extends uvm_agent;
`uvm_component_utils(rd_agt_top)

rd_agent ragt[];
env_config ecfg;

function new(string name="rd_agt_top",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
if(!uvm_config_db#(env_config)::get(this,"","ENV_CONFIG",ecfg))
  `uvm_fatal("RD_AGT_TOP","couldnt get")

ragt=new[ecfg.no_of_ragt];
foreach(ragt[i])
 begin
  ragt[i]=rd_agent::type_id::create($sformatf("ragt[%0d]",i),this);
  uvm_config_db#(rd_agt_config)::set(this,"*","RD_CONFIG",ecfg.rcfg[i]);
 end
endfunction

endclass

