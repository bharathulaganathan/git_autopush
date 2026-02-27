#!/bin/bash

# ADD PROJECT FOLDERS
FOLDERS=(
    # "$HOME/.config/zsh_hist"
)

for FOLDER in "${FOLDERS[@]}"; do
    if [ -d "$FOLDER" ]; then
        cd "$FOLDER" || continue
        if [[ -n $(git status --porcelain) ]]; then
            git add .
            git commit -m "Auto-push: $(date +'%Y-%m-%d %H:%M:%S')"
        else
            echo "No changes in $FOLDER."
        fi
        if [[ -n $(git log @{u}..HEAD) ]]; then
            git push
        else
            echo "No new commits to push in $FOLDER."
        fi
    else
        echo "Warning: $FOLDER not found."
    fi
done
