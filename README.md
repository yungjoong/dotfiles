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

### Required Core Tools:
- `nvim` (v0.7.0 or higher)
- `git`
- `tmux`
- `vim`
- `ripgrep` (for Telescope's `live_grep`)

### Recommended for C/C++ Kernel Development:
- `universal-ctags`
- `cscope`
- `clangd` (LSP server for C/C++)
- `bear` (to generate `compile_commands.json`)
- `gdb` (for debugging)
- `qemu` (for running the kernel)

### IDE Features Dependencies:
For the full IDE experience (formatting, linting, debugging), you need to install these external tools.

**Language Servers (already covered by lsp-config):**
- `pyright` (Python)
- `typescript-language-server` (TypeScript/JavaScript)
- `vue-language-server` (Vue)

**Formatters & Linters:**
- `clang-format` (C/C++)
- `black` and `ruff` (Python)
- `prettier` and `eslint` (JS/TS/Vue)

**Debug Adapters:**
- `debugpy` (Python)
- `codelldb` (C/C++)

**Example installation (pip and npm):**
```bash
# Python tools
pip install debugpy black ruff

# JavaScript/TypeScript/Vue tools
npm install -g prettier eslint @volar/vue-language-server typescript-language-server typescript

# C/C++ tools (codelldb needs to be installed manually, see its documentation)
# On Ubuntu, clang-format is part of the clang-format package.
sudo apt-get install clang-format
```

**Example installation on Ubuntu/Debian:**
```bash
# Core tools
sudo apt-get install neovim git tmux vim ripgrep

# Kernel analysis tools
sudo apt-get install universal-ctags cscope clangd bear gdb qemu-system-x86
```
