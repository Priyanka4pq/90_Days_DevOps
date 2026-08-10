# Shell Scripting Cheat Sheet

A practical quick-reference guide for Bash scripting and DevOps tasks.

---

# 1. Quick Reference

| Topic          | Syntax                    | Example                            |
| -------------- | ------------------------- | ---------------------------------- |
| Variable       | `VAR="value"`             | `NAME="DevOps"`                    |
| Argument       | `$1`, `$2`                | `./script.sh arg1`                 |
| Argument count | `$#`                      | `echo "$#"`                        |
| All arguments  | `$@`                      | `for arg in "$@"; do`              |
| Script name    | `$0`                      | `echo "$0"`                        |
| Exit status    | `$?`                      | `echo "$?"`                        |
| If             | `if [ condition ]; then`  | `if [ -f file ]; then`             |
| For loop       | `for i in list; do`       | `for i in 1 2 3; do`               |
| While loop     | `while [ condition ]; do` | `while [ "$count" -lt 5 ]; do`     |
| Function       | `name() { ... }`          | `greet() { echo "Hi"; }`           |
| Grep           | `grep pattern file`       | `grep -i "error" log.txt`          |
| Awk            | `awk '{print $1}' file`   | `awk -F: '{print $1}' /etc/passwd` |
| Sed            | `sed 's/old/new/g' file`  | `sed -i 's/foo/bar/g' config.txt`  |
| Sort           | `sort file`               | `sort -rn numbers.txt`             |
| Count          | `wc -l file`              | `wc -l access.log`                 |

---

# 2. Basics

## 2.1 Shebang

```bash
#!/bin/bash
```

Tells Linux to execute the script using Bash.

Example:

```bash
#!/bin/bash

echo "Hello DevOps"
```

---

## 2.2 Running a Script

Give execute permission:

```bash
chmod +x script.sh
```

Run it:

```bash
./script.sh
```

You can also run it without execute permission:

```bash
bash script.sh
```

Difference:

* `./script.sh` requires execute permission and uses the script's shebang.
* `bash script.sh` explicitly runs the script using Bash.

---

## 2.3 Comments

Single-line comment:

```bash
# This is a comment
echo "Hello"
```

Inline comment:

```bash
echo "Hello"  # Print greeting
```

Comments are ignored by Bash.

---

# 3. Variables

Declare a variable:

```bash
NAME="Priyanka"
```

Use a variable:

```bash
echo "$NAME"
```

There must be **no spaces** around `=`:

```bash
NAME="Priyanka"     # Correct
NAME = "Priyanka"   # Wrong
```

### Variable quoting

```bash
NAME="Priyanka"

echo $NAME
echo "$NAME"
echo '$NAME'
```

Output:

```text
Priyanka
Priyanka
$NAME
```

* `$NAME` → variable expansion.
* `"$NAME"` → variable expansion while preserving spaces safely.
* `'$NAME'` → literal `$NAME`; variables are not expanded inside single quotes.

Prefer:

```bash
echo "$NAME"
```

---

# 4. Reading User Input

Use `read`:

```bash
read -p "Enter your name: " NAME

echo "Hello $NAME"
```

Example:

```text
Enter your name: Priyanka
Hello Priyanka
```

---

# 5. Command-Line Arguments

Suppose:

```bash
./script.sh hello world
```

Then:

```bash
$0
```

Script name:

```text
./script.sh
```

```bash
$1
```

First argument:

```text
hello
```

```bash
$2
```

Second argument:

```text
world
```

```bash
$#
```

Number of arguments:

```text
2
```

```bash
$@
```

All arguments:

```text
hello world
```

```bash
$?
```

Exit status of the previous command.

Example:

```bash
ls /tmp
echo "$?"
```

Usually:

```text
0
```

means success.

Non-zero usually means failure.

---

# 6. String Comparisons

## Equal

```bash
if [ "$NAME" = "Priyanka" ]; then
    echo "Name matched"
fi
```

## Not equal

```bash
if [ "$NAME" != "Priyanka" ]; then
    echo "Name does not match"
fi
```

## Empty string

```bash
if [ -z "$NAME" ]; then
    echo "Name is empty"
fi
```

## Non-empty string

```bash
if [ -n "$NAME" ]; then
    echo "Name is not empty"
fi
```

---

# 7. Integer Comparisons

| Operator | Meaning               |
| -------- | --------------------- |
| `-eq`    | Equal                 |
| `-ne`    | Not equal             |
| `-lt`    | Less than             |
| `-gt`    | Greater than          |
| `-le`    | Less than or equal    |
| `-ge`    | Greater than or equal |

Example:

```bash
AGE=22

if [ "$AGE" -ge 18 ]; then
    echo "Adult"
fi
```

