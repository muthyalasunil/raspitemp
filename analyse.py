import csv
import os
import re
import statistics

dir_path = "/home/admin/logs"
directory = os.path.join(dir_path)

for root,dirs,files in os.walk(directory):
    for file in files:
       if file.endswith(".txt"):
           f = open(dir_path+'/'+file, 'r')
           list = []
           csvreader = csv.reader(f)
           for row in csvreader:
               list.append(int(re.findall(r'\d+', row[1].split(':')[1])[0]))
           print(u"{:s} - min: {:g}\u00b0C, max: {:g}\u00b0C,  mean: {:g}\u00b0C".format(file.split('.')[0], min(list), max(list), statistics.mean(list)))

           f.close()

