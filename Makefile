all: cpu

cpu:
	iverilog -Wall -o cpu cpu.v cpu_tb.v imem.v regfile.v  alu.v cpu_control.v
run: cpu
	vvp cpu
wave: run
	gtkwave out.vcd

clean:
	rm -f cpu out.vcd
