-- Suppress vim.tbl_islist deprecation warning from packer
local orig_deprecate = vim.deprecate
vim.deprecate = function(name, ...)
  if name == 'vim.tbl_islist' then return end
  if orig_deprecate then return orig_deprecate(name, ...) end
end

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
require('user_plugins')

-- Force load packer compiled file so that lua package.path is updated
local compiled_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
if vim.fn.filereadable(compiled_path) == 1 then
  dofile(compiled_path)
end

-- Force load all start packages immediately so we can configure them
vim.cmd [[packloadall!]]

-- Load basic options
require('user_options')
-- Load keymaps
require('user_keymaps')
-- Load LSP settings
require('user_lsp')
-- Load Telescope settings
require('user_telescope')
-- Load Treesitter settings
require('user_treesitter')
-- Load Colorscheme
require('user_colorscheme')
-- Load Formatter
require('user_formatter')
-- Load DAP
require('user_dap')
