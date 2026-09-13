#!/bin/bash

# Task 1 - Directory and File Automation

# Variables
base_path="$HOME/projects"
year=$(date +%Y)
timestamp=$(date +%Y%m%d_%H%M%S)
prefix="${1:-report}"

log_file="$base_path/automation.log"

# Create base directory
mkdir -p "$base_path"

# Create required directory structure
mkdir -p "$base_path/documents/$year"
mkdir -p "$base_path/reports/$year"
mkdir -p "$base_path/backup/$year"

# Create main report if it does not already exist
if [ -f "$base_path/reports/$year/$prefix.txt" ]
then
    echo "Report file already exists."
else
    touch "$base_path/reports/$year/$prefix.txt"
    echo "This is an automated report." > "$base_path/reports/$year/$prefix.txt"
    echo "Report file created."
fi

# Create multiple report files
for i in 1 2 3 4 5
do
    touch "$base_path/reports/$year/${prefix}_$i.txt"
done

# Create timestamped run file
touch "$base_path/reports/$year/run_$timestamp.txt"

# Record successful execution
echo "Report created successfully." >> "$log_file"
