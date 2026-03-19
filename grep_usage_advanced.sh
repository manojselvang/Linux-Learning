#!/bin/bash

# This script performs basic log analysis on application logs
# from a simulated microservices environment.

# It extracts critical errors, analyzes failed login attempts,
# identifies source IPs, and filters specific service logs.

# Logs directory : /home/user/app_logs/
# Output folder  : /home/user/output/


# Task 1 - extract all CRITICAL log entries
grep "CRITICAL" /home/user/app_logs/* > /home/user/output/output1.txt


# Task 2 - count total failed login attempts
grep "login failed" /home/user/app_logs/* | wc -l > /home/user/output/output2.txt


# Task 3 - extract unique IP addresses from failed logins
grep "login failed" /home/user/app_logs/* \
| awk '{print $10}' \
| sort -h \
| uniq > /home/user/output/output3.txt


# Task 4 - get transaction IDs where amount is greater than $500
grep "Transaction" /home/user/app_logs/* \
| sed 's/\$//g' \
| awk '$8 > 500 {print $6}' > /home/user/output/output4.txt


# Task 5 - filter payment-service logs between 14:00 and 15:00
grep -r "2025-09-22 14:" /home/user/app_logs/ \
| grep "payment-service" > /home/user/output/output5.txt
