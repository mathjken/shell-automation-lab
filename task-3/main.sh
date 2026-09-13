#!/bin/bash

# Task 3 - Refactor Using Functions

source "$(dirname "$0")/functions.sh"

echo "===== Task 3 System Monitor ====="

disk_threshold="${1:-80}"
memory_threshold="${2:-80}"

check_disk_usage "$disk_threshold"
check_memory_usage "$memory_threshold"

print_status "System" "MONITORED"
