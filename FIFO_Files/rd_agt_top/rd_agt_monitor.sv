class rd_agt_monitor extends uvm_monitor;
`uvm_component_utils(rd_agt_monitor)

virtual fifo_if.RDMON vif;
uvm_analysis_port#(write_xtn) mon_port;
rd_agt_config rcfg;
write_xtn xtn;

function new(string name="rd_agt_monitor",uvm_component parent);
	super.new(name,parent);
	mon_port=new("mon_port",this);
endfunction

function void build_phase(uvm_phase phase);

if(!uvm_config_db#(rd_agt_config)::get(this,"","RD_CONFIG",rcfg))
  `uvm_error("RD_MONITOR","COULDNT GET")

endfunction

function void connect_phase(uvm_phase phase);
vif=rcfg.vif;
endfunction

task run_phase(uvm_phase phase);

forever
  begin
  xtn=write_xtn::type_id::create("xtn");
   
  wait((vif.rdmon_cb.rst==0) && (vif.rdmon_cb.re))
                @(vif.rdmon_cb);

         xtn.re=vif.rdmon_cb.re;
         xtn.data_out=vif.rdmon_cb.data_out;
         xtn.we=vif.rdmon_cb.we;

                 mon_port.write(xtn);
end

endtask

endclass

