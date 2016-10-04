#!/bin/bash
set -e

if tmux has-session -t dots 2> /dev/null; then
  tmux attach -t dots
  exit
fi

tmux new-session -d -s dots -n vim

# 1. editing
tmux send-keys -t vim "vim -c CommandT" Enter
tmux split-window -t vim -v -p 20
tmux send-keys -t vim.2 "git status" Enter

tmux attach -t dots:vim.top
