# Task 3 - Refactor Using Functions

## Overview

This task refactors system monitoring code into reusable Bash functions and separates the functions from the main script.

The purpose of this task is to demonstrate modular scripting, command-line arguments, local variables, return codes, and the use of an external function library.

## Objectives

The main objectives were to:

* Create reusable Bash functions.
* Separate reusable functions from the main script.
* Use command-line arguments with `$1` and `$2`.
* Use `local` variables inside functions.
* Return success or failure status from functions.
* Load an external function library using `source`.
* Make the script easier to maintain and reuse.

## Project Structure

```text
task-3/
├── main.sh
├── functions.sh
└── README.md
```

### `functions.sh`

This file contains the reusable functions used by the main script.

The functions are:

* `check_disk_usage`
* `check_memory_usage`
* `print_status`

Keeping these functions in a separate file prevents the main script from becoming unnecessarily large and allows the functions to be reused by other scripts.

### `main.sh`

This is the main program. It loads the external function library, accepts optional command-line arguments, and calls the required functions.

## External Function Library

The following command loads the functions from `functions.sh`:

```bash
source "$(dirname "$0")/functions.sh"
```

`source` executes the contents of another Bash file in the current shell environment.

`$(dirname "$0")` ensures that Bash looks for `functions.sh` in the same directory as `main.sh`, rather than depending on the directory from which the script is executed.

This makes the script more portable and organised.

## Functions

### `check_disk_usage`

This function accepts a disk-usage threshold as an argument:

```bash
check_disk_usage "$disk_threshold"
```

Inside the function, the threshold is stored in a local variable:

```bash
local threshold="$1"
```

The function then obtains the current disk usage and compares it with the supplied threshold.

It returns:

```bash
return 0
```

when disk usage is below the threshold, and:

```bash
return 1
```

when the threshold has been reached or exceeded.

### `check_memory_usage`

This function works in the same way as the disk check but measures memory usage.

It receives the memory threshold as `$1`, stores it in a local variable, calculates current memory usage, and compares the result with the threshold.

### `print_status`

The `print_status` function demonstrates the use of multiple function arguments:

```bash
print_status "System" "MONITORED"
```

Inside the function:

```bash
local resource="$1"
local status="$2"
```

Here:

* `$1` represents the first argument.
* `$2` represents the second argument.
* `local` ensures that these variables belong to the function and do not unnecessarily affect variables outside it.

## Command-Line Arguments

The main script accepts two optional arguments:

```bash
./main.sh <disk_threshold> <memory_threshold>
```

For example:

```bash
./main.sh 70 60
```

This sets:

* Disk threshold = 70%
* Memory threshold = 60%

The values are captured using:

```bash
disk_threshold="${1:-80}"
memory_threshold="${2:-80}"
```

This means that if no values are supplied, the script uses `80%` as the default threshold for both disk and memory.

For example:

```bash
./main.sh
```

uses:

```text
Disk threshold: 80%
Memory threshold: 80%
```

While:

```bash
./main.sh 70 60
```

uses:

```text
Disk threshold: 70%
Memory threshold: 60%
```

## Local Variables

The `local` keyword is used inside functions to create variables that are limited to that function's scope.

For example:

```bash
local threshold="$1"
local disk_usage
```

This helps prevent accidental changes to variables used elsewhere in the script and makes functions more predictable and reusable.

## Return Codes

The monitoring functions use return codes to communicate whether a check succeeded.

```bash
return 0
```

indicates that the check passed.

```bash
return 1
```

indicates that the threshold was exceeded.

Bash uses `0` to represent success and non-zero values to represent failure or another condition.

This allows the result of a function to be used in conditional logic in larger automation scripts.

## Testing

The scripts were first checked for syntax errors:

```bash
bash -n task-3/functions.sh
bash -n task-3/main.sh
```

No output indicated that the scripts passed the syntax checks.

### Test 1 - Default thresholds

```bash
./task-3/main.sh
```

Expected behaviour:

```text
Using disk threshold: 80%
Using memory threshold: 80%
```

The script then performs the disk and memory checks and reports the system status.

### Test 2 - Custom thresholds

```bash
./task-3/main.sh 70 60
```

Expected behaviour:

```text
Using disk threshold: 70%
Using memory threshold: 60%
```

This demonstrates that command-line arguments are being passed correctly to the main script.

## Key Bash Concepts Demonstrated

This task demonstrates:

* Functions
* Function arguments
* `$1` and `$2`
* `local` variables
* `return` codes
* `source`
* Command substitution
* Default command-line arguments
* Modular script design
* Separation of reusable code from program logic

## Learning Outcome

This task demonstrated how a Bash script can be refactored from a single block of code into smaller, reusable functions.

Separating `functions.sh` from `main.sh` improves organisation, readability, maintainability, and reusability. Command-line arguments also make the monitoring thresholds configurable without modifying the script itself.

