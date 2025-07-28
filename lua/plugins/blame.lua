return {
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        opts = {
            width = 60,
            date_format = "%Y.%m.%d",
            virtual_style = "right_align",
            views = {
                window = window_view,
                virtual = virtual_view,
                default = window_view,
            },
            focus_blame = false,
            merge_consecutive = false,
            max_summary_width = 30,
            colors = nil,
            commit_detail_view = "vsplit",
            --format_fn = formats.commit_date_author_fn,
            mappings = {
                commit_info = "i",
                stack_push = "<TAB>",
                stack_pop = "<BS>",
                show_commit = "<CR>",
                close = { "<esc>", "q" },
            },
            blame_options = { '-w' },
        },
        config = require('configs.blame')
    },
}
