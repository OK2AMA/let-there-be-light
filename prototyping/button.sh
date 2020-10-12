#!/bin/sh
while true; do
  echo start
  mosquitto_sub -h 192.168.1.1 -p 1883 -t switch/btn1 | (read line;
  echo start_pipe
  echo $line
  line=${line:0:6}
  echo $line
  if [ "$line" == "toggle" ] ; then
    echo switch_off
    mosquitto_pub -h 192.168.1.1 -t cmnd/zar0/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas1/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas2/power -m 0 -q 1
    echo switch_off2
    echo -n -e "\x71\x24\x0f\xa4" | nc zar1 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar2 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar3 5577
    echo switch_off3
  else
    echo switch_on
    sleep 0.1
  fi
  echo end_of_if
  killall mosquitto_sub
  )
done

