UVM_HOME = /cad/INCISIV131/tools/uvm/uvm_lib/uvm_sv
UVM_VERBOSITY = UVM_HIGH
UVM_TEST = fifo_test
UVM_TEST1 = test1

run_test:
	irun -access rw -svseed random -uvmhome $(UVM_HOME) +UVM_VERBOSITY=$(UVM_VERBOSITY) +UVM_TESTNAME=$(UVM_TEST) -quiet fifo.sv fifo_if.sv fifo_pkg.sv top.sv

run_test1:
	irun -access rw -svseed -random -uvmhome $(UVM_HOME) +UVM_VERBOSITY=$(UVM_VERBOSITY) +UVM_TESTNAME=$(UVM_TEST1) -quiet ../rtl/*.sv ../rtl/fifo_if.sv ../test/fifo_pkg.sv ../env/top.sv

clean:
	rm -rf *~ core csrc simv* vc_hdrs.h *.key *.log INCA_libs .simvision

regress: clean run_test1
