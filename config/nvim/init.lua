-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install packer automatically if it's not installed
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Load plugins
require('plugins')
-- Load basic options
require('options')
-- Load keymaps
require('keymaps')
-- Load LSP settings
require('lsp')
-- Load Telescope settings
require('telescope')
-- Load Treesitter settings
require('treesitter')
-- Load Colorscheme
require('colorscheme')
