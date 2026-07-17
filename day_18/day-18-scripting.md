# Day 18 – Shell Scripting: Functions & Intermediate Concepts

## Objective

Learn how to write cleaner and reusable shell scripts using functions, strict mode, local variables, and build a real-world system information script.

---

# Task 1: Basic Functions

## Script: functions.sh

```bash
#!/bin/bash

function greet() {
    echo "Hello, $1!"
}

function add() {
    sum=$(($1 + $2))
    echo "Sum: $sum"
}

greet "Priyanka"
add 10 20
```

### Output

```
Hello, Priyanka!
Sum: 30
```

---

# Task 2: Disk and Memory Check

## Script: disk_check.sh

```bash
#!/bin/bash

function check_disk() {
    echo "Disk Usage:"
    df -h /
}

function check_memory() {
    echo "Memory Usage:"
    free -h
}

check_disk
echo
check_memory
```

### Output

```
Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        98G   35G   59G  38% /

Memory Usage:
               total        used        free      shared  buff/cache   available
Mem:           7.5Gi       2.1Gi       3.8Gi       350Mi       1.6Gi       4.8Gi
Swap:          2.0Gi         0B       2.0Gi
```

---

# Task 3: Strict Mode

## Script: strict_demo.sh

```bash
#!/bin/bash

set -euo pipefail

echo "Strict Mode Demo"

echo "1. Undefined Variable"
echo "$name"

echo "2. Failed Command"
mkdir test
mkdir test

echo "3. Pipeline Failure"
cat file.txt | grep "hello"
```

### Output

```
Strict Mode Demo

1. Undefined Variable
./strict_demo.sh: line 8: name: unbound variable
```

### Explanation

#### set -e

Stops the script immediately if any command returns a non-zero exit status.

#### set -u

Treats the use of an undefined variable as an error and exits the script.

#### set -o pipefail

Makes a pipeline fail if any command in the pipeline fails instead of checking only the last command.

---

# Task 4: Local Variables

## Script: local_demo.sh

```bash
#!/bin/bash

function local_var() {
    local name="Priyanka"
    echo "Inside local_var(): $name"
}

function global_var() {
    name="DevOps"
    echo "Inside global_var(): $name"
}

echo "Calling local_var..."
local_var
echo "Outside local_var(): $name"

echo

echo "Calling global_var..."
global_var
echo "Outside global_var(): $name"
```

### Output

```
Calling local_var...
Inside local_var(): Priyanka
Outside local_var():

Calling global_var...
Inside global_var(): DevOps
Outside global_var(): DevOps
```

---

# Task 5: System Information Reporter

## Script: system_info.sh

```bash
#!/bin/bash

set -euo pipefail

function system_info() {
    echo "===== System Information ====="
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -a)"
    echo
}

function uptime_info() {
    echo "===== Uptime ====="
    uptime
    echo
}

function disk_usage() {
    echo "===== Disk Usage ====="
    df -h | head -n 6
    echo
}

function memory_usage() {
    echo "===== Memory Usage ====="
    free -h
    echo
}

function cpu_processes() {
    echo "===== Top 5 CPU Processes ====="
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo
}

function main() {
    system_info
    uptime_info
    disk_usage
    memory_usage
    cpu_processes
}

main
```

### Sample Output

```
===== System Information =====
Hostname: ubuntu
OS: Linux ubuntu 6.x.x x86_64 GNU/Linux

===== Uptime =====
15:40:18 up 3:12, 1 user, load average: 0.25, 0.31, 0.29

===== Disk Usage =====
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        98G   35G   59G  38% /

===== Memory Usage =====
               total        used        free
Mem:           7.5Gi       2.1Gi       3.8Gi

===== Top 5 CPU Processes =====
PID COMMAND %CPU
1245 firefox 24.6
2411 chrome 18.9
...
```

---

# What I Learned

- Functions make shell scripts modular, reusable, and easier to maintain.
- Using `set -euo pipefail` helps write safer scripts by stopping execution on errors, undefined variables, and pipeline failures.
- The `local` keyword limits a variable's scope to a function, preventing accidental modification of global variables.
