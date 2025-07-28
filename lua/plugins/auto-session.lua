return {
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            enabled = true,
            auto_restore = false,
            auto_create = true,
            auto_save = true,
            session_lens = {
                load_on_setup = true, }
        }
    },
}
