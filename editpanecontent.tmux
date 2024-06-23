#!/usr/bin/env bash

# Set tmux mapping to '<prefix>e' to dispatch to scripts/tmux_editpanecontent.sh
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key e run-shell "$CURRENT_DIR/scripts/tmux_editpanecontent.sh"