---

# 8. File Test Operators

| Operator | Meaning                      |
| -------- | ---------------------------- |
| `-f`     | Regular file exists          |
| `-d`     | Directory exists             |
| `-e`     | File or directory exists     |
| `-r`     | File is readable             |
| `-w`     | File is writable             |
| `-x`     | File is executable           |
| `-s`     | File exists and is not empty |

Examples:

```bash
if [ -f "$FILE" ]; then
    echo "File exists"
fi
```

```bash
if [ -d "$DIR" ]; then
    echo "Directory exists"
fi
```

```bash
if [ -x "$SCRIPT" ]; then
    echo "Script is executable"
fi
```

---

# 9. If / Elif / Else

Syntax:

```bash
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

Example:

```bash
MARKS=80

if [ "$MARKS" -ge 90 ]; then
    echo "A"
elif [ "$MARKS" -ge 60 ]; then
    echo "B"
else
    echo "C"
fi
```

---

# 10. Logical Operators

## AND — `&&`

The second command runs only if the first succeeds.

```bash
mkdir backup && echo "Backup directory created"
```

## OR — `||`

The second command runs if the first fails.

```bash
mkdir backup || echo "Failed to create directory"
```

## NOT — `!`

Negates a condition:

```bash
if [ ! -f "$FILE" ]; then
    echo "File does not exist"
fi
```

---

# 11. Case Statement

Useful when checking multiple fixed options.

Syntax:

```bash
case "$CHOICE" in
    option1)
        commands
        ;;
    option2)
        commands
        ;;
    *)
        default commands
        ;;
esac
```

Example:

```bash
read -p "Enter choice: " CHOICE

case "$CHOICE" in
    start)
        echo "Starting service"
        ;;
    stop)
        echo "Stopping service"
        ;;
    restart)
        echo "Restarting service"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
```

---

# 12. For Loops

## List-based loop

```bash
for name in Alice Bob Charlie
do
    echo "$name"
done
```

Output:

```text
Alice
Bob
Charlie
```

## C-style loop

```bash
for ((i=1; i<=5; i++))
do
    echo "$i"
done
```

---

# 13. While Loop

Runs while the condition is true.

```bash
count=1

while [ "$count" -le 5 ]
do
    echo "$count"
    ((count++))
done
```

---

# 14. Until Loop

Runs until the condition becomes true.

```bash
count=1

until [ "$count" -gt 5 ]
do
    echo "$count"
    ((count++))
done
```

---

# 15. Break and Continue

## break

Stops the loop completely.

```bash
for i in 1 2 3 4 5
do
    if [ "$i" -eq 3 ]; then
        break
    fi

    echo "$i"
done
```

Output:

```text
1
2
```

## continue

Skips the current iteration.

```bash
for i in 1 2 3 4 5
do
    if [ "$i" -eq 3 ]; then
        continue
    fi

    echo "$i"
done
```

Output:

```text
1
2
4
5
```

---

# 16. Looping Over Files

```bash
for file in *.log
do
    echo "Processing $file"
done
```

Useful for processing multiple log files.

---

# 17. Looping Over Command Output

Use `while read`:

```bash
cat users.txt | while read line
do
    echo "$line"
done
```

Better:

```bash
while read -r line
do
    echo "$line"
done < users.txt
```

`-r` prevents backslashes from being interpreted as escape characters.

---

# 18. Functions

Define a function:

```bash
greet() {
    echo "Hello DevOps"
}
```

Call it:

```bash
greet
```

Output:

```text
Hello DevOps
```

---

# 19. Function Arguments

Function arguments use `$1`, `$2`, etc.

```bash
greet() {
    echo "Hello $1"
}

greet "Priyanka"
```

Output:

```text
Hello Priyanka
```

Example with two arguments:

```bash
add() {
    echo "$(($1 + $2))"
}

add 10 20
```

Output:

```text
30
```

---

# 20. Return Values

## `return`

`return` sends an **exit status**, normally from `0` to `255`.

```bash
check_file() {
    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}

check_file "test.txt"

