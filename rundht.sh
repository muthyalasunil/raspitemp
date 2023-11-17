#!/bin/bash
cd /home/admin/Adafruit_Python_DHT/Adafruit_DHT
git pull -f
/usr/bin/python /home/admin/Adafruit_Python_DHT/Adafruit_DHT/dhttest.py >> /home/admin/logs/$(date +'%Y-%m-%d').log

