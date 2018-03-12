#!/bin/bash
count=1 
times=10000
package_dir="/root/auto/package/"
filename="funcache2"
tomahawk="/root/tomahawk"

while [ $count -le $times ];
do 
	`du -a $package_dir grep pcap | awk {'print $2'} >> $filename`
	cat $filename | while read line
	do 
			$tomahawk -l 2 -i eth2 -j eth3 -f $line
	done
	rm $filename 
	count=$(($count+1)) 
done