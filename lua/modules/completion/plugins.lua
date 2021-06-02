local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
    config = conf.nvim_lsp
}
completion["kabouzeid/nvim-lspinstall"] = {
    cmd = "LspInstall",
    config = conf.nvim_lspinstall
}

completion["glepnir/lspsaga.nvim"] = {
  opt = true
}

completion["hrsh7th/nvim-compe"] = {
    event = "InsertEnter",
    config = conf.nvim_compe
}

completion["hrsh7th/vim-vsnip"] = {
    after = "nvim-compe",
    config = conf.vim_vsnip
}

completion["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = conf.auto_pairs
}

completion["nvim-telescope/telescope.nvim"] = {
    config = conf.telescope,
    requires = {
        {"nvim-lua/popup.nvim", event = "BufEnter"},
        {"nvim-lua/plenary.nvim", event = "BufEnter"},
        {"nvim-telescope/telescope-fzy-native.nvim", event = "BufEnter"}
    }
}

completion["mattn/emmet-vim"] = {
    -- event = "InsertEnter",
    ft = {"html", "css", "javascript", "javascriptreact", "vue", "typescript", "typescriptreact"},
    config = conf.emmet
}

return completion
