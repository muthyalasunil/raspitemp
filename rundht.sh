#!/bin/bash
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/dhttest.py >> /home/admin/logs/$(date +'%d').log
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/analyse.py | tail -10 > /home/admin/logs/report.txt
hostname -I >> /home/admin/logs/report.txt
mail -s "report" muthyalasunil@yahoo.com < /home/admin/logs/report.txt
 

