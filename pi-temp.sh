#!/bin/bash

LOG_FILE = /home/pi/log/temp_$(date).log
mkdir -p $LOG_FILE

exec 3>&1 1>>$LOG_FILE 2>&1

while true; do
echo "-------------------------------------------"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date)" | tee /dev/fd/3
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)" | tee /dev/fd/3
echo "CPU => $(vcgencmd measure_clock arm)" | tee /dev/fd/3
echo "CPU => $((cpu/1000))'C" | tee /dev/fd/3
sleep 10
done
