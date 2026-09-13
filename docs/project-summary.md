# Shell Automation Lab — Project Summary

## Overview

This project demonstrates foundational Bash scripting and DevOps automation skills using Linux.

The project progresses from basic file and directory automation to system monitoring, reusable functions, input validation, safety controls, and professional project organisation.

## Tasks Completed

### Task 1 — Directory and File Automation

Created a Bash script that:

- Creates nested directories using `mkdir -p`
- Creates files automatically
- Uses variables and command substitution
- Accepts an optional command-line argument
- Creates timestamped files
- Uses conditional checks to avoid recreating the main report unnecessarily

### Task 2 — System Health Monitor

Created a Bash system health monitoring script that:

- Checks disk usage
- Checks memory usage
- Counts running processes
- Displays top processes
- Compares resource usage against thresholds
- Reports an overall HEALTHY or WARNING status
- Uses an exit status to indicate the health result

### Task 3 — Refactor Using Functions

Refactored monitoring functionality into reusable Bash functions.

The task demonstrates:

- Functions
- Local variables
- Positional parameters
- Command-line arguments
- External function libraries
- `source` for loading reusable functions

### Task 4 — Input Validation and Safety

Implemented Bash safety practices including:

- `set -e`
- `set -u`
- `set -o pipefail`
- Input validation
- Directory validation
- Temporary file handling
- `trap` for cleanup and interruption handling

### Task 5 — Documentation and Organisation

Organised the project into dedicated directories for tasks, documentation, and screenshots.

## Skills Demonstrated

- Linux command line
- Bash scripting
- Variables
- Conditional statements
- Loops
- Functions
- Command-line arguments
- Exit codes
- Input validation
- Error handling
- `trap`
- Git and GitHub
- Project documentation
- Repository organisation
