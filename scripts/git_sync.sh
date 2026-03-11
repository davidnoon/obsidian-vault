#!/bin/bash
# Obsidian Git Auto-Sync Script

VAULT_DIR="/Users/davidnoon/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Obsidian_sync"
LOG_FILE="$VAULT_DIR/scripts/sync.log"

# Log start time
echo "--- Sync starting at $(date) ---" >> "$LOG_FILE"

cd "$VAULT_DIR" || { echo "Error: Could not enter $VAULT_DIR" >> "$LOG_FILE"; exit 1; }

# Track if we made a commit
MADE_CHANGES=false

# Add all changes
git add .

# Check if there's anything to commit
if ! git diff-index --quiet HEAD --; then
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE" 2>&1
    MADE_CHANGES=true
fi

# Pull latest changes
echo "Pulling changes..." >> "$LOG_FILE"
git pull --rebase >> "$LOG_FILE" 2>&1

# Push changes
echo "Pushing changes..." >> "$LOG_FILE"
git push >> "$LOG_FILE" 2>&1

echo "--- Sync completed at $(date) ---" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
