# Task 1 — Directory and File Automation

## Overview

This task focuses on using Bash scripting to automate directory and file creation in a Linux environment.
The objective was to move from manually creating directories and files to using a reusable Bash script that can safely be executed multiple times.

---

## Objectives

* Create a structured directory hierarchy automatically.
* Use variables and command substitution for dynamic paths and timestamps.
* Create files programmatically using `touch`.
* Write content to files using `echo`.
* Use conditional statements to handle existing files.
* Use loops to create multiple files.
* Accept command-line arguments.
* Make the script executable.
* Maintain an execution log.

---

## Directory Structure

The script creates the following structure:

```text
~/projects/
├── documents/
│   └── <year>/
├── reports/
│   └── <year>/
│       ├── report.txt
│       ├── report_1.txt
│       ├── report_2.txt
│       ├── report_3.txt
│       ├── report_4.txt
│       ├── report_5.txt
│       └── run_<timestamp>.txt
└── backup/
    └── <year>/

# Bash Concepts Used

## 1. Variables and Command Substitution

The script uses variables to avoid hard-coding paths and values:

```bash
base_path="$HOME/projects"

year=$(date +%Y)

timestamp=$(date +%Y%m%d_%H%M%S)

prefix="${1:-report}"

Command substitution allows the output of a command to be stored in a variable.

For example:

```bash
year=$(date +%Y)
stores the current year in the year variable.

### 2. Directory Creation

`mkdir -p` is used to create the required directory structure:

```bash
mkdir -p "$base_path/documents/$year"
mkdir -p "$base_path/reports/$year"
mkdir -p "$base_path/backup/$year"

The -p option also makes directory creation safe to repeat when the directories already exist.

### 3. Conditional File Creation

The script checks whether the main report already exists:

```bash
if [ -f "$base_path/reports/$year/$prefix.txt" ]
then
    echo "Report file already exists."
else
    touch "$base_path/reports/$year/$prefix.txt"
    echo "This is an automated report." > "$base_path/reports/$year/$prefix.txt"
    echo "Report file created."
fi

This prevents the script from treating an existing report as a new file every time it runs.

### 4. Loops

A `for` loop is used to create multiple report files:

```bash
for i in 1 2 3 4 5
do
    touch "$base_path/reports/$year/${prefix}_$i.txt"
done
````

The loop runs five times, with `i` taking the values `1`, `2`, `3`, `4`, and `5`.

```

````markdown
### 5. Command-Line Arguments

The script accepts an optional first argument:

```bash
prefix="${1:-report}"
````

For example:
```bash
./script.sh monthly
````
creates files using the monthly prefix:
monthly.txt
monthly_1.txt
monthly_2.txt
monthly_3.txt
monthly_4.txt
monthly_5.txt

If no argument is provided, the script uses report as the default prefix.
