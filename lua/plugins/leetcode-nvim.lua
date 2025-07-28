return {
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            -- configuration goes here
            cn = { -- leetcode.cn
                enabled = true, ---@type boolean
                translator = false, ---@type boolean
                translate_problems = false, ---@type boolean
            },
            storage = {
                home = "/Users/duck/Code/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },
            injector = { ---@type table<lc.lang, lc.inject>
                ["python3"] = {
                    before = true
                },
                ["cpp"] = {
                    before = { "#include <iostream>","#include <vector>", "using namespace std;" },
                    after = "int main() {}",
                },
                ["java"] = {
                    before = "import java.util.*;",
                },
            }
        },
        lazy = false,
    },
}
