#!/bin/bash

read -p "Enter the address of file: " filePath
fileContent=""

if [ -f "$filePath" ]; then
    fileContent=$(cat "$filePath")

else
    echo "the file does not exist"
    exit 1
fi

# Count the number of lines in the file
num_lines=$(wc -l < "$filePath")

# Print the number of lines
echo "This file has $num_lines lines"

read -p "Enter the beginning line number: " x
read -p "Enter the end line number: " y

# Check if start_line and end_line are within the range of lines
if [ "$x" -lt 1 ] || [ "$y" -gt "$num_lines" ] || [ "$y" -lt "$x" ]; then
    echo "Error: Invalid range of lines"
    exit 1
fi

sed -n "$x,$y p" "$filePath"