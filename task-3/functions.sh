#!/bin/bash

# Task 3 - Function Library

check_disk_usage() {
    local threshold="$1"
    local disk_usage

    disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk usage: ${disk_usage}%"

    if [ "$disk_usage" -ge "$threshold" ]
    then
        echo "WARNING: Disk usage is above ${threshold}%."
        return 1
    else
        echo "OK: Disk usage is below ${threshold}%."
        return 0
    fi
}

check_memory_usage() {
    local threshold="$1"
    local memory_usage

    memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    echo "Memory usage: ${memory_usage}%"

    if [ "$memory_usage" -ge "$threshold" ]
    then
        echo "WARNING: Memory usage is above ${threshold}%."
        return 1
    else
        echo "OK: Memory usage is below ${threshold}%."
        return 0
    fi
}

print_status() {
    local resource="$1"
    local status="$2"

    echo "${resource} status: ${status}"
}
