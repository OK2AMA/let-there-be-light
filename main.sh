#!/bin/sh
while true; do
  echo start
  mosquitto_sub -h 192.168.1.1 -p 1883 -t switch/btn | (read line;
  echo start_pipe
  echo $line
  line=${line:0:6}
  echo $line
  if [ "$line" == "btn1" ] ; then
    echo switch_off
    mosquitto_pub -h 192.168.1.1 -t cmnd/zar0/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas1/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas2/power -m 0 -q 1
    echo switch_off2
    echo -n -e "\x71\x24\x0f\xa4" | nc zar1 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar2 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar3 5577
    echo switch_off3
  elif [ "$line" == "btn2a" ] ; then
    mosquitto_pub -h 192.168.1.1 -t cmnd/zar0/power -m 1 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas1/power -m 1 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas2/power -m 1 -q 1
    echo -n -e "\x71\x23\x0f\xa3" | nc zar1 5577
    echo -n -e "\x71\x23\x0f\xa3" | nc zar2 5577
    echo -n -e "\x71\x23\x0f\xa3" | nc zar3 5577
    echo btn2a
  elif [ "$line" == "btn2b" ] ; then
    mosquitto_pub -h 192.168.1.1 -t cmnd/zar0/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas1/power -m 0 -q 1
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas2/power -m 0 -q 1
    echo -n -e "\x71\x24\x0f\xa4" | nc zar1 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar2 5577
    echo -n -e "\x71\x24\x0f\xa4" | nc zar3 5577
    echo btn2b
  elif [ "$line" == "btn2c" ] ; then
    mosquitto_pub -h 192.168.1.1 -t cmnd/zas1/power -m 1 -q 1
    echo -n -e "\x31\x00\x00\x00\x20\x00\x0f\x60" | nc zar1 5577
    echo -n -e "\x31\x00\x00\x00\x20\x00\x0f\x60" | nc zar2 5577
    echo btn2c
  elif [ "$line" == "btn2_e" ] ; then
    mosquitto_pub -h 192.168.1.1 -t cmnd/zar0/color1 -m "#00ff000000" -q 1
    echo -n -e "\x31\xff\x00\x00\x00\x00\xf0\x20" | nc zar1 5577
    echo -n -e "\x31\xff\x00\x00\x00\x00\xf0\x20" | nc zar2 5577
    echo btn2d
  elif [ "$line" == "btn2_d" ] ; then
    echo 123
  else
    echo switch_parse_error
  fi
  echo end_of_if
  killall mosquitto_sub
  )
done

