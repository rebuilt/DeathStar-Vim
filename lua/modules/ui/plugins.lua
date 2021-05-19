local ui = {}
local conf = require("modules.ui.config")

ui["christianchiarulli/nvcode-color-schemes.vim"] = {
    config = [[vim.cmd('colorscheme lunar')]]
}

ui["glepnir/galaxyline.nvim"] = {
    branch = "main",
    config = conf.galaxyline,
    requires = "kyazdani42/nvim-web-devicons"
}

ui["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    branch = "lua",
    config = conf.indent_blakline
}

ui["akinsho/nvim-bufferline.lua"] = {
    config = conf.nvim_bufferline,
    requires = "kyazdani42/nvim-web-devicons"
}

ui["kyazdani42/nvim-tree.lua"] = {
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = conf.nvim_tree,
    requires = "kyazdani42/nvim-web-devicons"
}

ui["lewis6991/gitsigns.nvim"] = {
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}

ui["folke/which-key.nvim"] = {
    event = {"BufEnter"},
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
    config = conf.bqf
}

ui["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = conf.trouble
}
return ui
