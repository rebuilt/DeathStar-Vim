local tools = {}
local conf = require("modules.tools.config")

tools["kristijanhusak/vim-dadbod-ui"] = {
    cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
    config = conf.vim_dadbod_ui,
    requires = {{"tpope/vim-dadbod", opt = true}}
}

tools["glepnir/prodoc.nvim"] = {
    event = "BufReadPre"
}

tools["unblevable/quick-scope"] = {
    event = "BufEnter"
}

tools["liuchengxu/vista.vim"] = {
    cmd = "Vista",
    config = conf.vim_vista
}

-- tools['brooth/far.vim'] = {
--   cmd = {'Far','Farp'},
--   config = function ()
--     vim.g['far#source'] = 'rg'
--   end
-- }

-- tools['iamcco/markdown-preview.nvim'] = {
--   cmd = 'MarkdownPreview',
--   config = function ()
--     vim.g.mkdp_auto_start = 1
--   end
-- }

tools['tpope/vim-fugitive'] = { } 

return tools
