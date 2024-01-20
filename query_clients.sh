#!/bin/bash
 
# list all wireless network interfaces 
# (for MAC80211 driver; see wiki article for alternative commands)
curr_dir='/home/admin/raspitemp'
#for ip in `ip neigh | cut -f 1 -s -d" "`
my_ip=`ip -4 a show wlan0 | grep inet | cut -f 6 -s -d" " | cut -f 1 -s -d/ | cut -f 1,2,3 -s -d.`
#echo $my_ip
for i in {2..254}
do
	ip="$my_ip.$i"
	echo $ip
	python "$curr_dir/pico_client.py" $ip "$curr_dir/logs/$(date +'%d').log"  "$curr_dir/logs/$(date +'%d').err"
done
