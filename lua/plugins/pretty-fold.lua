return {
 --   {
 --       'anuvyklack/pretty-fold.nvim',
 --       config = function()
 --           require('pretty-fold').setup()
 --           require('pretty-fold').ft_setup('cpp', {
 --               process_comment_signs = false,
 --               comment_signs = {
 --                   '/**', -- C++ Doxygen comments
 --               },
 --               stop_words = {
 --                   -- ╟─ "*" ──╭───────╮── "@brief" ──╭───────╮──╢
 --                   --          ╰─ WSP ─╯              ╰─ WSP ─╯
 --                   '%*%s*@brief%s*',
 --               },
 --           })
 --       end
 --   },
}
