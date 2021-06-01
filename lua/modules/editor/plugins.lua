local editor = {}
local conf = require("modules.editor.config")

editor["rhysd/accelerated-jk"] = {
    opt = true
}

editor["norcalli/nvim-colorizer.lua"] = {
    ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact"},
    config = conf.nvim_colorizer
}

editor["itchyny/vim-cursorword"] = {
    event = {"BufReadPre", "BufNewFile"},
    config = conf.vim_cursorwod
}

editor["tpope/vim-surround"] = {
    event = "BufRead"
}

editor["tpope/vim-commentary"] = {
    event = "BufReadPre"
}

editor["kana/vim-niceblock"] = {
    opt = true
}

editor["airblade/vim-rooter"] = {opt = true}

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
