#!/bin/bash

# Getting inputs
read -p "Enter first operand " first_operand
read -p "Enter the operator. Please use '+' or '-' or '*' or '/' : " operator
read -p "Enter second operand: " second_operand

# Validity check of operands
if ! [[ $first_operand =~ ^[-+]?[0-9]*\.?[0-9]+$ ]]; then
    echo "Error: '$first_operand' is not a valid number."
    exit 1
fi

if ! [[ $second_operand =~ ^[-+]?[0-9]*\.?[0-9]+$ ]]; then
    echo "Error: '$second_operand' is not a valid number."
    exit 1
fi

# Remove '+' signs if the operands have + sign at the beginning
if [[ $first_operand =~ ^\+ ]]; then
    first_operand=${first_operand:1}
fi

if [[ $second_operand =~ ^\+ ]]; then
    second_operand=${second_operand:1}
fi

# Doing calculation
case "$operator" in
    +)
        result=$(bc <<< "scale=4; $first_operand + $second_operand")
        ;;
    -)
        result=$(bc <<< "scale=4; $first_operand - $second_operand")
        ;;
    \*)
        result=$(bc <<< "scale=4; $first_operand * $second_operand")
        ;;
    /)
        if (( $(bc <<< "$second_operand == 0") )); then
            echo "Error: DIVISION BY ZERO!!!"
            exit 1
        fi
        result=$(bc <<< "scale=4; $first_operand / $second_operand")
        ;;
    *)
        echo "Error: Invalid operator '$operator'. Please use '+' or '-' or '*' or '/'"
        exit 1
        ;;
esac

echo "Result: $result"
