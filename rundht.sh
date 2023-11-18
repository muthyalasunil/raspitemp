#!/bin/bash
cd /home/admin/Adafruit_Python_DHT/Adafruit_DHT
git checkout
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/dhttest.py >> /home/admin/logs/$(date +'%Y-%m-%d').log
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/analyse.py | tail -10 > /home/admin/logs/report.txt
