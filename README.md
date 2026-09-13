# Shell Automation Lab

## Overview

This project demonstrates foundational Bash scripting and DevOps automation skills in a Linux environment.

The project progresses from basic directory and file automation to system monitoring, reusable functions, input validation, safety controls, and professional repository organisation.

## Project Objectives

- Automate repetitive Linux tasks using Bash
- Monitor basic system health
- Build reusable Bash functions
- Apply input validation and scripting safety practices
- Use Git and GitHub to manage the project
- Organise scripts and documentation professionally

## Tasks

### Task 1 — Directory and File Automation

Automates the creation of directories and files using Bash.

Key concepts:

- Variables
- `mkdir -p`
- `touch`
- Conditional statements
- Loops
- Command-line arguments
- Timestamps

### Task 2 — System Health Monitor

Monitors basic system resources.

Key concepts:

- Disk usage
- Memory usage
- Process monitoring
- Thresholds
- Variables
- Exit status

### Task 3 — Refactor Using Functions

Refactors monitoring functionality into reusable functions.

Key concepts:

- Functions
- `local` variables
- Positional parameters
- `$1` and `$2`
- External function libraries
- `source`

### Task 4 — Input Validation and Safety

Applies Bash safety and validation techniques.

Key concepts:

- `set -e`
- `set -u`
- `set -o pipefail`
- Input validation
- Directory validation
- Temporary files
- `trap`
- Cleanup

### Task 5 — Documentation and Organisation

Organises the project into a professional repository structure.

Key concepts:

- Documentation
- Repository organisation
- Evidence and screenshots
- Git project management

## Repository Structure

```text
shell-automation-lab/
├── README.md
├── task-1/
│   ├── README.md
│   └── script.sh
├── task-2/
│   └── health_monitor.sh
├── task-3/
│   ├── main.sh
│   └── functions.sh
├── task-4/
│   └── safe_script.sh
├── task-5/
│   └── README.md
├── docs/
│   └── project-summary.md
└── screenshots/
