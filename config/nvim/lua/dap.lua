-- lua/dap.lua
local dap = require('dap')
local dapui = require('dapui')

-- Setup for dapui
dapui.setup()

-- Setup for virtual text
require('nvim-dap-virtual-text').setup()


-- Keymaps for debugging
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>dc', '<cmd>lua require("dap").continue()<CR>', opts)
keymap('n', '<leader>do', '<cmd>lua require("dap").step_over()<CR>', opts)
keymap('n', '<leader>di', '<cmd>lua require("dap").step_into()<CR>', opts)
keymap('n', '<leader>dO', '<cmd>lua require("dap").step_out()<CR>', opts)
keymap('n', '<leader>dr', '<cmd>lua require("dap").repl.open()<CR>', opts)
keymap('n', '<leader>dl', '<cmd>lua require("dap").run_last()<CR>', opts)
keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', opts)

-- Listen for dap events to automatically open/close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- === Language Specific Configuration ===
-- This section requires you to install the debug adapters for each language.

-- --- Python ---
-- Adapter installation: pip install debugpy
dap.adapters.python = {
  type = 'executable',
  command = 'python', -- This needs to be in your path
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}', -- This will launch the current file
    pythonPath = function()
      -- debugpy supports launching an external console.
      return '/usr/bin/python'
    end,
  },
}

-- --- C/C++ ---
-- Adapter installation: Depends on the adapter (e.g., cpptools, codelldb)
-- For this example, we assume you have 'codelldb' installed and in your path.
-- See: https://github.com/vadimcn/codelldb/wiki/Installation
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = 'codelldb', -- This needs to be in your path
    args = {"--port", "${port}"},
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp -- Can be used for Rust too
