#!/bin/bash

# Task 2 - System Health Monitor

health_status=0

echo "===== System Health Monitor ====="

echo
echo "Disk Usage:"

disk_info=$(df -h /)
echo "$disk_info"

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
memory_info=$(free -h)
echo "$memory_info"

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
# Count running processes
process_count=$(ps -e --no-headers | wc -l)

echo
echo "Total processes: $process_count"

if [ "$process_count" -ge 200 ]
then
    echo "WARNING: High number of running processes."
    health_status=1
else
    echo "OK: Process count is within normal range."
fi

echo
echo "Top Processes:"
process_info=$(ps aux --sort=-%cpu | head)
echo "$process_info"

echo

if [ "$health_status" -eq 0 ]
then
    echo "Overall Status: HEALTHY"
else
    echo "Overall Status: WARNING"
fi

echo "Health check completed."

exit "$health_status"
