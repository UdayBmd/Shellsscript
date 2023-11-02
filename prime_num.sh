#!/bin/bash
set -x
for n in {1..100}; do
    for ((i = 2; i <= $n / 2; i++)); do
        ans=$((n % i))
        echo $ans
        if [ $ans -eq 0 ]; then
            echo "$n is not a prime number."
            exit 0
        fi
    done
    echo "$n is a prime number."
done
