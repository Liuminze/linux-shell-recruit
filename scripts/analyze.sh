#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 FILE"
    exit 1
fi

file="$1"

if [[ ! -f "$file" ]]; then
    echo "ERROR: file not found: $file" >&2
    exit 1
fi

total=$(grep -c ' ERROR ' "$file")
top=$(grep ' ERROR ' "$file" | grep -o 'code=[0-9]*' | cut -d= -f2 | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')

echo "Total ERROR: $total"
echo "Top Code: $top"
