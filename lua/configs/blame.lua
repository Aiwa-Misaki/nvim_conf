local config = function()
    require("blame").setup {
        blame_options = { "-w" },
    }


    vim.keymap.set("n", "<leader>bw", ':BlameToggle window', { desc = "Toggle Blame Window" })
    vim.keymap.set("n", "<leader>bv", ':BlameToggle virtual', { desc = "Toggle Blame Virtual" })
end

return config
