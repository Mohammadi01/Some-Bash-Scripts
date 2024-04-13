#!/bin/bash
read -p "Enter the first number: " first
read -p "Enter the second number: " second

# checking inputs using regex
if ! [[ $first =~ ^[-+]?[0-9]+$ ]]; then
	echo "incorrect input for first"
	exit 0
fi

if ! [[ $second =~ ^[-+]?[0-9]+$ ]]; then
	echo "incorrect input for second"
	exit 0
fi


# this line handles the variations of inputs like +x and -x
first=$((first))
second=$((second))

# perform arithmetic operations directly
sum=$((first + second))
echo "Sum: $sum"

# performing the comparison
if [ $first -gt $second ]; then
	echo 'first number is greater'
elif [ $first -lt $second ]; then
	echo 'second number is greater'
else
    echo 'two numbers are equal'
fi


