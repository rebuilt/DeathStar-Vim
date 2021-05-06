require('plugins')
require('lv-globals')
vim.cmd('luafile ~/.config/nvim/lv-settings.lua')
require('lv-utils')
require('settings')
require('lv-autocommands')
require('keymappings')
require('lv-nvimtree') -- This plugin must be required somewhere before colorscheme.  Placing it after will break navigation keymappings
require('colorscheme') -- This plugin must be required somewhere after nvimtree. Placing it before will break navigation keymappings 
require('lv-galaxyline')
require('lv-comment')
require('lv-compe')
require('lv-barbar')
require('lv-dashboard')
require('lv-telescope')
require('lv-gitsigns')
require('lv-treesitter')
require('lv-autopairs')
require('lv-rnvimr')
require('lv-which-key')
require('colorizer')

-- TODO is there a way to do this without vimscript
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')

-- LSP
require('lsp')
require('lsp.clangd')
require('lsp.php-ls')
require('lsp.dart-ls')
require('lsp.lua-ls')
require('lsp.bash-ls')
require('lsp.go-ls')
require('lsp.js-ts-ls')
require('lsp.python-ls')
require('lsp.rust-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.terraform-ls')
require('lsp.vim-ls')
require('lsp.graphql-ls')
require('lsp.docker-ls')
require('lsp.html-ls')
require('lsp.css-ls')
require('lsp.emmet-ls')
require('lsp.efm-general-ls')
require('lsp.latex-ls')
require('lsp.svelte-ls')
-- require('lsp.tailwindcss-ls')
require('lsp.ruby-ls')
require('lsp.kotlin-ls')
require('lsp.vue-ls')
require('lsp.angular-ls')

