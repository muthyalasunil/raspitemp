#!/bin/bash
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/dhttest.py >> /home/admin/logs/$(date +'%d').log
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/analyse.py | tail -10 > /home/admin/logs/report.txt
hostname -I >> /home/admin/logs/report.txt

if [ "$(ping -c1 8.8.8.8)" ]
then
	mail -s "$(echo $mail_subject)" "$(echo $mail_to_list)" < /home/admin/logs/report.txt
fi 

