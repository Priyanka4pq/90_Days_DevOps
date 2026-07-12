#!/bin/bash

read -p "Enter Filename: " FILE

if [ -f "$FILE"]; then
    echo "File exists."
else
    echo "File does not exists."
fi
