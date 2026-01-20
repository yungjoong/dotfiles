-- lua/formatter.lua
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Linters
        null_ls.builtins.linting.eslint,
        null_ls.builtins.linting.ruff,

        -- Formatters
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
    },
    -- Auto-formatting on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = "LspFormatting",
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
