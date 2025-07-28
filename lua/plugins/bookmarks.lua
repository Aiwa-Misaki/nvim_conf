return {
    {
        "LintaoAmons/bookmarks.nvim",
        dependencies = {
            "kkharji/sqlite.lua",
            "nvim-telescope/telescope.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            local colors = {
                SYOJYOHI   = "#E83015",
                GINSYU     = "#C73E3A",
                RURI       = "#005CAF",
                GOLD       = "#FFCC00",
                RENIMIDORI = "#7B90D2",
                FUJINEZUMI = "#6E75A4",
                FUJI       = "#8B81C3",
                HIWAMOEGI  = "#90B44B",
                SEIJI      = "#69B0AC",
                GUNJO      = "#51A8DD",
                TSUYUKUSA  = "#2EA9DF",
                HANAASAGI  = "#1E88A8",
            }

            local function hex_to_rgb(hex)
                hex = hex:gsub("#", "")
                return tonumber(hex:sub(1, 2), 16),
                    tonumber(hex:sub(3, 4), 16),
                    tonumber(hex:sub(5, 6), 16)
            end
            local function darken_color(hex, factor)
                local r, g, b = hex_to_rgb(hex)
                r = math.floor(r * factor)
                g = math.floor(g * factor)
                b = math.floor(b * factor)
                return string.format("#%02X%02X%02X", r, g, b)
            end

            local mark_color = colors.TSUYUKUSA
            local bg_color = darken_color(mark_color, 0.5)

            local opts = {
                signs = {
                    mark = { color = mark_color, line_bg = bg_color },
                    annotation = { color = "red" },
                }
            }
            require("bookmarks").setup(opts)
        end,
        lazy = false
    }
}
