#!/bin/bash
# Obsidian Vault Sync Script
# Pulls latest from GitHub and notifies user

VAULT_DIR="$HOME/Documents/Obsidian"
LOG_FILE="$VAULT_DIR/scripts/sync.log"

cd "$VAULT_DIR" || exit 1

echo "=== $(date) ===" >> "$LOG_FILE"

# Pull latest from GitHub
git fetch origin >> "$LOG_FILE" 2>&1

# Check if there are updates
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    git pull origin main >> "$LOG_FILE" 2>&1
    echo "Pulled updates at $(date)" >> "$LOG_FILE"
    
    # Notify user
    notify-send "Obsidian Sync" "Vault updated from GitHub" -i "$VAULT_DIR/.obsidian/icon.png" 2>/dev/null || \
    notify-send "Obsidian Sync" "Vault updated from GitHub" 2>/dev/null || \
    echo "Notification failed - no notify-send"
else
    echo "No updates at $(date)" >> "$LOG_FILE"
fi

echo "" >> "$LOG_FILE"
