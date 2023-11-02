#!/bin/bash
NGINX=$(service nginx status | grep -i running)
if [ $? -eq 0 ]; then
    echo "Nginx Is Running , No need to restart.."
else
    echo "Nginx Service Is Down & Restarting it..."
    service nginx start
    service nginx status | grep -i running
fi

MYSQL=$(service mysql status | grep -i running)
if [ $? -eq 0 ]; then
    echo "MySQL Is Running , No need to restart.."
else
    echo "MySQL Service Is Down & Restarting it..."
    service mysql start
    service mysql status | grep -i running
    MYSQL_PROCID=$(netstat -nltp | grep -i mysql | awk '{print $7}' | sort | head -1)
    MYSQL_PROCPORT=$(netstat -nltp | grep -i mysql | awk '{print $4}' | cut -d ':' -f 2 | sort | head -1)
    echo "MYSQL Operating Process ID is $MYSQL_PROCID"
    echo "MYSQL Operating Process Port is $MYSQL_PROCPORT"
fi
