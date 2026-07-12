#!/bin/bash

SERVICE="ssh"

read -p "Do u want to check the statud: " CHECK

if [ "$CHECK" = "y"]; then
    if systemctl is-active --quiet "$SERVICE" ; then
        echo "$SERVICE service is active."
    else
        echo "$SERVICE service is not active."
else
    echo "skipped."
fi
