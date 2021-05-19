local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
require("keymap.config")

local plug_map = {
    ["i|<TAB>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
    ["i|<S-TAB>"] = map_cmd("v:lua.s_tab_complete()"):with_silent():with_expr(),
    -- person keymap
    ["n|mf"] = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap(

    ),
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap():with_nowait(),
    ["n|<leader>pc"] = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>ll"] = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
    ["n|<C-f>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap(

    ):with_nowait(),
    ["n|<C-b>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap(

    ):with_nowait(),
    ["n|[e"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
    ["n|]e"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<Leader>la"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
    ["v|<Leader>la"] = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|<Leader>ld"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
    ["n|<Leader>lD"] = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ls"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
    ["n|<Leader>lr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
    ["n|<Leader>lh"] = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent(),
    ["n|<Leader>lt"] = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>lw"] = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>le"] = map_cr("Lspsaga show_line_diagnostics"):with_noremap():with_silent(),
    ["n|<leader>lf"] = map_cr("<cmd>lua vim.lsp.buf.formatting()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ct"] = map_args("Template"),
    -- Plugin nvim-tree
    ["n|<Leader>e"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>om"] = map_cu("MarkdownPreview"):with_noremap():with_silent(),
    -- Plugin DadbodUI
    ["n|<Leader>od"] = map_cr("DBUIToggle"):with_noremap():with_silent(),
    -- Plugin Floaterm
    ["n|<A-t>"] = map_cu("Lspsaga open_floaterm"):with_noremap():with_silent(),
    ["t|<A-t>"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap():with_silent(),
    ["n|<Leader>g"] = map_cu("Lspsaga open_floaterm lazygit"):with_noremap():with_silent(),
    -- Far.vim
    --   ["n|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    --   ["v|<Leader>fz"]     = map_cr('Farf'):with_noremap():with_silent();
    -- Plugin Telescope
    ["n|<Leader>B"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
    ["n|<Leader>Q"] = map_cu("Telescope quickfix"):with_noremap():with_silent(),
    ["n|<Leader>L"] = map_cu("Telescope loclist"):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu("Telescope file_browser"):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu("Telescope find_files find_command=rg,--hidden,--files"):with_noremap():with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
    ["n|<Leader>fl"] = map_cu("Telescope loclist"):with_noremap():with_silent(),
    ["n|<Leader>fc"] = map_cu("Telescope git_commits"):with_noremap():with_silent(),
    ["n|<Leader>ft"] = map_cu("Telescope help_tags"):with_noremap():with_silent(),
    ["n|<Leader>M"] = map_cu("Telescope marks"):with_noremap():with_silent(),
    ["n|<Leader>fj"] = map_cu("Telescope jumplist"):with_noremap():with_silent(),
    ["n|<Leader>fq"] = map_cu("Telescope quickfix"):with_noremap():with_silent(),
    ["n|<Leader>fd"] = map_cu("Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles"):with_noremap():with_silent(

    ),
    ["n|<Leader>fs"] = map_cu("Telescope gosource"):with_noremap():with_silent(),
    -- prodoc
    ["n|gcc"] = map_cu("ProComment"):with_noremap():with_silent(),
    ["x|gcc"] = map_cr("ProComment"),
    ["n|gcj"] = map_cu("ProDoc"):with_silent():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"] = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"] = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin QuickRun
    ["n|<Leader>r"] = map_cr("<cmd> lua require'internal.quickrun'.run_command()<CR>"):with_noremap():with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"] = map_cu("Vista!!"):with_noremap():with_silent(),
    -- Plugin vim-operator-surround
    ["n|sa"] = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    ["n|sd"] = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    ["n|sr"] = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Plugin vim_niceblock
    ["x|I"] = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    ["x|gI"] = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    ["x|A"] = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),
    -- Personal mappings
    ["n|<F7>"] = map_cr(":set relativenumber!"):with_silent(),
    ["i|jk"] = map_cmd("<ESC>"):with_silent(),
    ["i|kj"] = map_cmd("<ESC>"):with_silent(),
    ["i|jj"] = map_cmd("<ESC>"):with_silent(),
    ["n|<TAB>"] = map_cr(":bnext"):with_silent(),
    ["n|<S-TAB>"] = map_cr(":bprevious"):with_silent(),
    ["n|<leader>go"] = map_cr("Telescope git_status"):with_silent(),
    ["n|<leader>gb"] = map_cr("Telescope git_branches"):with_silent(),
    ["n|<leader>gg"] = map_cr("Telescope git_commits"):with_silent(),
    ["n|<leader>gG"] = map_cr("Telescope git_bcommits"):with_silent(),
    ["n|<S-x>"] = map_cr(":bd"):with_silent(),
    -- Markdown
    ["n|<leader>mg"] = map_cr(":Glow"):with_silent():with_noremap(),
    ["n|<leader>mv"] = map_cr(":MarkdownPreview"):with_silent():with_noremap(),
    ["n|<leader>R"] = map_cr(":Telescope registers"):with_silent():with_noremap(),
    -- Trouble
    ["n|<leader>xx"] = map_cr(":TroubleToggle"):with_silent():with_noremap(),
    ["n|<leader>xw"] = map_cr(":TroubleToggle lsp_workspace_diagnostics"):with_silent():with_noremap(),
    ["n|<leader>xd"] = map_cr(":TroubleToggle lsp_document_diagnostics"):with_silent():with_noremap(),
    ["n|<leader>xq"] = map_cr(":TroubleToggle quickfix"):with_silent():with_noremap(),
    ["n|<leader>xl"] = map_cr(":TroubleToggle loclist"):with_silent():with_noremap(),
    ["n|<leader>gR"] = map_cr(":TroubleToggle lsp_references"):with_silent():with_noremap()
}

bind.nvim_load_mapping(plug_map)
