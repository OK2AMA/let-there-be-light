echo -n -e "\x71\x23\x0f\xa3" | nc 192.168.1.181 5577
echo -n -e "\x71\x24\x0f\xa4" | nc 192.168.1.181 5577
mosquitto_pub -t cmnd/koule_sonoff/power -m 1 -q 1

