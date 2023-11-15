import Adafruit_DHT
import time
import datetime
import sys

sensor = Adafruit_DHT.DHT11
pin = 4


def measure(adj_error):
    humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
    date = datetime.datetime.fromtimestamp(time.time()).replace(microsecond=0).isoformat()
    print(u"{:s}, Temperature: {:g}\u00b0C, Humidity: {:g}%".format(date, temperature - adj_error, humidity))
    # time.sleep(15*60)


if __name__ == "__main__":
    adj_error = 0
    if len(sys.argv) > 1:
        adj_error = int(sys.argv[1])
    measure(adj_error)
