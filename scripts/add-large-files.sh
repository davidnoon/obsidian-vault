#!/bin/bash
# Add large files to .gitignore
# Usage: ./add-large-files.sh [size_in_mb]

SIZE_THRESHOLD=${1:-10}
VAULT_DIR="$HOME/Documents/Obsidian"

echo "Scanning for files larger than ${SIZE_THRESHOLD}MB..."

find "$VAULT_DIR" -type f -size +${SIZE_THRESHOLD}M | while read -r file; do
    # Get relative path from vault
    relpath="${file#$VAULT_DIR/}"
    # Get filename
    filename=$(basename "$file")
    
    # Check if already in gitignore
    if ! grep -q "^${filename}$" "$VAULT_DIR/.gitignore" 2>/dev/null; then
        echo "Adding to .gitignore: $filename"
        echo "$filename" >> "$VAULT_DIR/.gitignore"
    fi
done

echo "Done. Updated .gitignore:"
cat "$VAULT_DIR/.gitignore"
