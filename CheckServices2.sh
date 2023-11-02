#!/bin/bash
echo $*
echo $@
for SERVICE in $*; do
    if [ $# -ne 0 ]; then
        STATUS=$(service $SERVICE status | grep -i running)
        if [ $? -eq 0 ]; then
            echo "The Given Service $SERVICE is runnnig sucessfully..!!"
        else
            service $SERVICE start 2>/tmp/script.log
            if [ $? -eq 0 ]; then
                echo "service $SERVICE started...."
            else
                echo "Seems The Application $SERVICE is not present."
            fi
            echo "You Have Given $# paramters which is valid."
        fi
    else
        echo "You Have Given $# paramters which is invalid."
    fi
echo "You Have Given $# paramters which is valid."
done
