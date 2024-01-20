#!/bin/bash


essid=`iwgetid | cut -f 6 -s -d" " | cut -f 2 -s -d:`
#echo $essid
if [ $essid="Raspiwifi" ]
then
	echo "Mailing on $essid.."
	/usr/bin/python ~/raspitemp/analyse.py | tail -10 > ~/raspitemp/logs/report.txt
	#hostname -I >> ~/raspitemp/logs/report.txt
	#echo "$(cat ~/raspitemp/mail_subject) $essid"
	mail -s "$(cat ~/raspitemp/mail_subject) $essid" "$(cat ~/raspitemp/mail_to_list)" < ~/raspitemp/logs/report.txt
fi 

