-- lua/formatter.lua
local status, null_ls = pcall(require, "null-ls")
if not status then
    print("null-ls (none-ls) not found")
    return
end

local b = null_ls.builtins

null_ls.setup({
    sources = {
        -- Builtins were moved to external repos in none-ls,
        -- so we need to install them separately (e.g. none-ls-extras.nvim)
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
