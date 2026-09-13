#!/bin/bash

# Task 4 - Input Validation and Safety

set -e
set -u
set -o pipefail

# Temporary file used during the script
temp_file="/tmp/task4_$$.tmp"

# Cleanup function
cleanup() {
    echo
    echo "Cleaning up..."

    if [ -f "$temp_file" ]
    then
        rm -f "$temp_file"
        echo "Temporary file removed."
    fi
}

# Run cleanup when the script exits or is interrupted
trap cleanup EXIT INT TERM

# Validate input
if [ "$#" -lt 1 ]
then
    echo "Usage: $0 <directory>"
    exit 1
fi

target_dir="$1"

# Validate that the supplied path exists
if [ ! -d "$target_dir" ]
then
    echo "ERROR: Directory does not exist: $target_dir"
    exit 1
fi

echo "Target directory: $target_dir"

# Create temporary file
echo "Task 4 safety test" > "$temp_file"

echo "Temporary file created: $temp_file"

echo "Safety checks passed."
