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

editor["kana/vim-niceblock"] = {
    opt = true
}

editor["airblade/vim-rooter"] = {opt = true}

editor["sbdchd/neoformat"] = {
    event = "BufRead",
    config = conf.neoformat
}

return editor
