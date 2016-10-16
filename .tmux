#!/bin/bash
set -e

if tmux has-session -t dots 2> /dev/null; then
  tmux attach -t dots
  exit
fi

tmux new-session -d -s dots -n vim

# 1. editing
tmux send-keys -t vim "vim -c CommandT" Enter

tmux new-window -n zsh
tmux send-keys -t zsh "git status" Enter

tmux attach -t dots:vim.top
