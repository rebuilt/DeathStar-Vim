local config = {}

function config.galaxyline()
    require("modules.ui.eviline")
end

function config.nvim_bufferline()
    require("bufferline").setup {
        options = {
            modified_icon = "✥",
            buffer_close_icon = "",
            mappings = false,
            always_show_bufferline = false
        }
    }
end

function config.dashboard()
    local home = os.getenv("HOME")
    vim.g.dashboard_footer_icon = "🐬 "
    vim.g.dashboard_preview_command = "cat"
    vim.g.dashboard_preview_pipeline = "lolcat -F 0.3"
    vim.g.dashboard_preview_file = home .. "/.config/nvim/static/neovim.cat"
    vim.g.dashboard_preview_file_height = 12
    vim.g.dashboard_preview_file_width = 80
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
        last_session = {
            description = {"  Recently laset session                  SPC s l"},
            command = "SessionLoad"
        },
        find_history = {
            description = {"  Recently opened files                   SPC f h"},
            command = "DashboardFindHistory"
        },
        find_file = {
            description = {"  Find  File                              SPC f f"},
            command = "Telescope find_files find_command=rg,--hidden,--files"
        },
        new_file = {
            description = {"  File Browser                            SPC f b"},
            command = "Telescope file_browser"
        },
        find_word = {
            description = {"  Find  word                              SPC f w"},
            command = "DashboardFindWord"
        },
        find_dotfiles = {
            description = {"  Open Personal dotfiles                  SPC f d"},
            command = "Telescope dotfiles path=" .. home .. "/.dotfiles"
        },
        go_source = {
            description = {"  Find Go Source Code                     SPC f s"},
            command = "Telescope gosource"
        }
    }
end

function config.nvim_tree()
    -- On Ready Event for Lazy Loading work
    require("nvim-tree.events").on_nvim_tree_ready(
        function()
            vim.cmd("NvimTreeRefresh")
        end
    )
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_hide_dotfiles = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_bindings = {
        ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
        ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
        ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>"
    }
    vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "✚",
            staged = "✚",
            unmerged = "≠",
            renamed = "≫",
            untracked = "★"
        }
    }
end

function config.gitsigns()
    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end
    require("gitsigns").setup {
        signs = {
            add = {hl = "GitGutterAdd", text = "▋"},
            change = {hl = "GitGutterChange", text = "▋"},
            delete = {hl = "GitGutterDelete", text = "▋"},
            topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
            changedelete = {hl = "GitGutterChange", text = "▎"}
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]g"] = {expr = true, '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
            ["n [g"] = {expr = true, '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
            -- Text objects
            ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
            ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        }
    }
end

function config.indent_blakline()
    vim.g.indent_blankline_char = "│"
    vim.g.indent_blankline_show_first_indent_level = true
    vim.g.indent_blankline_filetype_exclude = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline",
        "" -- for all buffers without a file type
    }
    vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_context_patterns = {
        "class",
        "function",
        "method",
        "block",
        "list_literal",
        "selector",
        "^if",
        "^table",
        "if_statement",
        "while",
        "for"
    }
    -- because lazy load indent-blankline so need readd this autocmd
    vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

function config.which_key()
    local wk = require("which-key")
    wk.setup {}

    wk.register(
        {
            l = {
                name = "LSP",
                i = {"<cmd>LspInfo<cr>", "LspInfo"},
                l = {"<cmd>LspLog<cr>", "LspLog"},
                r = {"<cmd>Lspsaga rename<cr>", "Rename"},
                a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
                d = {"<cmd>Lspsaga preview_definition<cr>", "Definition"},
                D = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation"},
                s = {"<cmd>Lspsaga signature_help<cr>", "Signature Help"},
                h = {"<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder"},
                t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition"},
                w = {"<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbol"},
                e = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
                f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
                R = {"<cmd>TroubleToggle lsp_refences<cr>", "References"}
            },
            g = {
                name = "Git",
                l = {
                    "<cmd>Lspsaga open_floaterm lazygit<cr>",
                    "Lazy Git"
                },
                o = {
                    "<cmd>Telescope git_status<cr>",
                    "Lazy Git"
                },
                b = {
                    "<cmd>Telescope git_branches<cr>",
                    "Branches"
                },
                g = {
                    "<cmd>Telescope git_commits<cr>",
                    "Commits"
                },
                G = {
                    "<cmd>Telescope git_bcommits<cr>",
                    "BCommits"
                }
            },
            p = {
                name = "Packer",
                u = {"<cmd>PackerUpdate<cr>", "Update"},
                i = {"<cmd>PackerInstall<cr>", "Install"},
                s = {"<cmd>PackerSync<cr>", "Sync"},
                c = {"<cmd>PackerCompile<cr>", "Compile"}
            },
            B = {"<cmd>Telescope buffers<cr>", "Buffers"},
            f = {
                name = "Find",
                b = {"<cmd>Telescope file_browser<cr>", "File Browser"},
                f = {"<cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<cr>", "File"},
                g = {"<cmd>Telescope git_files<cr>", "Git files"},
                w = {"<cmd>Telescope live_grep<cr>", "Word"},
                c = {"<cmd>Telescope git_commits<cr>", "Commits"},
                t = {"<cmd>Telescope help_tags<cr>", "Tags"},
                j = {"<cmd>Telescope jumplist<cr>", "Jumplist"},
                q = {"<cmd>Telescope quickfix<cr>", "quickfix"},
                d = {"<cmd>Telescope dotfiles path=" .. os.getenv("HOME") .. "/.dotfiles<cr>", "Neovim config"},
                s = {"<cmd>Telescope gosource<cr>", "Go Source"}
            },
            M = {"<cmd>Telescope marks<cr>", "Marks"},
            v = {"<cmd>Vista!!<cr>", "Vista"},
            r = {
                "<cmd> lua require'internal.quickrun'.run_command()<CR>",
                "Run Command"
            },
            e = {
                "<cmd>NvimTreeToggle<cr>",
                "File Browser"
            },
            h = {
                name = "Hunks"
            },
            m = {
                name = "Markdown",
                v = {"<cmd>MarkdownPreview<cr>", "Markdown Preview"},
                g = {"<cmd>Glow<cr>", "Glow"}
            },
            R = {"<cmd>Telescope registers<cr>", "Registers"},
            x = {
                name = "Trouble",
                x = {"<cmd>TroubleToggle<cr>", "Trouble"},
                w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
                d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document Diagnostics"},
                q = {"<cmd>TroubleToggle quickfix<cr>", "QuickFix"},
                l = {"<cmd>TroubleToggle loclist<cr>", "LocationList"}
            },
            Q = {"<cmd>Telescope quickfix<cr>", "QuickFix"},
            L = {"<cmd>Telescope loclist<cr>", "Location"},
            s = {"<cmd>set spell<cr>", "SpellCheck"}
            --             o = {"<cmd>DBUIToggle<cr>", "Dadbod"}
        },
        {prefix = "<leader>"}
    )
end

function config.bqf()
    require("bqf").setup(
        {
            auto_enable = true,
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = {"┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"}
            },
            func_map = {
                vsplit = "",
                ptogglemode = "z,",
                stoggleup = ""
            },
            filter = {
                fzf = {
                    action_for = {["ctrl-s"] = "split"},
                    extra_opts = {"--bind", "ctrl-o:toggle-all", "--prompt", "> "}
                }
            }
        }
    )
end

function config.trouble()
    require("trouble").setup {}
end

return config
