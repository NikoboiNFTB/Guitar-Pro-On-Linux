#!/usr/bin/env bash

set -e

# --- Git clone or update repository ---
REPO_DIR="$HOME/GitHub/NikoboiNFTB/Guitar-Pro-On-Linux"
REPO_URL="https://github.com/NikoboiNFTB/Guitar-Pro-On-Linux.git"

if [ -d "$REPO_DIR/.git" ]; then
    cd "$REPO_DIR"
    git pull origin main
elif [ -d "$REPO_DIR" ]; then
    echo "Error: Directory exists but is not a Git repository"
    exit 1
else
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"

# --- Copy icons if present ---
if [ -d "icons" ]; then
    mkdir -p "$HOME/.local/share/icons/Guitar-Pro"
    cp -r icons/* "$HOME/.local/share/icons/Guitar-Pro"
fi

# --- Prepare file list for dialog ---
files=(*)
menu_items=()
for i in "${!files[@]}"; do
    # dialog expects: tag + description, using filename as both
    menu_items+=("$i" "${files[i]}")
done

# --- Show menu using dialog ---
while true; do
    CHOICE=$(dialog \
        --clear \
        --title "Select a file to run" \
        --menu "Use arrow keys to navigate, Enter to select:" 20 60 15 \
        "${menu_items[@]}" \
        2>&1 >/dev/tty)

    clear  # remove dialog UI

    # Check if user pressed Cancel (CHOICE is empty)
    if [ -z "$CHOICE" ]; then
        echo "No file selected. Exiting."
        exit 0
    fi

    # Run the selected file
    FILE_TO_RUN="${files[$CHOICE]}"
    echo "Running $FILE_TO_RUN..."
    ./"$FILE_TO_RUN"
    break
done