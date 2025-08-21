#!/bin/bash
read -p "Would you like to sync with the GitHub server? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "Pulling from remote..."
    git pull --rebase

    read -p "Enter commit message: " msg
    echo "Commit message: $msg"

    # Add only tracked/untracked files inside the current repo
    git add .

    # Commit changes
    git commit -m "$msg"

    # Push to main (or whatever the current branch is)
    git push

else
    echo "NOT syncing to GitHub."
fi
