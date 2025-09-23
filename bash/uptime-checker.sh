#! /bin/bash

URL="https://example.com"
LOG="/var/log/app_uptome.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")


STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
 

 if [ "$STATUS_CODE" -eq 200 ]; then
	 echo "$DATE  Application is UP (STATUS: $STATUS_CODE)" | tee -a $LOG_FILE
 else 
	 echo "$DATE  Application is DOWN (STATUS: $STATUS_CODE)" | tee -a $LOG_FILE
 fi