if [ "$?" -eq 0 ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

## `echo`

Use `echo` when the function needs to return actual data.

```bash
get_name() {
    echo "Priyanka"
}

NAME=$(get_name)

echo "$NAME"
```

Important:

```text
return → status code
echo   → actual output/data
```

---

# 21. Local Variables

Use `local` inside functions:

```bash
greet() {
    local NAME="Priyanka"
    echo "Hello $NAME"
}

greet
```

`local` prevents the variable from being available globally outside the function.

---

# 22. grep

`grep` searches for matching text.

```bash
grep "ERROR" app.log
```

### Useful options

```bash
grep -i "error" app.log
```

`-i` → ignore case.

```bash
grep -r "ERROR" /var/log/
```

`-r` → recursive search.

```bash
grep -c "ERROR" app.log
```

`-c` → count matching lines.

```bash
grep -n "ERROR" app.log
```

`-n` → show line numbers.

```bash
grep -v "INFO" app.log
```

`-v` → show lines that do not match.

```bash
grep -E "ERROR|Failed" app.log
```

`-E` → extended regular expressions; `|` means OR.

---

# 23. awk

`awk` is useful for extracting and processing columns.

Example:

```bash
awk '{print $1}' file.txt
```

Print first column.

```bash
awk '{print $1, $3}' file.txt
```

Print first and third columns.

### Field separator

```bash
awk -F: '{print $1}' /etc/passwd
```

`-F:` tells `awk` that `:` is the delimiter.

### Pattern

```bash
awk '$3 > 80 {print $1}' marks.txt
```

Print the first column when column 3 is greater than 80.

### BEGIN and END

```bash
awk 'BEGIN {print "START"} {print $1} END {print "DONE"}' file.txt
```

* `BEGIN` runs before processing.
* Main block runs for each line.
* `END` runs after processing.

---

# 24. sed

`sed` is mainly used for searching, replacing, and deleting text.

### Substitute

```bash
sed 's/old/new/g' file.txt
```

Replace all occurrences of `old` with `new`.

### Delete a line

```bash
sed '3d' file.txt
```

Deletes line 3 from the output.

### Delete empty lines

```bash
sed '/^$/d' file.txt
```

### In-place edit

```bash
sed -i 's/old/new/g' file.txt
```

Actually modifies the file.

---

# 25. cut

Extract columns or characters.

```bash
cut -d: -f1 /etc/passwd
```

* `-d:` → delimiter is `:`
* `-f1` → first field

Example CSV:

```text
Priyanka,DevOps,22
```

```bash
cut -d',' -f1 users.csv
```

Output:

```text
Priyanka
```

---

# 26. sort

Alphabetical sorting:

```bash
sort names.txt
```

Numerical sorting:

```bash
sort -n numbers.txt
```

Reverse:

```bash
sort -r names.txt
```

Numerical reverse:

```bash
sort -rn numbers.txt
```

Unique sorting:

```bash
sort -u names.txt
```

---

# 27. uniq

Remove duplicate adjacent lines:

```bash
uniq file.txt
```

Count duplicates:

```bash
uniq -c file.txt
```

Common pattern:

```bash
sort file.txt | uniq -c
```

This is important because `uniq` normally works on adjacent duplicate lines.

---

# 28. tr

Translate characters:

```bash
echo "hello" | tr 'a-z' 'A-Z'
```

Output:

```text
HELLO
```

Delete characters:

```bash
echo "123abc456" | tr -d '0-9'
```

Output:

```text
abc
```

---

# 29. wc

Count lines:

```bash
wc -l file.txt
```

Count words:

```bash
wc -w file.txt
```

Count characters:

```bash
wc -c file.txt
```

Only get the line count:

```bash
TOTAL_LINES=$(wc -l < file.txt)
```

---

# 30. head and tail

First 10 lines:

```bash
head file.txt
```

First 5 lines:

```bash
head -5 file.txt
```

Last 10 lines:

```bash
tail file.txt
```

Last 5 lines:

```bash
tail -5 file.txt
```

Follow a log in real time:

```bash
tail -f app.log
```

Follow and filter errors:

```bash
tail -f app.log | grep "ERROR"
```

---

# 31. Useful One-Liners

## Find files older than 7 days

```bash
find /path/to/logs -type f -mtime +7
```

Delete them:

```bash
find /path/to/logs -type f -mtime +7 -delete
```

Be careful with `-delete` because deleted files cannot normally be recovered.

---

## Count lines in all `.log` files

```bash
wc -l *.log
```

Total number of lines:

```bash
cat *.log | wc -l
```

---

## Replace a string in multiple files

```bash
sed -i 's/old/new/g' *.conf
```

---

## Check whether a service is running

```bash
systemctl is-active nginx
```

Or:

```bash
systemctl status nginx
```

---

## Check disk usage and alert

```bash
df -h
```

Check root filesystem percentage:

```bash
df -h / | awk 'NR==2 {print $5}'
```

Simple alert:

```bash
USAGE=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%"
fi
```

---

## Parse CSV

Given:

```text
Priyanka,DevOps,India
Rahul,Developer,India
```

Extract first column:

```bash
cut -d',' -f1 users.csv
```

---

## Monitor logs for errors

```bash
tail -f app.log | grep --line-buffered "ERROR"
```

`--line-buffered` helps display matching lines immediately.

---

# 32. Exit Codes

Every command returns an exit status.

```bash
echo "$?"
```

Usually:

```text
0 → success
non-zero → failure
```

Example:

```bash
ls /tmp
echo "$?"
```

Explicit success:

```bash
exit 0
```

Explicit failure:

```bash
exit 1
```

Example:

```bash
if [ ! -f "$FILE" ]; then
    echo "File not found"
    exit 1
fi
```

---

# 33. set -e

```bash
set -e
```

Stops the script when a command fails.

Example:

```bash
#!/bin/bash

set -e

mkdir /some/path
echo "This may not execute if mkdir fails"
```

Useful for scripts where continuing after an error could cause problems.

---

# 34. set -u

```bash
set -u
```

Treats unset variables as errors.

Example:

```bash
#!/bin/bash

set -u

echo "$NAME"
```

If `NAME` was never defined, the script reports an error.

---

# 35. set -o pipefail

Normally, the exit status of a pipeline is based mainly on the final command.

```bash
command1 | command2 | command3
```

With:

```bash
set -o pipefail
```

the pipeline fails if an earlier command fails.

Common robust combination:

```bash
set -euo pipefail
```

Meaning:

* `-e` → exit on errors
* `-u` → error on unset variables
* `pipefail` → detect failures inside pipelines

---

# 36. set -x

Useful for debugging.

```bash
set -x

NAME="Priyanka"
echo "$NAME"

set +x
```

Bash prints commands as they execute.

This is especially useful when debugging CI/CD scripts.

---

# 37. trap

`trap` runs a command when a specific signal or event occurs.

Example:

```bash
cleanup() {
    echo "Cleaning temporary files..."
}

trap cleanup EXIT
```

The `cleanup` function runs when the script exits.

Practical example:

```bash
#!/bin/bash

TEMP_FILE="/tmp/myfile.txt"

cleanup() {
    rm -f "$TEMP_FILE"
    echo "Cleanup completed"
}

trap cleanup EXIT

touch "$TEMP_FILE"

echo "Doing some work..."
```

The temporary file is removed automatically when the script exits.

---

# 38. Practical Log Analysis Pattern

Find errors:

```bash
grep "ERROR" app.log
```

Count errors:

```bash
grep -c "ERROR" app.log
```

Find critical events with line numbers:

```bash
grep -n "CRITICAL" app.log
```

Find errors and failures:

```bash
grep -Ei "ERROR|Failed" app.log
```

Count total lines:

```bash
wc -l < app.log
```

Top repeated errors:

```bash
grep "ERROR" app.log \
| sed 's/^.*ERROR[: ]*//' \
| sort \
| uniq -c \
| sort -rn \
| head -5
```

---

# 39. Bash Script Template

A basic production-style starting point:

```bash
#!/bin/bash

set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

echo "Processing $FILE..."

# Your commands here

echo "Completed successfully."
exit 0
```

---

# 40. Important Bash Concepts to Remember

### Variables

```bash
NAME="DevOps"
echo "$NAME"
```

### Input

```bash
read -p "Enter name: " NAME
```

### Arguments

```bash
$0
$1
$#
$@
$?
```

### Conditions

```bash
if [ -f "$FILE" ]; then
    echo "Exists"
fi
```

### Loops

```bash
for file in *.log
do
    echo "$file"
done
```

### Functions

```bash
greet() {
    echo "Hello $1"
}
```

### Pipelines

```bash
command1 | command2
```

### Command substitution

```bash
RESULT=$(command)
```

### Redirection

```bash
command > file.txt
command >> file.txt
command < file.txt
```

### Error handling

```bash
set -euo pipefail
```

---

# 41. Day 21 Key Learnings

1. Bash scripts can automate repetitive Linux and DevOps tasks.
2. Commands such as `grep`, `awk`, `sed`, `sort`, `uniq`, and `wc` are powerful when combined using pipelines.
3. Proper error handling with exit codes, `set -euo pipefail`, and `trap` makes scripts more reliable.
4. Functions, loops, conditions, and command-line arguments make Bash scripts reusable.
5. Bash scripting is especially useful for log analysis, monitoring, backups, automation, and CI/CD tasks.

---

# 42. Useful Commands for DevOps

```bash
ps aux
```

View running processes.

```bash
ss -tulnp
```

View listening network ports and associated processes.

```bash
df -h
```

Check disk usage.

```bash
free -h
```

Check memory usage.

```bash
top
```

Monitor processes and system resources.

```bash
systemctl status nginx
```

Check service status.

```bash
journalctl -u nginx
```

View logs for a systemd service.

```bash
du -sh *
```

Check directory sizes.

```bash
find /var/log -type f
```

Find files under `/var/log`.

---
