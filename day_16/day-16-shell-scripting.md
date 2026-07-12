
# Day 16 - Shell Scripting Basics

## Objective

Learn the fundamentals of Bash scripting by understanding:

- Shebang (`#!/bin/bash`)
- Variables
- User input using `read`
- If-else conditions
- File checking
- Service status checking

---

# Task 1: Your First Script

## hello.sh

```bash
#!/bin/bash

echo "Hello, DevOps!"
```

### Make executable

```bash
chmod +x hello.sh
```

### Run

```bash
./hello.sh
```

### Output

```
Hello, DevOps!
```

### What happens if the shebang is removed?

If the shebang (`#!/bin/bash`) is removed:

- Running `./hello.sh` may still work if the current shell executes it as a shell script.
- If another program tries to execute it directly, it may fail with an **Exec format error** because the operating system doesn't know which interpreter to use.
- Using a shebang makes the script portable and ensures it always runs with the intended shell.

---

# Task 2: Variables

## variables.sh

```bash
#!/bin/bash

NAME="Priyanka"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"

echo 'Hello, I am $NAME and I am a $ROLE'
```

### Output

```
Hello, I am Priyanka and I am a DevOps Engineer
Hello, I am $NAME and I am a $ROLE
```

### Difference between Single and Double Quotes

| Double Quotes | Single Quotes |
|---------------|--------------|
| Variables are expanded | Variables are treated as plain text |
| `"Hello $NAME"` → Hello Priyanka | `'Hello $NAME'` → Hello $NAME |

---

# Task 3: User Input

## greet.sh

```bash
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your favourite tool: " TOOL

echo "Hello $NAME, your favourite tool is $TOOL."
```

### Example Output

```
Enter your name: Priyanka
Enter your favourite tool: Docker

Hello Priyanka, your favourite tool is Docker.
```

---

# Task 4: If-Else Conditions

## check_number.sh

```bash
#!/bin/bash

read -p "Enter a number: " NUM

if [ "$NUM" -gt 0 ]; then
    echo "The number is Positive."
elif [ "$NUM" -lt 0 ]; then
    echo "The number is Negative."
else
    echo "The number is Zero."
fi
```

### Example Output

```
Enter a number: 12
The number is Positive.
```

---

## file_check.sh

```bash
#!/bin/bash

read -p "Enter filename: " FILE

if [ -f "$FILE" ]; then
    echo "File exists."
else
    echo "File does not exist."
fi
```

### Example Output

```
Enter filename: hello.sh
File exists.
```

---

# Task 5: Combine Everything

## server_check.sh

```bash
#!/bin/bash

SERVICE="ssh"

read -p "Do you want to check the status? (y/n): " CHOICE

if [ "$CHOICE" = "y" ]; then

    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE service is Active."
    else
        echo "$SERVICE service is Not Active."
    fi

else
    echo "Skipped."
fi
```

### Example Output

```
Do you want to check the status? (y/n): y

ssh service is Active.
```

---

# What I Learned

1. The shebang (`#!/bin/bash`) tells Linux which interpreter should execute the script.
2. Variables store values that can be reused throughout a script, and double quotes allow variable expansion while single quotes do not.
3. Bash uses `read` for user input and `if`, `elif`, and `else` statements to make decisions based on conditions.

---

# Folder Structure

```
2026/
└── day-16/
    ├── hello.sh
    ├── variables.sh
    ├── greet.sh
    ├── check_number.sh
    ├── file_check.sh
    ├── server_check.sh
    └── day-16-shell-scripting.md
```

---
