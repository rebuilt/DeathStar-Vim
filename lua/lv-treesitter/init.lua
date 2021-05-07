require'nvim-treesitter.configs'.setup {
    ensure_installed = O.treesitter.ensure_installed, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = O.treesitter.ignore_install,
    highlight = {
        enable = O.treesitter.highlight.enabled -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    -- indent = {enable = {"javascriptreact"}},
    indent = {enable = true},
    autotag = {enable = true},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?'
        }
    }
}

