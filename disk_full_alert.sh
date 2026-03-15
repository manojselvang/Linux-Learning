# Disk Usage Monitoring Script
# This script checks the disk usage of a specific partition
# and alerts if the usage exceeds a defined threshold.

#!/bin/bash

# Set the maximum allowed disk usage percentage
THRESHOLD=80

# Define the partition to check (root partition in this case)
PARTITION="/"

# Get the current disk usage percentage of the partition
# df -P : Shows disk usage in POSIX format (stable for scripting)
# tail -1 : Gets the line containing the partition information
# awk '{print $5}' : Extracts the 5th column (Use%)
# sed 's/%//' : Removes the % symbol
USAGE=$(df -P "$PARTITION" | tail -1 | awk '{print $5}' | sed 's/%//')

# Print information about the check
echo "Checking disk usage for partition: $PARTITION"
echo "Current Usage: $USAGE"
echo "Threshold: $THRESHOLD"

# Compare current usage with the threshold
# -gt means "greater than"
# If usage is greater than threshold, print an alert
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Alert: Disk usage is High"
fi

# Example Output
> Checking disk usage for partition: /
> Current Usage: 85
> Threshold: 80
> Alert: Disk usage is High
