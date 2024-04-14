#!/bin/bash


read -p "enter the string: " string

# Use grep with a regular expression to extract numbers
numbers=$(echo "$string" | grep -oE '[0-9]+')



reversed=""
reversed_numbers=""
length=${#string}
length_numbers=${#numbers}
sum=0

for ((i = length-1; i >= 0; i--)); do
    el=${string:i:1}
    reversed="$reversed$el"
    sum=$(($el + $sum))
done

for ((i = length_numbers-1; i >= 0; i--)); do
    el=${numbers:i:1}
    reversed_numbers="$reversed_numbers$el"
done

echo "Reversed string is: $reversed"
echo "Numbers extracted from input string is: $numbers"
echo "Reversed numbers is: $reversed_numbers"
echo "Sum of numbers in the string is: $sum"