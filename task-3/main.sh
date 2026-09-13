#!/bin/bash

# Task 3 - Refactor Using Functions

# Load external function library
source "$(dirname "$0")/functions.sh"

echo "===== Task 3 System Monitor ====="

# Accept optional command-line arguments
disk_threshold="${1:-80}"
memory_threshold="${2:-80}"

echo
echo "Using disk threshold: ${disk_threshold}%"
echo "Using memory threshold: ${memory_threshold}%"

echo
echo "Disk Check:"
check_disk_usage "$disk_threshold"

echo
echo "Memory Check:"
check_memory_usage "$memory_threshold"

echo
print_status "System" "MONITORED"
