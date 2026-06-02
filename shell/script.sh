#!/usr/bin/env bash
# BUG FIX: 'set -euo pipefail' added — original had no error handling
set -euo pipefail
 
STDOUT="/dev/stdout"
# BUG FIX: was LOG_FILE='$STDOUT' (single quotes) — $STDOUT was never expanded;
# the script was appending to a file literally named '$STDOUT' instead of /dev/stdout
LOG_FILE="$STDOUT"
LOG_MESSAGE="is the date, should log to \$STDOUT"
 
# log with timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}
 
log_message "$LOG_MESSAGE"
