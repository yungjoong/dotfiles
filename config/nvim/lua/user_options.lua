-- See `:help option-list` for all options

-- General
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.swapfile = false -- Don't use swapfile
vim.opt.undofile = true -- Persistent undo

-- UI
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.foldmethod = 'marker' -- Enable folding
vim.opt.splitright = true -- Vertical splits to the right
vim.opt.splitbelow = true -- Horizontal splits below
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Text Formatting
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of indentation
vim.opt.tabstop = 4 -- Number of spaces that a tab in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.wrap = false -- Do not wrap lines

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Performance
vim.opt.updatetime = 250 -- ms to wait for trigger an event
