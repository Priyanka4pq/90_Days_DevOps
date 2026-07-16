#!/bin/bash

echo "========================================"
echo "Day 17 - Shell Scripting"
echo "========================================"

#############################
# Task 1 - For Loop
#############################

echo
echo "Task 1: For Loop"

fruits=("Apple" "Banana" "Orange" "Mango" "Grapes")

echo "Fruits:"
for fruit in "${fruits[@]}"
do
    echo "$fruit"
done

echo
echo "Counting from 1 to 10"

for i in {1..10}
do
    echo "$i"
done

#############################
# Task 2 - While Loop
#############################

echo
echo "Task 2: While Loop"

read -p "Enter a number: " num

while [ "$num" -ge 0 ]
do
    echo "$num"
    num=$((num-1))
done

echo "Done!"

#############################
# Task 3 - Command-Line Arguments
#############################

echo
echo "Task 3: Command-Line Arguments"

echo "Script Name      : $0"
echo "Total Arguments  : $#"
echo "All Arguments    : $@"

if [ $# -ge 1 ]
then
    echo "Hello, $1!"
else
    echo "Usage: ./day17.sh <name>"
fi

#############################
# Task 4 - Install Packages
#############################

echo
echo "Task 4: Install Packages"

if [ "$EUID" -ne 0 ]
then
    echo "Not running as root."
    echo "Skipping package installation."
else

    packages=("nginx" "curl" "wget")

    apt update

    for pkg in "${packages[@]}"
    do
        if dpkg -s "$pkg" >/dev/null 2>&1
        then
            echo "$pkg is already installed."
        else
            echo "Installing $pkg..."
            apt install -y "$pkg"
        fi
    done
fi

#############################
# Task 5 - Error Handling
#############################

echo
echo "Task 5: Error Handling"

set -e

mkdir /tmp/devops-test || echo "Directory already exists"

cd /tmp/devops-test || {
    echo "Cannot enter directory."
    exit 1
}

touch demo.txt || {
    echo "Cannot create file."
    exit 1
}

echo "demo.txt created successfully."

echo
echo "All tasks completed successfully!"
