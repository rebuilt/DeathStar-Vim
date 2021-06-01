local ui = {}
local conf = require("modules.ui.config")

ui["christianchiarulli/nvcode-color-schemes.vim"] = {
    config = [[vim.cmd('colorscheme lunar')]]
}

ui["glepnir/galaxyline.nvim"] = {
    branch = "main",
    event = "BufEnter",
    config = conf.galaxyline,
    requires = {"kyazdani42/nvim-web-devicons"}
}

-- ui["lukas-reineke/indent-blankline.nvim"] = {
--     event = "BufEnter",
--     branch = "lua",
--     config = conf.indent_blakline
-- }

ui["akinsho/nvim-bufferline.lua"] = {
    event = "BufEnter",
    config = conf.nvim_bufferline,
    requires = {"kyazdani42/nvim-web-devicons"}
}

ui["kyazdani42/nvim-tree.lua"] = {
    cmd = {"NvimTreeToggle", "NvimTreeRefresh", "NvimTreeFindFile"},
    config = conf.nvim_tree,
    requires = {"kyazdani42/nvim-web-devicons"}
}

ui["lewis6991/gitsigns.nvim"] = {
    event = {"BufEnter"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}

ui["folke/which-key.nvim"] = {
    event = {"BufEnter"},
    config = conf.which_key
}

-- yay -S glow
ui["npxbr/glow.nvim"] = {
    ft = { "markdown"},
    -- run = "yay -S glow"
}

ui["kevinhwang91/nvim-bqf"] = {
    event = "QuickFixCmdPre",
    config = conf.bqf
}

ui["folke/trouble.nvim"] = {
    cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"},
    requires = {"kyazdani42/nvim-web-devicons"},
    config = conf.trouble
}

ui["phaazon/hop.nvim"] = {
    keys = {"<leader>hh", "<leader>H", "gl"},
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        --   require "hop.nvim".setup {keys = "etovxqpdygfblzhckisuran"}
        vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>lua require'hop'.hint_words()<cr>", {})
        vim.api.nvim_set_keymap("n", "<leader>H", "<cmd>lua require'hop'.hint_words()<cr>", {})
        vim.api.nvim_set_keymap("n", "gl", "<cmd>lua require'hop'.hint_words()<cr>", {})
    end
}

ui["kosayoda/nvim-lightbulb"] = {
    event = {"BufEnter"},
    config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
}

return ui
