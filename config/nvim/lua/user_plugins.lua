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
  -- Git integration
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }

  -- File Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
      local keymap = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
      keymap('n', '<leader>o', ':NvimTreeFindFile<CR>', opts)
    end
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    run = ':TSUpdate'
  }

  -- --- LSP & Autocompletion ---
  use { 'neovim/nvim-lspconfig' } -- Collection of configurations for built-in LSP client

  -- Formatter & Linter
  use { 'nvimtools/none-ls.nvim' }

  -- Autocompletion framework
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' } -- buffer completions
  use { 'hrsh7th/cmp-path' } -- path completions
  use { 'hrsh7th/cmp-cmdline' } -- cmdline completions
  use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source for nvim-cmp
  
  -- Snippets
  use { 'L3MON4D3/LuaSnip' } -- snippet engine
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet source for nvim-cmp

  -- --- Debugging ---
  use { 'mfussenegger/nvim-dap' }
  use { "nvim-neotest/nvim-nio" }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }


end)
