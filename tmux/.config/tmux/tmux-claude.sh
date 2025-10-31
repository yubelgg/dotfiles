#!/usr/bin/env bash
# Claude per-directory toggle - Final working version

CURRENT="$(tmux display-message -p '#{session_name}')"
DIR="$(tmux display-message -p '#{pane_current_path}')"
SESSION="claude_$(echo "$DIR" | sed 's|^/||; s|/|_|g')"

# Case 1: In a Claude session (inside popup)
if [[ "$CURRENT" == claude_* ]]; then
    tmux detach-client
    exit 0
fi

# Case 2: Popup attached (visible from outside)
if tmux display-message -p '#{popup_attached}' 2>/dev/null | grep -q '^1$'; then
    tmux detach-client
    exit 0
fi

# Case 3: No popup, not in Claude - open it
tmux display-popup -d "$DIR" -w 90% -h 90% -E \
    "tmux new-session -A -s '$SESSION' -c '$DIR' 'claude || bash' \; set status off"
