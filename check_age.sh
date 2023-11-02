#!/bin/bash
YOB=$1
if = [ $YOB =~ [[:digit:]] ]; then
    CURRENT_AGE=$(expr 2022 - $YOB)
    #Below 16 years cannot drive.
    #Between 16 to 50 can drive
    #Between 50 to 65, drive with caution.
    #Between 65 to 100, need to renew new DL.
    if [ "${CURRENT_AGE}" -lt 16 ]; then
        echo "Your Age is ${CURRENT_AGE} and Wait One More Year For DL"
    elif [ "${CURRENT_AGE}" -ge 16 -a "${CURRENT_AGE}" -lt 50 ]; then
        echo "Your Age is ${CURRENT_AGE} and You Are Good To Drive...."
    elif [ "${CURRENT_AGE}" -ge 50 -a "${CURRENT_AGE}" -lt 65 ]; then
        echo "Your Age is ${CURRENT_AGE} and Drive With Caution"
    elif [ "${CURRENT_AGE}" -ge 65 -a "${CURRENT_AGE}" -le 100 ]; then
        echo "Your Age is ${CURRENT_AGE} and You Are Too Old To Drive."
    elif [ "${CURRENT_AGE}" -gt 100 -a "${CURRENT_AGE}" -le 120 ]; then
        echo "Your Age is ${CURRENT_AGE} and You Are Driving To Kill People.."
    else

        echo "Your Age is ${CURRENT_AGE} and INVALID AGE"
    fi
else
    echo "INVALID INPUT"
fi
