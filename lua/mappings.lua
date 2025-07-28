require "nvchad.mappings"

-- ▶︎ Keymaps
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<C-w><C-w>', '<C-w>c')
vim.keymap.set('n', '<C-t>', function() vim.cmd("tab split") end)
vim.keymap.set('n', '<M-Left>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<M-Right>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<M-Down>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<M-Up>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<M-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-j>', '10jzz', { noremap = true, silent = true })
vim.keymap.set('n', '<M-k>', '10kzz', { noremap = true, silent = true })
vim.keymap.set('n', '[t', 'gT', { noremap = true, silent = true, desc = 'Previous tab' })
vim.keymap.set('n', ']t', 'gt', { noremap = true, silent = true, desc = 'Next tab' })
vim.keymap.set('n', '<space>tt', function()
    vim.cmd("belowright 15split | terminal")
end, { noremap = true, silent = true, desc = "Open terminal split with height 15" })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
-- disable keys related to scrolling for neoscroll
--local keys_to_disable = {
--  '<C-u>', '<C-d>',
--  '<C-b>', '<C-f>',
--  '<C-y>', '<C-e>',
--  'zt', 'zz', 'zb',
--}
--
--for _, key in ipairs(keys_to_disable) do
--  vim.keymap.set('n', key, '<Nop>', { noremap = true, silent = true })
--end


vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files({
        hidden = true,
        follow = true,
    })
end, { noremap = true, silent = true, desc = 'Find Files (fzf-lua)' })

vim.keymap.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end, { noremap = true, silent = true, desc = 'Live Grep (fzf-lua)' })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Telescope
-- escape [27;13;70  -> configured as shift+cmd+f in iTerm2
vim.keymap.set('n', '<Esc>[27;13;70', function()
    --    require('telescope.builtin').live_grep({})
    require('fzf-lua').live_grep()
end, { noremap = true, silent = true, desc = "Live grep" })

-- escape [27;13;79  -> configured as shift+cmd+o in iTerm2
vim.keymap.set('n', '<Esc>[27;13;79', function()
    require('fzf-lua').files({
        --    require('telescope.builtin').find_files({
        hidden = true,
        follow = true,
    })
end, { noremap = true, silent = true, desc = "Find files" })

vim.keymap.set('n', '<space>f', function()
    vim.cmd('NvimTreeFindFile')
end, { noremap = true, silent = true, desc = "Reveal current file in NvimTree" })

-- split vertically：Option + \
vim.keymap.set("n", "<M-\\>", ":vsplit<CR>", { noremap = true, silent = true })
-- split horizontally：Option + -
vim.keymap.set("n", "<M-->", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-w>", ":q", { noremap = true, silent = true })

-- Litee Calltree keymaps
vim.keymap.set("n", "<space>ci", vim.lsp.buf.incoming_calls, { desc = "Incoming Calls" })
vim.keymap.set("n", "<space>co", vim.lsp.buf.outgoing_calls, { desc = "Outgoing Calls" })


-- bookmarks
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>bm", ":BookmarksMark<CR>", opts)
vim.keymap.set("n", "<space>bg", ":BookmarksGoto<CR>", opts)

-- vim.keymap.set("n", "<space>bn", ":BookmarksNewList<CR>", opts)
vim.keymap.set("n", "<space>bl", ":BookmarksLists<CR>", opts)
vim.keymap.set("n", "<space>bc", ":BookmarksCommands<CR>", opts)
vim.keymap.set("n", "<space>bt", ":BookmarksTree<CR>", opts)

vim.keymap.set('n', '<space>cs', function()
    require('nvchad.themes').open()
end, { noremap = true, silent = true, desc = "Choose colorscheme" })

-- key map for float terminal
-- vim.keymap.set('n', '<space>fn', ':FloatermNew<CR>', opts)
-- vim.keymap.set('n', '<space>f[', ':FloatermPrev<CR>', opts)
-- vim.keymap.set('n', '<space>f]', ':FloatermNext<CR>', opts)
-- vim.keymap.set('n', '<space>ft', ':FloatermToggle<CR>', opts)
-- vim.keymap.set('n', '<space>fk', ':FloatermKill<CR>', opts)
-- vim.keymap.set('n', '<space>d', ':RustLsp explainError', opts)
