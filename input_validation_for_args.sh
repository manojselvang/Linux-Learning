#!/bin/bash

Input Validation:
The script must accept exactly two arguments:
Argument 1: Service Name (e.g., web-app)
Argument 2: Port Number (e.g., 8080)
Validation Logic: If either argument is missing (empty), the script must print "Error: Missing arguments" and exit immediately with a non-zero status code (1).

if [ $# -ne 2 ]; then
        echo "Error: Missing arguments"
        exit 1
fi

File Generation:
If inputs are valid, create a new file named [Service Name].conf in the current directory.
The content of this file must be exactly these three lines: ini [service] name=[Service Name] port=[Port Number]
Note: You must use the variables passed into the script to fill these values.


name=$1
port=$2

{
echo "[service]"
echo "name=$name"
echo "port=$port" 
} > "$name.conf"


User Feedback:
Upon success, print "Config generated for [Service Name]" to the screen.
echo "Config generated for $name"
