transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl/color_mapper.sv}
vlib chatbot_soc
vmap chatbot_soc chatbot_soc
vlog -sv -work chatbot_soc +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules/floating_point_operations.sv}
vlog -sv -work chatbot_soc +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules/nn_partition.sv}
vlog -sv -work chatbot_soc +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/chatbot_soc/synthesis/submodules/neural_net.sv}
vlog -sv -work work +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl/nn_wrapper.sv}

vlog -sv -work work +incdir+C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl {C:/Users/Prateek/Desktop/ece385git/final_project_demo_ready/ece_385_chatbot/hdl/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -L chatbot_soc -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
