#!/bin/bash

user=$(whoami)

ip_adddress="kuba_phone"

while true; do
if ping -c 1 $ip_adddress &> /dev/null 
    then
        mosquitto_pub -h 192.168.1.1 -p 1883 -t cmnd/koule_sonoff/power -m 1 -q 1
        echo "ping is OK"
    else
        mosquitto_pub -h 192.168.1.1 -p 1883  -t cmnd/koule_sonoff/power -m 0 -q 1
        echo "ping is fail"
    fi
    sleep 1
done

# echo -n -e "\x71\x23\x0f\xa3" | nc 192.168.1.181 5577
# echo -n -e "\x71\x24\x0f\xa4" | nc 192.168.1.181 5577
# mosquitto_pub -t cmnd/koule_sonoff/power -m 1 -q 1
# mosquitto_pub -t cmnd/koule_sonoff/power -m toggle -q 1
# mosquitto_pub -t cmnd/koule_sonoff/power -m toggle -q 1

