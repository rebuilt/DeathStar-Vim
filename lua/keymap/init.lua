local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
-- local map_args = bind.map_args
require("keymap.config")

local plug_map = {
    ["i|<TAB>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
    ["i|<S-TAB>"] = map_cmd("v:lua.s_tab_complete()"):with_silent():with_expr(),
    -- person keymap
    ["n|mf"] = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap(

    ),
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|Y"] = map_cmd("y$"):with_noremap():with_silent(),

    ["n|<C-f>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap(

    ):with_nowait(),
    ["n|<C-b>"] = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap(

    ):with_nowait(),
    ["n|[e"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
    ["n|]e"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<A-t>"] = map_cu("Lspsaga open_floaterm"):with_noremap():with_silent(),
    ["t|<A-t>"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap():with_silent(),

    -- Plugin acceleratedjk
    ["n|j"] = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"] = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),

    -- Plugin vim_niceblock
    ["x|I"] = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    ["x|gI"] = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    ["x|A"] = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),

    -- Personal mappings
    ["n|<F7>"] = map_cr(":set relativenumber!"):with_silent(),
    ["i|jk"] = map_cmd("<ESC>"):with_silent(),
    ["i|kj"] = map_cmd("<ESC>"):with_silent(),
    ["i|jj"] = map_cmd("<ESC>"):with_silent(),
    ["n|<ESC>"] = map_cmd(":nohls<ESC>"):with_silent(),
    ["n|<TAB>"] = map_cr(":bnext"):with_silent(),
    ["n|<S-TAB>"] = map_cr(":bprevious"):with_silent(),
    ["n|<S-x>"] = map_cr(":bd"):with_silent()
}

bind.nvim_load_mapping(plug_map)
