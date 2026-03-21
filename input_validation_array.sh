#!/bin/bash

# simple list of services running in the machine
services=("nginx" "mysql" "ssh")

echo "Enter service name, to check if running"
read servicename

found=false

# Simulating to services via array, assuming that its running
for s in "${services[@]}"; do
  if [[ "$servicename" == "$s" ]]; then
    echo "$servicename service is available" > /home/user/service_check.txt
    found=true
    break
  fi
done

# if service given not matched, assuming service is not running
if [[ "$found" == false ]]; then
  echo "$servicename service not found" > /home/user/service_check.txt
fi


# Example 1:
# Input:
# Enter service name:
# nginx
#
# Output (in /home/user/service_check.txt):
# nginx service is available

# Example 2:
# Input:
# Enter service name:
# apache

# Output:
# apache service not found
