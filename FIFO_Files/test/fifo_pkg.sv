package fifo_pkg;
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   `include "../wr_agt_top/write_xtn.sv"
   `include "../wr_agt_top/wr_agt_config.sv"
   `include "../rd_agt_top/rd_agt_config.sv"
   `include "../env/env_config.sv"
   `include "../wr_agt_top/wr_agt_driver.sv"
   `include "../wr_agt_top/wr_agt_monitor.sv"
   `include "../wr_agt_top/wr_agt_sequencer.sv"
   `include "../wr_agt_top/wr_agent.sv"
   `include "../wr_agt_top/wr_agt_top.sv"
   `include "../wr_agt_top/wr_agt_seqs.sv"
   
   `include "../rd_agt_top/read_xtn.sv"
   `include "../rd_agt_top/rd_agt_driver.sv"
   `include "../rd_agt_top/rd_agt_monitor.sv"
   `include "../rd_agt_top/rd_agt_sequencer.sv"
   `include "../rd_agt_top/rd_agent.sv"
   `include "../rd_agt_top/rd_agt_top.sv"
   `include "../rd_agt_top/rd_agt_seqs.sv"
   
   `include "../env/virtual_sequencer.sv"
   `include "../env/virtual_sequence.sv"
   `include "../env/scoreboard.sv"

   `include "../env/environment.sv"

   `include "../test/fifo_test.sv"
   
endpackage
   
