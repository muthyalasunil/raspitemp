#!/bin/sh
 
# list all wireless network interfaces 
# (for MAC80211 driver; see wiki article for alternative commands)
curr_dir='/home/admin/raspitemp'
for ip in `ip neigh | cut -f 1 -s -d" "`
do
	#echo -e "$ip"
	python "$curr_dir/pico_client.py" $ip "$curr_dir/logs/$(date +'%d').log"  "$curr_dir/logs/error.log"
done
