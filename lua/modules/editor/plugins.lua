local editor = {}
local conf = require("modules.editor.config")

editor["rhysd/accelerated-jk"] = {
    opt = true
}

editor["norcalli/nvim-colorizer.lua"] = {
    ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact", "scss", "eruby"},
    config = conf.nvim_colorizer
}

editor["itchyny/vim-cursorword"] = {
    event = {"BufEnter", "BufNewFile"},
    config = conf.vim_cursorwod
}

editor["tpope/vim-surround"] = {
    keys = "cdy"
}

editor["tpope/vim-commentary"] = {
    keys = "g",
    requires = "JoosepAlviste/nvim-ts-context-commentstring"
}

editor["kana/vim-niceblock"] = {
    opt = true
}

editor["airblade/vim-rooter"] = {event = "BufEnter"}

editor["sbdchd/neoformat"] = {
    cmd = "Neoformat",
    config = conf.neoformat
}

editor["ray-x/lsp_signature.nvim"] = {
    after = "nvim-treesitter",
    config = function()
        require "lsp_signature".on_attach()
    end
}

editor["andymass/vim-matchup"] = {
    keys = "%"
}

editor["f-person/git-blame.nvim"] = {
    cmd = "GitBlameToggle",
    config = conf.gitblame
}
return editor
