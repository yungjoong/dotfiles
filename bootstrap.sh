#!/bin/bash

# This script creates symlinks from the home directory to the files in this repository.
# It also installs the Neovim plugin manager (packer.nvim).

# --- Variables ---
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# --- Neovim Upgrade (v0.10+) ---
echo "Checking Neovim version..."
REQUIRED_VERSION="0.10.0"
INSTALL_DIR="$HOME/.local"
OPT_DIR="$INSTALL_DIR/opt"
BIN_DIR="$INSTALL_DIR/bin"
mkdir -p "$OPT_DIR" "$BIN_DIR"

if command -v nvim > /dev/null; then
    # Try to get version from currently active nvim
    CURRENT_VERSION=$(nvim --version | head -n 1 | grep -oP 'v\K[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
    # Check if current version is less than required
    if [[ $(echo -e "$CURRENT_VERSION\n$REQUIRED_VERSION" | sort -V | head -n1) == "$CURRENT_VERSION" && "$CURRENT_VERSION" != "$REQUIRED_VERSION" ]]; then
        echo "Neovim version $CURRENT_VERSION is too old (required >= $REQUIRED_VERSION)."
        UPGRADE_NEEDED=true
    else
        echo "Neovim version $CURRENT_VERSION meets the requirement."
        UPGRADE_NEEDED=false
    fi
else
    echo "Neovim not found."
    UPGRADE_NEEDED=true
fi

if [ "$UPGRADE_NEEDED" = true ]; then
    echo "Installing/Upgrading Neovim to latest stable via binary release..."
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
    tar xzf nvim-linux-x86_64.tar.gz
    
    # Clean old installation if it exists
    rm -rf "$OPT_DIR/nvim"
    mv nvim-linux-x86_64 "$OPT_DIR/nvim"
    
    # Create symlink in ~/.local/bin
    ln -sf "$OPT_DIR/nvim/bin/nvim" "$BIN_DIR/nvim"
    
    rm -rf "$TEMP_DIR"
    echo "Neovim upgraded successfully. Current version: $($BIN_DIR/nvim --version | head -n 1)"
    echo "NOTE: Ensure $BIN_DIR is in your PATH."
    cd "$DIR"
fi

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
    ["$DIR/config/clangd/config"]="$HOME/.config/clangd/config"
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