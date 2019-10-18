#!/bin/bash

LOG_DIR = /home/pi/log
LOG_FILE = /home/pi/log/temp_$(date).log
mkdir -p $LOG_DIR
touch $LOG_FILE

exec 3>&1 1>>$LOG_FILE 2>&1

while true; do
echo "-------------------------------------------"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date)" | tee -a $LOG_FILE
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)" | tee -a $LOG_FILE
echo "CPU => $(vcgencmd measure_clock arm)" | tee -a $LOG_FILE
echo "CPU => $((cpu/1000))'C" | tee -a $LOG_FILE
sleep 10
done
