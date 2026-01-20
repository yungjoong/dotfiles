-- This file is managed by packer.nvim
-- https://github.com/wbthomason/packer.nvim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- --- UI ---
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "folke/tokyonight.nvim",
    as = "tokyonight",
  }

  -- --- Utility ---
  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- --- LSP & Autocompletion ---
  use { 'neovim/nvim-lspconfig' } -- Collection of configurations for built-in LSP client

  -- Autocompletion framework
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' } -- buffer completions
  use { 'hrsh7th/cmp-path' } -- path completions
  use { 'hrsh7th/cmp-cmdline' } -- cmdline completions
  use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source for nvim-cmp
  
  -- Snippets
  use { 'L3MON4D3/LuaSnip' } -- snippet engine
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet source for nvim-cmp


end)
