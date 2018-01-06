# 433weather_to_influx
Sending weather data from acurite sensors to influxdb 

To run this project you'll need
* influxdb
* something to view the influxdb data, I use grafana

Build the docker image

`docker build -t 433weather_to_influx:latest ./`

To run the image you'll need to pass in a couple environment vars and shared your 433MHz usb scanning device.

`docker run -d --device /dev/bus/usb -e influxdb_host=http://some.host -e influxdb_port=8086 433weather_to_influx:latest `
