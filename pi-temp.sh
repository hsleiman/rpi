#!/bin/bash

while true; do
echo "-------------------------------------------"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "$(date)"
echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
echo "CPU => $(vcgencmd measure_clock arm)"
echo "CPU => $((cpu/1000))'C"
sleep 10
done
