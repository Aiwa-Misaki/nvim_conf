--require("nvchad.configs.lspconfig").defaults()
local config = function()
    local servers = { 'pyright', 'gopls', 'clangd' }
    --vim.lsp.enable(servers)

    --    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    --        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    --            update_in_insert = false,
    --        })

    vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        float = {
            border = 'single',
        },
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }

    local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = false, buffer = bufnr }
        --local builtin = require('telescope.builtin')
        local fzf = require('fzf-lua')
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gd', function()
            vim.cmd('vsplit')
            vim.schedule(function()
                fzf.lsp_definitions()
                --builtin.lsp_definitions()
            end)
        end, bufopts)
        vim.keymap.set('n', 'gD', function()
            vim.schedule(function()
                fzf.lsp_definitions()
            end)
        end, bufopts)
        vim.keymap.set('n', 'ga', fzf.lsp_implementations, bufopts)
        vim.keymap.set('n', 'gi', fzf.lsp_implementations, bufopts)
        vim.keymap.set('n', 'gr', fzf.lsp_references, bufopts)
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, bufopts)
    end

    local lspconfig = require('lspconfig')
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup { capabilities = capabilities, on_attach = on_attach }
    end

    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                diagnostics = { globals = { 'vim' } },
                workleader = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false }
            }
        }
    }

    local black = { formatCommand = "black --fast --line-length 79 -", formatStdin = true }
    local flake8 = {
        lintCommand = "flake8 --extend-ignore=F --ignore=E203,W503 --stdin-display-name ${INPUT} -",
        lintStdin = true,
        lintIgnoreExitCode = true,
        lintFormats = { "%f:%l:%c: %t%n%n %m" },
        lintSource = "flake8",
        lintCategoryMap = { E = 'N', W = 'N' }
    }
    lspconfig.efm.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = { documentFormatting = true },
        root_dir = vim.loop.cwd,
        filetypes = { 'python' },
        settings = {
            rootMarkers = { ".git/" },
            languages = { python = { black, flake8 } }
        }
    }

    lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = { "clangd", "--log=verbose" },
        root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git")
    }


    --     require("lspconfig").rust_analyzer.setup({
    --         capabilities = capabilities,
    --         on_attach = on_attach,
    --         settings = {
    --             ["rust-analyzer"] = {
    --                 diagnostics = {
    --                     enable = true,
    --                     -- enable diag at non-insert mode (not only when saving)
    --                     experimental = {
    --                         enable = true,
    --                     },
    --                 },
    --                 cargo = { allFeatures = true },
    --                 checkOnSave = true,
    --                 procMacro = { enable = true },
    --                 inlayHints = { enable = true },
    --             },
    --         },
    --     })

    lspconfig.texlab.setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }



    -- fixed issue of missing borders
    -- solution from this link
    -- https://github.com/NvChad/NvChad/issues/3252
    -- Default border style
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.lsp.set_log_level("error")
end

return config
