#!/bin/bash

# This script creates symlinks from the home directory to the files in this repository.
# It also installs the Neovim plugin manager (packer.nvim).

# --- Variables ---
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# --- Neovim Plugin Manager (Packer) ---
if [ ! -d "$NVIM_PACKER_DIR" ]; then
    echo "Cloning packer.nvim..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$NVIM_PACKER_DIR"
else
    echo "packer.nvim is already installed."
fi


# --- Symlinking ---
echo "Creating symlinks..."

# Add more symlinks here
declare -A LINKS
LINKS=(
    ["$DIR/vimrc"]="$HOME/.vimrc"
    ["$DIR/gitconfig"]="$HOME/.gitconfig"
    ["$DIR/tmux.conf"]="$HOME/.tmux.conf"
    # Link the entire nvim config directory
    ["$DIR/config/nvim"]="$NVIM_CONFIG_DIR"
)

# Create symlinks
for src in "${!LINKS[@]}"; do
    dest="${LINKS[$src]}"
    
    # Create parent directory of destination if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Check if source file/dir exists before creating link
    if [ -e "$src" ]; then
        echo "Linking $src to $dest"
        # -s: symbolic, -f: force, -n: no-dereference, -v: verbose
        ln -sfnv "$src" "$dest"
    else
        echo "Source $src does not exist, skipping."
    fi
done

echo ""
echo "Bootstrap finished."
echo "NOTE: Open Neovim and run :PackerSync to install plugins."