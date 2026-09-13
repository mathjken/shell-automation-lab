#!/bin/bash

# Task 2 - System Health Monitor

health_status=0

echo "===== System Health Monitor ====="

echo
echo "Disk Usage:"
df -h /

# Get disk usage percentage for the root filesystem
disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo
echo "Disk usage is currently: ${disk_usage}%"

if [ "$disk_usage" -ge 80 ]
then
    echo "WARNING: Disk usage is above 80%."
    health_status=1
else
    echo "OK: Disk usage is below 80%."
fi

echo
echo "Memory Usage:"
free -h

# Get memory usage percentage
memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo
echo "Memory usage is currently: ${memory_usage}%"

if [ "$memory_usage" -ge 80 ]
then
    echo "WARNING: Memory usage is above 80%."
    health_status=1
else
    echo "OK: Memory usage is below 80%."
fi

echo
echo "Top Processes:"
ps aux --sort=-%cpu | head

echo
echo "Health check completed."

exit "$health_status"
