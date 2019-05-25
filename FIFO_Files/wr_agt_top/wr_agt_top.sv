class wr_agt_top extends uvm_agent;
`uvm_component_utils(wr_agt_top)

wr_agent wagt[];
env_config ecfg;

function new(string name="wr_agt_top",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
if(!uvm_config_db#(env_config)::get(this,"","ENV_CONFIG",ecfg))
  `uvm_error("WR_AGT_TOP","couldnt get")

wagt=new[ecfg.no_of_wagt];
foreach(wagt[i])
 begin
  wagt[i]=wr_agent::type_id::create($sformatf("wagt[%0d]",i),this);
  uvm_config_db#(wr_agt_config)::set(this,"*","WR_CONFIG",ecfg.wcfg[i]);
 end
endfunction

endclass

