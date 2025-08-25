#!/bin/bash

echo "File Permission Modification Script"
echo "==================================="

# Use the current working directory
TARGET_DIR=$(pwd)
PERMISSIONS="${1:-644}"  # Use first argument or default to 644

echo "Target directory: $TARGET_DIR"
echo "Setting permissions to: $PERMISSIONS"
echo

# Counter for modified files
COUNT=0

# Loop through all files (excluding directories) in current directory
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "Changing permissions for: $filename"
        chmod "$PERMISSIONS" "$file"
        ((COUNT++))
    fi
done

echo
echo "Process completed! Modified $COUNT file(s)."

# Optional: Show before/after permissions for verification
echo
echo "Verification of permissions in $(pwd):"
ls -la