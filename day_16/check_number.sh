#!/bin/bash

read -p "Enter a number: " NUMBER

if [ "$NUMBER" -gt 0]; then
    echo "Number is Positive."
elif ["$NUMBER"-lt 0]; then
    echo "Number is Negative."
else
    echo "Number is 0."
fi
