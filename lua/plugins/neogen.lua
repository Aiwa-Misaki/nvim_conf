return {
    {
        "danymat/neogen",
        lazy = false,
        config = function()
            require('neogen').setup({
--                languages = {
--                    rust = {
--                        template = {
--                            annotation_convention = "my_annotation",
--                            my_annotation = require('configs.neogen-rust')
--                        }
--                    }
--                }
            })
        end
    },
}
