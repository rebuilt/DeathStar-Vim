local tools = {}
local conf = require("modules.tools.config")

tools["kristijanhusak/vim-dadbod-ui"] = {
    cmd = {"DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer"},
    config = conf.vim_dadbod_ui,
    requires = {{"tpope/vim-dadbod", opt = true}}
}

tools["unblevable/quick-scope"] = {
  keys = {"f","F","t","T"},
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

tools['iamcco/markdown-preview.nvim'] = {
  ft = "markdown",
  run = ':call mkdp#util#install()',
  config = function ()
    vim.g.mkdp_auto_start = 1
  end
}

tools["tpope/vim-fugitive"] = {
  cmd = {"G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit"}
}

tools["turbio/bracey.vim"] = {
  cmd = {"Bracey","BracyStop", "BraceyReload", "BraceyEval"},
  run = "npm install --prefix server",
}
return tools
