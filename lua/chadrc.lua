-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    integrations = {
    },
    hl_override = {
        TelescopeBorder = { fg = 'light_grey', bg = 'black' },
        TelescopeNormal = { fg = 'white' },
        TelescopePromptBorder = { fg = 'sun' },
        NormalFloat = { fg = 'green' },
        TelescopeSelection = { bg = '#454444' },
        FloatBorder = { fg = 'pink' },
        --TelescopeMatching = { fg = 'white', bg = '#8B81C3', bold = true }
        -- NvimTreeNormal = { bg = "darker_black" },
        -- NvimTreeNormalNC = { bg = "darker_black" },
        -- NormalNC = { bg = "darker_black" },
        -- Normal = { bg = "darker_black" },
    },
}

M.nvdash = { load_on_startup = true }

local _width = 0.8
local _height = 0.8

M.term = {
    float = {
        row = (1 - _height) / 2.7,
        col = (1 - _width) / 2,
        width = _width,
        height = _height,
    }
}


return M
