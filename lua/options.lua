require "nvchad.options"

-- add yours here!
vim.opt.mouse = ""
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
--vim.opt.background = "dark"
vim.opt.foldmethod = 'manual'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,localoptions"
vim.opt.termguicolors = true

vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.7


vim.api.nvim_set_hl(0, "UfoFoldedFg", { fg = "#DC9FB4", bg = '#4e4355', default = false })
-- vim.api.nvim_set_hl(0, "UfoFoldedBg", { bg = "#0f1f0f", default = false })

vim.api.nvim_create_user_command("ListVirtualTextHL", function()
    local marks = vim.api.nvim_buf_get_extmarks(0, -1, 0, -1, { details = true })
    local seen = {}
    for _, mark in ipairs(marks) do
        local vt = mark[4] and mark[4].virt_text
        if vt then
            for _, part in ipairs(vt) do
                local hl = part[2]
                if hl and not seen[hl] then
                    print("VirtualText uses HL group: " .. tostring(hl))
                    seen[hl] = true
                end
            end
        end
    end
end, {})

vim.api.nvim_create_user_command("ListAnonymousVirtualText", function()
    local marks = vim.api.nvim_buf_get_extmarks(0, -1, 0, -1, { details = true })
    for _, mark in ipairs(marks) do
        local row, col, details = mark[2], mark[3], mark[4]
        local vt = details and details.virt_text
        if vt then
            for _, part in ipairs(vt) do
                local text, hl = part[1], part[2]
                if type(hl) == "table" then
                    print(string.format(
                        "Anonymous virtual text at [%d,%d]: '%s' with attr table: %s",
                        row + 1, col + 1, text, vim.inspect(hl)
                    ))
                end
            end
        end
    end
end, {})
