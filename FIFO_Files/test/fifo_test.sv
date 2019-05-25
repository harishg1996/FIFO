class fifo_test extends uvm_test;
`uvm_component_utils(fifo_test)

environment env;
env_config ecfg;
wr_agt_config wcfg[];
rd_agt_config rcfg[];

int no_of_wagent=1;
int no_of_ragent=1;

//trial1 seq;

function new(string name="test",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
ecfg=env_config::type_id::create("ecfg");

  ecfg.wcfg=new[no_of_wagent];
  ecfg.rcfg=new[no_of_ragent];

wcfg=new[no_of_wagent];


foreach(wcfg[i])
  begin
    wcfg[i]=wr_agt_config::type_id::create($sformatf("wcfg[%0d]",i));
    if(!uvm_config_db#(virtual fifo_if)::get(this,"","VIF_0",wcfg[i].vif))
      `uvm_error("TEST","COULDNT GET")
    ecfg.wcfg[i]=wcfg[i];
  end

rcfg=new[no_of_ragent];

foreach(rcfg[i])
  begin
    rcfg[i]=rd_agt_config::type_id::create($sformatf("rcfg[%0d]",i));
    if(!uvm_config_db#(virtual fifo_if)::get(this,"","VIF_0",rcfg[i].vif))
       `uvm_error("TEST","COULDNT GET")
    ecfg.rcfg[i]=rcfg[i];
  end

uvm_config_db#(env_config)::set(this,"*","ENV_CONFIG",ecfg);
super.build_phase(phase);

env=environment::type_id::create("env",this);
endfunction

endclass

/*task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq=trial1::type_id::create("seq");
  seq.start(env.vseqr);
#100;
phase.drop_objection(this);
endtask*/



//endclass

class test1 extends fifo_test;
`uvm_component_utils(test1)

trial1 seq;

function new(string name="test1",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
seq=trial1::type_id::create("seq");
phase.raise_objection(this);
  seq.start(env.vseqr);
  
phase.drop_objection(this);
endtask


endclass
