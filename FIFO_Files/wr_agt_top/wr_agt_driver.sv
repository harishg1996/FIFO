class wr_agt_driver extends uvm_driver#(write_xtn);
`uvm_component_utils(wr_agt_driver)

virtual fifo_if.WRDRV vif;
wr_agt_config wcfg;

function new(string name="wr_agt_driver",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);

if(!uvm_config_db#(wr_agt_config)::get(this,"","WR_CONFIG",wcfg))
  `uvm_error("WR_DRIVER","COULDNT GET")
endfunction

function void connect_phase(uvm_phase phase);
vif=wcfg.vif;
endfunction

task run_phase(uvm_phase phase);
     forever
     begin
  
      seq_item_port.get_next_item(req);

       @(vif.wrdrv_cb);	
          vif.wrdrv_cb.we<=req.we;
          vif.wrdrv_cb.data_in<=req.data_in;
          vif.wrdrv_cb.rst<=req.rst;
          vif.wrdrv_cb.re<=req.re;          
      seq_item_port.item_done;
          //req.disp("DRIVER");
  end
endtask

endclass
