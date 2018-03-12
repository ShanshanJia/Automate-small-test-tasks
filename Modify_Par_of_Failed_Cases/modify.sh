#!/bin/bash
for dir in *
do
    if [ -d $dir ]
    then
        if [ ! -f "${dir}/success_result_file" ]
        then
            echo "file success_result_file does not exist in $dir, modify the parameter in corresponding test case file"
            sed -i "s/PARA_test    = 1.2E+05/PARA_test    = 2.0E+05/g" "${dir}/testcase.fsc"
        fi
    fi
done;
