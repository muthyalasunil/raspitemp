import Adafruit_DHT
import time
import datetime
import sys

sensor = Adafruit_DHT.DHT11
pin = 4
while True:
	humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
	date = datetime.datetime.fromtimestamp(time.time()).replace(microsecond=0).isoformat()
	print(u"Date: {:s}, Temperature: {:g}\u00b0C, Humidity: {:g}%".format(date, temperature, humidity))

	time.sleep(15*60)

