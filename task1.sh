#!/bin/bash
# server health monitoring with email notification

EMAIL="admin@example.com"
THRESHOLD_CPU=80
THRESHOLD_MEM=80
THRESHOLD_DISK=90
SERVICE="nginx"


HOSTNAME=$(HOSTNAME)
DATE=$(DATE)


#TOP SHOWS CPU USE, FIELD $8 IS IDLE,SO WE SUBTRACT FROM 100
CPU_USAGE=(top -bh1 | grep "Cpu(s)" | awk '{print 100-$8}')
CPU_USAGE_INT=${CPU_USAE%.*}

#free give memory usage, $3=used, $2=total

MEM_USAGE=$(free | grep mem |awk '{print ($3/$2)*100}')
MEM_USAGE_INT=${MEM_USAGE%.*}

#df -h /check root partition $5 is issud with %

DISK_USAGE=$(df -h / | grep |awk '{print $5}' | sed 's/%//g')

systemctl is-active --quiet $SERVICE
SRVICE_STATUS=$?


ALERT_MSG="server alert: $HOSTNAME at $DATE"
BODY=""

if ["$CPU_USAGE_INT" -gt "$THRESLD_CPU"]; then
	BODY+="cpu usage is high:$(CPU_USAGE_INT)%\n"

fi

if ["$MEM_USAGE_INT" -gt "$THRESOLD_MEM"]; then
	BODY+= "memory usage is high: $[MEM_USAGE_INT]%\n"

fi

if [ "$SERVICE_STATUS" -ne 0 ]; then
    BODY+="⚠️ Service '$SERVICE' is NOT running!\n"
fi


if [ -n "$BODY" ]; then
    echo -e "$BODY" | mail -s "$ALERT_MSG" "$EMAIL"
fi
