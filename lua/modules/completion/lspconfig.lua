local vim = vim
local api = vim.api
local lspconfig = require "lspconfig"
local global = require "core.global"
local format = require("modules.completion.format")

if not packer_plugins["lspsaga.nvim"].loaded then
    vim.cmd [[packadd lspsaga.nvim]]
end

local saga = require "lspsaga"
saga.init_lsp_saga(
    {
        code_action_icon = "💡"
    }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

function _G.reload_lsp()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd [[edit]]
end

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("edit " .. path)
end

vim.cmd("command! -nargs=0 LspLog call v:lua.open_lsp_log()")
vim.cmd("command! -nargs=0 LspRestart call v:lua.reload_lsp()")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = true,
        signs = {
            enable = true,
            priority = 20
        },
        -- Disable a feature
        update_in_insert = false
    }
)

local enhance_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        format.lsp_before_save()
    end
    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.gopls.setup {
    cmd = {"gopls", "--remote=auto"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    init_options = {
        usePlaceholders = true,
        completeUnimported = true
    }
}

lspconfig.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        enhance_attach(client)
    end
}

lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu"
    }
}

lspconfig.texlab.setup {}

require "lspconfig/configs".emmet_ls = {
    default_config = {
        cmd = {"emmet-ls", "--stdio"},
        filetypes = {"html", "css"},
        root_dir = require "lspconfig".util.root_pattern(".git", vim.fn.getcwd())
    }
}

lspconfig.html.setup {
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}

USER = vim.fn.expand("$USER")

local sumneko_root_path = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/"
local sumneko_binary = "/home/" .. USER .. "/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server"

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}
            }
        }
    }
}

lspconfig.efm.setup {
    cmd = {"/home/" .. USER .. "/.local/share/nvim/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

vim.cmd([[
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
]])

local servers = {
    "dockerls",
    "bashls",
    "pyright",
    "solargraph",
    "emmet_ls",
    "html"
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = enhance_attach
    }
end
