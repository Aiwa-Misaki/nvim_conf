return {
    require("nvim-tree").setup {
        git = {
            enable = true,
            ignore = true,
        },
        filters = {
            dotfiles = false, custom = {},
        },
    }
}

