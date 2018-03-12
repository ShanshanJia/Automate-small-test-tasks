# Automate-small-test-tasks
This repository stores the programs and scripts used to automate some tasks in my daily testing.

## PerformanceTest_Tomahawk_Packet_Replay
*replay.sh* is used to repeatedly play all the .pcap packets in the directory on the target machine using Tomahawk command. It is for performance test, stress test etc.

[Tomahawk](http://tomahawk.sourceforge.net/) is a command line tool for testing the throughput and blocking capabilities of network-based intrusion prevention systems (NIPS).

## Run_with_Data_TestCases_Pars_inBulk
*run_test.sh* is used to extract "CASE" lines from CaseFile and export them to seperate case files, execute the test command by traversing all the input data files, case files and parameters, and then print the results in a friendly form that can be exported to MS Excel further.

## Run_with_Inputs_Pars_inBulk
*run.sh* is used to run the python test code on all the input files and parameters to be tested. The result .txt can be exported to MS Excel further.

## Modify_Par_of_Failed_Cases
*modify.sh* is used to modify the test parameter in the corresponding test case file if the test failed.

## Statistics_by_Intervals
*statistics.sql* is used to count the records in database in specified intervals(e.g. every two hours).

## Diagnosis_Find_Sql_by_Pid
*pid2sql.sql* is used to locate the corresponding sql querying by PID. 

## Generate_TestFiles_from_TestCases
*run.bat* is used to generate test files from the input file containing a batch of designed test cases.
