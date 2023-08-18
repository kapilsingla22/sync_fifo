@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Aug 03 14:58:01 +0530 2023
REM SW Build 3671981 on Fri Oct 14 05:00:03 MDT 2022
REM
REM IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim sync_fifo_tb_behav -key {Behavioral:sim_1:Functional:sync_fifo_tb} -tclbatch sync_fifo_tb.tcl -view C:/Users/kapil/OneDrive - IIT Kanpur/MS IITK/VLSI/IITK/prep 2023/Projects/projects/FIFO/synchronous_fifo/sync_fifo_tb_behav.wcfg -log simulate.log"
call xsim  sync_fifo_tb_behav -key {Behavioral:sim_1:Functional:sync_fifo_tb} -tclbatch sync_fifo_tb.tcl -view C:/Users/kapil/OneDrive - IIT Kanpur/MS IITK/VLSI/IITK/prep 2023/Projects/projects/FIFO/synchronous_fifo/sync_fifo_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
