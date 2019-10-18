#!/bin/bash

LOG_DIR="/home/pi/log"
mkdir -p $LOG_DIR
echo "Creating logging dir "$LOG_DIR

LOG_FILE=$LOG_DIR"/temp_"$date".log"
touch $LOG_FILE
echo "Creating Logging file "$LOG_FILE

while true; do
echo "-------------------------------------------"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date)" | tee -a $LOG_FILE
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)" | tee -a $LOG_FILE
echo "CPU => $(vcgencmd measure_clock arm)" | tee -a $LOG_FILE
echo "CPU => $((cpu/1000))'C" | tee -a $LOG_FILE
sleep 10
done
