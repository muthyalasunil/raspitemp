import csv
import os
import re
import statistics
import sys


def analyse(adj_error):
    dir_path = "/home/admin/logs"
    directory = os.path.join(dir_path)

    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".log"):
                f = open(dir_path + '/' + file, 'r')
                list = []
                csvreader = csv.reader(f)
                for row in csvreader:
                    list.append(int(re.findall(r'\d+', row[1].split(':')[1])[0])-adj_error)
                print(u"{:s} - min: {:g}\u00b0C, max: {:g}\u00b0C,  mean: {:g}\u00b0C, median: {:g}\u00b0C".format(file.split('.')[0],
                                                                                              min(list), max(list),
                                                                                              statistics.mean(list), statistics.median(list)))

                f.close()


if __name__ == "__main__":
    adj_error = 0
    if len(sys.argv) > 1:
        adj_error = int(sys.argv[1])
    analyse(adj_error)

