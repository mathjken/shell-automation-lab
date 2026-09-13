````markdown id="t4readme"
# Task 4 - Input Validation and Safety

## Overview

This task focuses on making a Bash script safer and more reliable by implementing strict error handling, input validation, and cleanup procedures.

The script validates user input before continuing, uses Bash safety options to detect errors, and uses `trap` to ensure temporary files are cleaned up when the script exits or is interrupted.

## Objectives

The main objectives were to:

- Use `set -e` to stop execution when a command fails.
- Use `set -u` to detect the use of unset variables.
- Use `set -o pipefail` to detect failures within pipelines.
- Validate that the user provides the required input.
- Validate that the supplied path is an existing directory.
- Use quoted variables to handle paths safely.
- Use `trap` to perform cleanup when the script exits or is interrupted.
- Create and remove a temporary file safely.
- Provide clear error and usage messages.

## Project Structure

```text
task-4/
├── safe_script.sh
└── README.md
````

## Bash Safety Options

The script uses three Bash safety options:

```bash
set -e
set -u
set -o pipefail
```

### `set -e`

`set -e` causes the script to stop when a command returns a non-zero exit status.

This helps prevent the script from continuing after an unexpected command failure.

### `set -u`

`set -u` treats the use of an unset variable as an error.

This helps identify mistakes involving variables that have not been defined.

### `set -o pipefail`

`set -o pipefail` causes a pipeline to return a failure status if any command within the pipeline fails.

This is useful when commands are connected using the pipe (`|`) operator because it prevents an earlier failure from being hidden by a later successful command.

Together, these options provide stricter error handling and make the script safer to run.

## Input Validation

The script requires the user to provide a directory path.

First, it checks whether an argument was supplied:

```bash
if [ "$#" -lt 1 ]
then
    echo "Usage: $0 <directory>"
    exit 1
fi
```

`$#` contains the number of command-line arguments supplied to the script.

If no argument is provided, the script displays the correct usage format and exits with status `1`.

The script then stores the supplied directory in a variable:

```bash
target_dir="$1"
```

It validates that the supplied path is an existing directory:

```bash
if [ ! -d "$target_dir" ]
then
    echo "ERROR: Directory does not exist: $target_dir"
    exit 1
fi
```

The `-d` test checks whether the supplied path exists and is a directory.

The `!` operator reverses the condition, so the error is displayed when the path is not a valid directory.

## Quoting User Input

The script uses double quotes around variables containing user-provided paths:

```bash
if [ ! -d "$target_dir" ]
```

and:

```bash
echo "Target directory: $target_dir"
```

Quoting variables helps prevent problems when paths contain spaces or other special characters.

For example, a path such as:

```text
/home/uzoma_linux/my projects
```

can be handled safely when the variable is quoted.

## Temporary File

The script creates a temporary file:

```bash
temp_file="/tmp/task4_$$.tmp"
```

`$$` represents the process ID of the current Bash shell.

This creates a temporary filename that is different for each execution.

The file is created using:

```bash
echo "Task 4 safety test" > "$temp_file"
```

The temporary file is used to demonstrate safe creation and cleanup.

## Cleanup Function

The script defines a dedicated cleanup function:

```bash
cleanup() {
    echo
    echo "Cleaning up..."

    if [ -f "$temp_file" ]
    then
        rm -f "$temp_file"
        echo "Temporary file removed."
    fi
}
```

The function checks whether the temporary file exists before attempting to remove it.

The `-f` test verifies that the path refers to a regular file.

The `rm -f` command removes the temporary file without prompting.

Using a dedicated cleanup function keeps cleanup logic organised and reusable.

## Trap and Signal Handling

The script uses:

```bash
trap cleanup EXIT INT TERM
```

This tells Bash to run the `cleanup` function when the script:

* exits normally (`EXIT`);
* receives an interrupt signal such as `Ctrl+C` (`INT`);
* receives a termination signal (`TERM`).

Using `trap` ensures that temporary resources are cleaned up even when the script is interrupted.

This is an important safety practice in automation because temporary files should not be left behind unnecessarily.

## Exit Status

The script uses:

```bash
exit 1
```

when an input validation check fails.

In Bash:

* `0` normally represents success.
* A non-zero value represents failure or an error condition.

For example, if no directory is supplied, the script exits with status `1`.

The cleanup function still runs because it is registered with the `EXIT` trap.

## Testing

The script was checked for syntax errors before execution:

```bash
bash -n task-4/safe_script.sh
```

No output indicated that the script passed the syntax check.

### Test 1 - No argument supplied

The script was executed without a directory:

```bash
./task-4/safe_script.sh
```

Expected behaviour:

```text
Usage: ./task-4/safe_script.sh <directory>
```

The script exits with an error status and runs the cleanup function.

### Test 2 - Invalid directory

The script was tested with a directory that does not exist:

```bash
./task-4/safe_script.sh /does/not/exist
```

Expected behaviour:

```text
ERROR: Directory does not exist: /does/not/exist
```

The script stops rather than continuing with an invalid path, and the cleanup function runs.

### Test 3 - Valid directory

The script was tested with the user's home directory:

```bash
./task-4/safe_script.sh "$HOME"
```

Expected behaviour:

```text
Target directory: /home/uzoma_linux
Temporary file created: /tmp/task4_<process_id>.tmp
Safety checks passed.

Cleaning up...
Temporary file removed.
```

This confirms that valid input is accepted, the temporary file is created successfully, and the cleanup function removes it when the script exits.

## Safety Features Demonstrated

The script demonstrates the following Bash safety practices:

| Safety Feature    | Purpose                                        |
| ----------------- | ---------------------------------------------- |
| `set -e`          | Stops execution after command failures         |
| `set -u`          | Detects unset variables                        |
| `set -o pipefail` | Detects failures within pipelines              |
| `$#` validation   | Checks that required input was supplied        |
| `-d` test         | Verifies that the supplied path is a directory |
| Quoted variables  | Handles paths containing spaces safely         |
| `exit 1`          | Reports validation failure                     |
| `trap`            | Runs cleanup during exit or interruption       |
| Cleanup function  | Removes temporary resources                    |
| `rm -f`           | Removes the temporary file safely              |

## Key Bash Concepts Demonstrated

This task demonstrates:

* Strict Bash error handling
* Input validation
* Command-line arguments
* Exit statuses
* Conditional statements
* File tests
* Variable quoting
* Temporary files
* Functions
* `trap`
* Signal handling
* Resource cleanup

## Learning Outcome

This task demonstrated how Bash scripts can be made safer by validating input and handling errors before continuing execution.

The use of `set -e`, `set -u`, and `set -o pipefail` provides stricter error detection, while input validation prevents the script from operating on invalid paths.

The `trap` mechanism and cleanup function also demonstrate responsible resource management by ensuring that temporary files are removed when the script exits or is interrupted.

````

After saving it with **Ctrl+O → Enter → Ctrl+X**, don't commit yet.

Run:

```bash
cat task-4/README.md
````

That lets us verify the file was saved correctly before we commit both documentation improvements.

