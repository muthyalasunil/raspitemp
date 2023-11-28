#!/bin/bash


if [ "$iwgetid" == "Raspiwifi" ]
then
	echo "Mailing on Raspiwif.."
	/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/analyse.py | tail -10 > /home/admin/logs/report.txt
	hostname -I >> /home/admin/logs/report.txt
	mail -s "$(cat ~/mail_subject)" "$(cat ~/mail_to_list)" < /home/admin/logs/report.txt
fi 

