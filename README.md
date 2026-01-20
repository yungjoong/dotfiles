# My Dotfiles

This repository contains my personal dotfiles.
It's managed by a simple bootstrap script.

## Installation

1. Clone this repository to your home directory:
   ```bash
   git clone <your-git-repo-url> ~/dotfiles
   ```
2. Run the bootstrap script:
   ```bash
   ~/dotfiles/bootstrap.sh
   ```
3. Open Neovim and run `:PackerSync` to install all the plugins.

## Features

This setup includes a modern Neovim configuration with:
- Plugin management with `packer.nvim`
- Fuzzy finding with `Telescope`
- Syntax highlighting with `Tree-sitter`
- LSP support via `nvim-lspconfig` for IDE-like features
- Autocompletion with `nvim-cmp`

## Dependencies

This configuration relies on some external tools that need to be installed on your system via a package manager (e.g., `apt`, `brew`).

### Required for Neovim setup:
- `nvim` (v0.7.0 or higher)
- `git`
- `ripgrep` (for Telescope's `live_grep`)

### Recommended for C/C++ Kernel Development:
- `universal-ctags`
- `cscope`
- `clangd` (LSP server for C/C++)
- `bear` (to generate `compile_commands.json`)
- `gdb` (for debugging)
- `qemu` (for running the kernel)

**Example installation on Ubuntu/Debian:**
```bash
# Core tools
sudo apt-get install neovim git ripgrep

# Kernel analysis tools
sudo apt-get install universal-ctags cscope clangd bear gdb qemu-system-x86
```
