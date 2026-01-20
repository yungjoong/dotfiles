#!/bin/bash

# This script creates symlinks from the home directory to the files in this repository.
# It backs up existing files.

# Directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Files and directories to symlink
# Add more here
declare -A LINKS
LINKS=(
    ["$DIR/vimrc"]="$HOME/.vimrc"
    ["$DIR/gitconfig"]="$HOME/.gitconfig"
    ["$DIR/tmux.conf"]="$HOME/.tmux.conf"
    ["$DIR/config/nvim/init.lua"]="$HOME/.config/nvim/init.lua"
)

# Create symlinks
for src in "${!LINKS[@]}"; do
    dest="${LINKS[$src]}"
    
    # Create parent directory of destination if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Check if source file exists before creating link
    if [ -e "$src" ]; then
        echo "Linking $src to $dest"
        # -s: symbolic, -f: force, -n: no-dereference, -v: verbose
        ln -sfnv "$src" "$dest"
    else
        echo "Source file $src does not exist, skipping."
    fi
done

echo "Bootstrap finished."
