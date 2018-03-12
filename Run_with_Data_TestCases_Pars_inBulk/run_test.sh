#!/bin/bash
# Extract lines starting with "CASE" to files from CaseFile.tc 
case_directory=case
echo "remove directory ${case_directory}"
rm -rf ${case_directory}
mkdir ${case_directory}
awk 'BEGIN{count = 1}{if ($0 ~ /^CASE/) {print $0 > "./case/case" count ".tc"; count += 1}}' CaseFile.tc

# This is the parameter value of the "iv" option of test_minmax command
iv_val=5
result_directory="result"

# Init result directory
echo "remove directory ${result_directory}"
rm -rf ${result_directory}
mkdir ${result_directory}

# Generate results for each case file
for tc_file in case/*.tc; do
 case_file_name=`basename ${tc_file}`
 target_file="${result_directory}/${case_file_name}.txt"
 cat $tc_file >> $target_file
 echo "FileName|C1|C2|x|y|z|min|C1|C2|x|y|z|max" >> $target_file

	# You can modify the path of .data input files here
	for data_file in `find . -name *.data`; do   
		data_file_name=`basename ${data_file}`
		test_minmax ${data_file} iv ${iv_val} -b ${tc_file} | tail -n 2 | sed -n 's/ *//gp' | tr '\n' '|' | awk -v var=${data_file_name} '{print var"|"$0}'
		# This line is the test code instead of test_minmax command
		# cat log.dat | tail -n 2 | sed -n 's/ *//gp' | tr '\n' '|' | awk -v var=${data_file_name} '{print var"|"$0}'
	done >> $target_file
done
