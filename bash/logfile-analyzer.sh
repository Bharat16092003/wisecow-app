#! /bin/bash


LOG_FILE="/var/log/apache2/access.log"


echo " ------------------------------------------ "
echo " Web Server Log Analysis Report "
echo " Generated on $(date) "
echo " Log File: $LOG_FILE "
echo " ------------------------------------------ "
echo

echo " 1. Total 404 Errors: "
grep "404" "$LOG_FILE" | wc -l
echo

echo " 2. Top 5 Requested Pages: "
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo

echo " 3. Top 5 IP Addresses "
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo


echo "---------  End of Analysis Report  ---------"

