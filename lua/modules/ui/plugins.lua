local ui = {}
local conf = require("modules.ui.config")

ui["christianchiarulli/nvcode-color-schemes.vim"] = {
  event = "BufEnter",
    config = [[vim.cmd('colorscheme lunar')]]
}

ui["glepnir/galaxyline.nvim"] = {
    branch = "main",
    config = conf.galaxyline,
    requires = {"kyazdani42/nvim-web-devicons", event = "ColorScheme"}
}

-- ui["lukas-reineke/indent-blankline.nvim"] = {
--     event = "BufRead",
--     branch = "lua",
--     config = conf.indent_blakline
-- }

ui["akinsho/nvim-bufferline.lua"] = {
  event = "BufEnter",
    config = conf.nvim_bufferline,
    requires = {"kyazdani42/nvim-web-devicons",event = "ColorScheme"}
}

ui["kyazdani42/nvim-tree.lua"] = {
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = conf.nvim_tree,
    requires = {"kyazdani42/nvim-web-devicons", event = "ColorScheme"}
}

ui["lewis6991/gitsigns.nvim"] = {
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}

ui["folke/which-key.nvim"] = {
  event = "BufEnter",
    config = conf.which_key
}

-- yay -S glow
ui["npxbr/glow.nvim"] = {
    ft = {"md", "markdown"}
}

-- npm install -g live-server
-- pacman -S pandoc
ui["davidgranstrom/nvim-markdown-preview"] = {
    ft = {"md", "markdown"}
}

ui["kevinhwang91/nvim-bqf"] = {
  module = "nvim-treesitter",
    config = conf.bqf
}

ui["folke/trouble.nvim"] = {
  cmd = {"Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"},
    requires = {"kyazdani42/nvim-web-devicons", event = "ColorScheme"},
    config = conf.trouble
}

ui["phaazon/hop.nvim"] = {
  keys = {"<leader>hh", "<leader>H"},
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        --   require "hop.nvim".setup {keys = "etovxqpdygfblzhckisuran"}
        vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>lua require'hop'.hint_words()<cr>", {})
        vim.api.nvim_set_keymap("n", "<leader>H", "<cmd>lua require'hop'.hint_words()<cr>", {})
    end
}

ui["kosayoda/nvim-lightbulb"] = {
    event = {"BufEnter"},
    config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end
}

return ui
