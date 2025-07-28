local config = function()
    vim.g.rustaceanvim = {
        tools = {},
        server = {
            on_attach = function(client, bufnr)
                -- rust-specific keymaps
                vim.keymap.set("n", "<leader>ca", function()
                    vim.cmd.RustLsp("codeAction")
                end, { silent = true, buffer = bufnr })

                vim.keymap.set("n", "<leader>a", function()
                    vim.cmd.RustLsp("codeAction")
                end, { silent = true, buffer = bufnr })

                vim.keymap.set("n", "K", function()
                    vim.cmd.RustLsp({ "hover", "actions" })
                end, { silent = true, buffer = bufnr })

                vim.keymap.set("n", "<leader>ee", function()
                    vim.cmd.RustLsp("explainError")
                end, { silent = true, buffer = bufnr })

                vim.keymap.set("n", "<leader>e", function()
                    vim.diagnostic.open_float()
                end, { silent = true, buffer = bufnr })
                vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { silent = true, buffer = bufnr })
                vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { silent = true, buffer = bufnr })
            end,
            default_settings = {
                ["rust-analyzer"] = {
                    diagnostics = {
                        enable = true,
                        experimental = {
                            enable = true,
                        },
                    },
                    cargo = { allFeatures = true },
                    checkOnSave = true,
                    procMacro = { enable = true },
                    inlayHints = { enable = true },
                },
            },
        },
        dap = {},
    }
    vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        severity_sort = true,
        signs = true,
        float = { border = "rounded" },
    })
end


return config
