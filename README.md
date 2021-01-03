# let-there-be-light
## Project overview
### Project idea

Automation of WiFi LED bulb control by MQTT(Tasmota firmware) or TCP direct control(Magic light LED bulb RGBCW 7W, origin firmware). 

### Project backrground

The project is written like BASH script for long-term sustainability on various platforms with the Linux operating system, without the need to compile the source code. Running on a router under OpenWRT is intended to increase reliability with low power consumption and good market availability.

### HW description

server - OpenWRT router
led bulb - E27 7W RBBCW Led bulb with ESP8266 (Magich Home Android app)
anything with MQTT in/out api


## Script execution

Script should be executed on OpenWRT device, it shall start with:

```
#!/bin/sh
```
