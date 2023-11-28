#!/bin/bash

source /home/admin/.bashrc
cd /home/admin/Adafruit_Python_DHT/Adafruit_DHT
/home/admin/Adafruit_Python_DHT/Adafruit_DHT/git_refresh.sh

/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/dhttest.py >> /home/admin/logs/$(date +'%d').log
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/analyse.py | tail -10 > /home/admin/logs/report.txt
hostname -I >> /home/admin/logs/report.txt

if [ "$(ping -c1 8.8.8.8)" ]
then

	mail -s "$(cat ~/mail_subject)" "$(cat ~/mail_to_list)" < /home/admin/logs/report.txt
fi 

