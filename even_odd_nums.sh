#!/bin/bash
for X in {1..100}; do
    REM=$(expr $X % 2)
    if [ $REM -eq 0 ]; then
        echo "The Value of X is $X and its an EVEN Number"
    else
        echo "The Value of X is $X and its an ODD Number"
    fi
done
