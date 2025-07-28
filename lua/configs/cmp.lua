local config = function()
    local cmp = require("cmp")

    cmp.setup({
        mapping = {
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
            --["<Tab>"] = cmp.mapping.confirm({ select = true }),
            ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
        },
        sources = {
            { name = "nvim_lsp" },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = { 'menu', 'abbr', 'kind' },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = 'λ',
                    vsnip = '⋗',
                    buffer = 'Ω',
                    path = '🖫',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
    })
end

return config
