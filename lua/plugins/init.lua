return {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
    },
    { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" }, lazy = false },
    {
        "karb94/neoscroll.nvim",
        config = require "configs.neoscroll",
        lazy = false,
    },
    {
        "y3owk1n/time-machine.nvim",
        version = "*", -- remove this if you want to use the `main` branch
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.gitsigns")()
        end,
        lazy = false
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {}
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        config = function()
            require("crates").setup {
                lsp = {
                    enabled = true,
                    on_attach = function(client, bufnr)
                        -- the same on_attach function as for your other language servers
                        -- can be ommited if you're using the `LspAttach` autocmd
                    end,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            }
        end,
        lazy = false,
    },
    --{
    --    "simrat39/rust-tools.nvim",
    --        config = function()
    --        require "configs.rust_tools"
    --    end,

    --},
    --    {
    --        "nvim-neorg/neorg",
    --        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    --        version = "*", -- Pin Neorg to the latest stable release
    --        config = true,
    --    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- config = function()
        --     require('telescope').setup {
        --         defaults = {
        --             vimgrep_arguments = {
        --                 'rg',
        --                 '--color=never',
        --                 '--no-heading',
        --                 '--with-filename',
        --                 '--line-number',
        --                 '--column',
        --                 '--smart-case',
        --                 '--hidden',
        --                 '--no-ignore',
        --                 '--glob', '!.git/*',
        --             }
        --         }
        --     }
        -- end,
        lazy = false
    },
    { "andymass/vim-matchup",      lazy = false },
    { "alvan/vim-closetag",        lazy = false },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
    { "numToStr/Comment.nvim",          config = true, lazy = false },
    {
        "neovim/nvim-lspconfig",
        config = require("configs.lspconfig")
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "hrsh7th/nvim-cmp",               lazy = false,  config = require('configs.cmp') },
    { "hrsh7th/cmp-nvim-lsp",           lazy = false },
    { "sakhnik/nvim-gdb",               lazy = false },
    { "mfussenegger/nvim-dap",          lazy = false },
    { "mortepau/codicons.nvim",         lazy = false },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
    { "nvim-lua/plenary.nvim",    lazy = false },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
            }
        end
    },
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            vim.g.vimtex_view_method = "skim"
        end
    },
    {
        'm4xshen/autoclose.nvim',
        config = function()
            require("autoclose").setup()
        end
    },
    {
        "williamboman/mason.nvim",
        opts = { PATH = "append" },
        config = function()
            require('mason').setup({})
        end,
        lazy = false
    },
    { 'dstein64/vim-startuptime', lazy = false },
}
