return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 'lua_ls', 'ts_ls', 'clangd', 'cmake' }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        hint = {
                            enable = true, -- necessary
                        }
                    }
                }
            })
            lspconfig.ts_ls.setup({})
            lspconfig.html.setup({})

            -- Check if the ESP-IDF environment variable is set
            local esp_idf_path = os.getenv("IDF_PATH")
            if esp_idf_path then
                -- for esp-idf
                require 'lspconfig'.clangd.setup {
                    capabilities = capabilities,
                    cmd = { "/home/erwinschrodinger1/.espressif/tools/esp-clang/16.0.1-fe4f10a809/esp-clang/bin/clangd", "--background-index", "--query-driver=**", },
                    root_dir = function()
                        -- leave empty to stop nvim from cd'ing into ~/ due to global .clangd file
                    end
                }
            else
                -- clangd config
                require 'lspconfig'.clangd.setup {
                    -- cmd = { 'clangd', "--background-index", "--clang-tidy"},
                    handlers = {
                        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                            disable = { "cpp copyright" }
                        }) }
                }
            end

            lspconfig.cmake.setup({})
            -- Key mappings for LSP functions
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<C-.>', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, {})
        end,
    },
}
