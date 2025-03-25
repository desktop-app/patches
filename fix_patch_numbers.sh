#!/bin/bash

# Check if folder path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/folder"
    exit 1
fi

# Navigate to the target folder
cd "$1" || exit

# Get all numbered patch files sorted numerically
files=($(ls | grep -E '^[0-9]+-.*\.patch$' | sort -n))

# Rename files with correct sequential numbering
counter=1
for file in "${files[@]}"; do
    # Extract the suffix (everything after the first hyphen)
    suffix="${file#*-}"

    # Format new number with leading zeros
    new_number=$(printf "%04d" "$counter")

    # Construct new filename
    new_name="${new_number}-${suffix}"

    # Only rename if the filename actually changes
    if [ "$file" != "$new_name" ]; then
        mv -v "$file" "$new_name"
    fi

    ((counter++))
done

echo "Numbering fixed successfully"
