#!/bin/bash
#logs management and monitoring


LOG_FILE="/var/log/nginx/error.log"
KEYWORDS="error|fatal|critical"
TO="admin@example.com"
SUBJECT="íº¨ Log Alert - Error Detected"

# Check for keywords in last 50 lines
ALERT_LINES=$(tail -n 50 $LOG_FILE | grep -Ei "$KEYWORDS")

if [ ! -z "$ALERT_LINES" ]; then
    echo -e "Timestamp: $(date)\n\n$ALERT_LINES" | mail -s "$SUBJECT" "$TO"
fi

