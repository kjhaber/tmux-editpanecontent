#!/usr/bin/env bash

# Captures current tmux pane content (including all scrollback history) to temp
# file, then opens the temp file with $EDITOR in a new horizontal split pane.

set -e

# Find current tmux pane id
# Note: Using plain TMUX_PANE env var doesn't seem to work herewhen triggered
# by tmux key binding
TMUX_ACTIVE_PANE_INFO=$(tmux list-panes -s -F '#{pane_id} p=#{pane_active} w=#{window_active}' | grep 'p=1 w=1')
TMUX_PANE_ID=$(echo "$TMUX_ACTIVE_PANE_INFO" | cut -d' ' -f1)

# Validate environment
if [ -z "$TMUX_PANE_ID" ]; then
  echo "No current tmux pane id found $TMUX_PANE_ID - is tmux running?  Exiting."
  exit 1
fi
if [ -z "$EDITOR" ]; then
  echo "No EDITOR env variable set, exiting"
  exit 1
fi

# Capture current pane content to tmp file
TMPFILE=$(mktemp /tmp/tmux-editpanecontent.XXXXXX)
tmux capture-pane -p -t "$TMUX_PANE_ID" -S - > "$TMPFILE"

# Open pane content tmp file in editor within horizontal split of current tmux
# pane
EDIT_CMD="$EDITOR '$TMPFILE'"
tmux split-window -h -t "$TMUX_PANE_ID" "$EDIT_CMD; rm '$TMPFILE'"

