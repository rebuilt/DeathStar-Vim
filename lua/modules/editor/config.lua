local config = {}

function config.nvim_colorizer()
    local defaults = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "background" -- Set the display mode.
    }

    require "colorizer".setup {
        -- css = {rgb_fn = true},
        -- scss = {rgb_fn = true},
        -- sass = {rgb_fn = true},
        css = defaults,
        scss = defaults,
        sass = defaults,
        html = defaults,
        stylus = {rgb_fn = true},
        vim = {names = true},
        tmux = {names = false},
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    }
end

function config.vim_cursorwod()
    vim.api.nvim_command("augroup user_plugin_cursorword")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
    vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
    vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
    vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
    vim.api.nvim_command("augroup END")
end

function config.neoformat()
    vim.cmd([[
    augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
    augroup END
    ]])
end

function config.gitblame()
    vim.cmd("highlight default link gitblame SpecialComment")
    vim.g.gitblame_enabled = 0
end

function config.commentstring()
    require "nvim-treesitter.configs".setup {
        context_commentstring = {
            enable = true
        }
    }
end

return config
