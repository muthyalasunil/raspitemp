import sys
import http.client
import requests
import datetime

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'}

def get_data(client_ip):

	response = requests.get(client_ip, headers=headers, timeout=10)
	return response.status_code, response.text


if __name__=="__main__":

	url = 'http://IP_ADDRESS:80'
	now = datetime.datetime.now()
	log_file = open(sys.argv[2], "a")
	err_file = open(sys.argv[3], "w")

	if len(sys.argv) > 1:
		url = url.replace('IP_ADDRESS', sys.argv[1])+'/temperature'
	else:
		url = url.replace('IP_ADDRESS', '192.168.2.148')+'/temperature'

	#print(url)
	try:
		status, data = get_data(url.replace('IP_ADDRESS', '192.168.2.148')+'/temperature')    
		if status == 200:
			log_file.write(now.strftime("%Y-%m-%d %H:%M:%S, ") + data+"\n")
	
	except:
		err_file.write(now.strftime("%Y-%m-%d %H:%M:%S, ") + 'error: '+url+'\n')
	finally:
		log_file.close()
		err_file.close()







