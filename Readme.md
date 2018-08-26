# MQTT2PostgresBridge

MQTT2PostgresBridge is a project to connect a locally running broker to a Postgres database and store the messages in a database table. The project was written and tested in Python 3.7.

[![Build status](https://ci.appveyor.com/api/projects/status/bhqkj3oacr7jix8x?svg=true)](https://ci.appveyor.com/project/SeppPenner/mqtt2postgresbridge)
[![GitHub issues](https://img.shields.io/github/issues/SeppPenner/MQTT2PostgresBridge.svg)](https://github.com/SeppPenner/MQTT2PostgresBridge/issues)
[![GitHub forks](https://img.shields.io/github/forks/SeppPenner/MQTT2PostgresBridge.svg)](https://github.com/SeppPenner/MQTT2PostgresBridge/network)
[![GitHub stars](https://img.shields.io/github/stars/SeppPenner/MQTT2PostgresBridge.svg)](https://github.com/SeppPenner/MQTT2PostgresBridge/stargazers)
[![GitHub license](https://img.shields.io/badge/license-AGPL-blue.svg)](https://raw.githubusercontent.com/SeppPenner/MQTT2PostgresBridge/master/License.txt)

## Adjust your settings:

* Adjust the broker to the address you want to use: `broker_source`
* Add your custom filters to `filterMessage()` if you want to filter messages
* Adjust your credentials (uncomment if anonymous): 

```python
client_source.username_pw_set("mqtt", "IoT")
```

* Adjust your PostgreSQL credentials:

```python
DatabaseHostName = 'YourHost'
DatabaseUserName = 'YourUser'
DatabasePassword = 'YourPassword'
DatabasePort = 5432
```

* Run the script `SetupDatabase.sql` on your database to setup the database correctly

* Add filters to the bridging like described in the `bridgeFiltering.py` file if needed:

```python
def filterMessage(payload, topic, qos):
	"Filters the messages depending on the configuration for the attributes payload, topic and QoS. 'True' means that the message is not forwarded."
	# Examples below:
	if(payload == "10 %"):
		print('Filtered: payload == "10 %"')
		return True
	if(topic == "humidity" and qos == 0):
		print('Filtered: topic == "humidity" and qos == 0')
		return True
	if(topic == "temperature" or qos == 2):
		print('Filtered: topic == "temperature" or qos == 2')
		return True
	#Add your filters here
```

## Setup on the Raspberry Pi

```bash
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install paho-mqtt
sudo pip3 install psycopg2
```

or

```bash
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install -r requirements.txt
```

## Running the programms:

```bash
python3 bridge.py
python3 bridgeFiltering.py
```

## Installing the latest version of Python (Currently 3.7.0) on the Raspberry Pi:

https://gist.github.com/SeppPenner/6a5a30ebc8f79936fa136c524417761d

## Paho MQTT client documentation

* https://pypi.org/project/paho-mqtt/
* https://www.hivemq.com/blog/mqtt-client-library-paho-python

## Postgres client documentation

* http://www.postgresqltutorial.com/postgresql-python/connect/
* http://www.postgresqltutorial.com/postgresql-python/call-stored-procedures/

## See also

* [MQTT2AWSS3Bridge](https://github.com/SeppPenner/MQTT2AWSS3Bridge)
* [MQTT2MySQLBridge](https://github.com/SeppPenner/MQTT2MySQLBridge)
* [MQTT2MQTTBridge](https://github.com/SeppPenner/MQTT2MQTTBridge)