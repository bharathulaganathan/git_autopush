#!/bin/bash

# Define your folders (Absolute paths)
FOLDERS=(
    # "$HOME/path/to/project"
)

# The Loop
for FOLDER in "${FOLDERS[@]}"; do
    if [ -d "$FOLDER" ]; then
        cd "$FOLDER" || continue
        # Only commit and push if there are actual changes
        if [[ -n $(git status -s) ]]; then
            git add .
            git commit -m "Auto-push: $(date +'%Y-%m-%d %H:%M:%S')"
            git push
            echo "Successfully pushed $FOLDER"
        else
            echo "No changes in $FOLDER."
        fi
    else
        echo "Warning: $FOLDER not found."
    fi
done
