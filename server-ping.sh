#!/bin/bash

LOG_DIR="/home/pi/log"
mkdir -p $LOG_DIR
echo "Creating logging dir "$LOG_DIR

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

LOG_FILE=$LOG_DIR"/server_ping_log".$current_time
touch $LOG_FILE
echo "Creating Logging file "$LOG_FILE

ping 10.100.3.7 | tee -a $LOG_FILE

