#!/bin/bash

# Ask the user for a number
read -p "Enter a number: " num

# Use modulus to check
if [ $((num % 2)) -eq 0 ]; then
    echo "$num is Even"
else
    echo "$num is Odd"
fi

