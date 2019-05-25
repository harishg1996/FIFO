class wr_agt_monitor extends uvm_monitor;
`uvm_component_utils(wr_agt_monitor)

   int ending;
   int busy=1;

uvm_analysis_port#(write_xtn) mon_port;
virtual fifo_if.WRMON vif;
wr_agt_config wcfg;
write_xtn xtn;

function new(string name="wr_agt_monitor",uvm_component parent);
	super.new(name,parent);
	mon_port=new("mon_port",this);
endfunction

function void build_phase(uvm_phase phase);

if(!uvm_config_db#(wr_agt_config)::get(this,"","WR_CONFIG",wcfg))
  `uvm_error("WR_MONITOR","COULDNT GET")
endfunction

function void connect_phase(uvm_phase phase);
vif=wcfg.vif;
endfunction


task run_phase(uvm_phase phase);
     forever
     begin
      xtn=write_xtn::type_id::create("xtn");
       wait(vif.wrmon_cb.rst==0 )
          xtn.re=vif.wrmon_cb.re;
          xtn.we=vif.wrmon_cb.we;
	  xtn.data_in=vif.wrmon_cb.data_in;
                   mon_port.write(xtn);
	  //xtn.print;
	  	  //xtn.disp("WRITE_MONITOR");
	  if(ending)
            begin
            busy=0;
            phase.drop_objection(this);
         end
       @(vif.wrmon_cb);	
	
     end
endtask

virtual function void phase_ready_to_end(uvm_phase phase);
if(phase.get_name=="run")
begin
  ending=1;
if(busy)
  phase.raise_objection(this);
end
endfunction


endclass

