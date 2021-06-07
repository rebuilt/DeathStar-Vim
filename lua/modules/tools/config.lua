local config = {}

local function load_env_file()
    local env_file = os.getenv("HOME") .. "/.env"
    local env_contents = {}
    if vim.fn.filereadable(env_file) ~= 1 then
        print(".env file does not exist")
        return
    end
    local contents = vim.fn.readfile(env_file)
    for _, item in pairs(contents) do
        local line_content = vim.fn.split(item, "=")
        env_contents[line_content[1]] = line_content[2]
    end
    return env_contents
end

local function load_dbs()
    local env_contents = load_env_file()
    local dbs = {}
    for key, value in pairs(env_contents) do
        if vim.fn.stridx(key, "DB_CONNECTION_") >= 0 then
            local db_name = vim.fn.split(key, "_")[3]:lower()
            dbs[db_name] = value
        end
    end
    return dbs
end

function config.vim_dadbod_ui()
    if packer_plugins["vim-dadbod"] and not packer_plugins["vim-dadbod"].loaded then
        vim.cmd [[packadd vim-dadbod]]
    end
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_winwidth = 35
    vim.g.db_ui_save_location = os.getenv("HOME") .. "/.cache/vim/db_ui_queries"
    vim.g.dbs = load_dbs()
end

function config.vim_vista()
    vim.g["vista#renderer#enable_icon"] = 1
    vim.g.vista_disable_statusline = 1
    vim.g.vista_default_executive = "ctags"
    vim.g.vista_echo_cursor_strategy = "floating_win"
    vim.g.vista_vimwiki_executive = "markdown"
    vim.g.vista_executive_for = {
        vimwiki = "markdown",
        pandoc = "markdown",
        markdown = "toc",
        typescript = "nvim_lsp",
        typescriptreact = "nvim_lsp"
    }
end

function config.dap()
    vim.cmd(
        [[
    nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
    nnoremap <silent> <F6> :lua require'dap'.step_over()<CR>
    nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F8> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
    nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
]]
    )
    local dap = require("dap")
    dap.adapters.ruby = {
        type = "executable",
        command = "bundle",
        args = {"exec", "readapt", "stdio"}
    }

    dap.configurations.ruby = {
        {
            type = "ruby",
            request = "launch",
            name = "Rails",
            program = "bundle",
            programArgs = {"exec", "rails", "s"},
            useBundler = true
        }
    }
end

return config
