local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {
        "neovim/nvim-lspconfig",
        opt = true,
        cond = function()
            return P.lspconfig.enabled
        end
    }
    use {
        "glepnir/lspsaga.nvim",
        opt = true,
        cond = function()
            return P.lspsaga.enabled
        end
    }
    use {
        "kabouzeid/nvim-lspinstall",
        opt = true,
        cond = function()
            return P.lspinstall.enabled
        end
    }

    -- Telescope
    use {
        "nvim-lua/popup.nvim",
        opt = true,
        cond = function()
            return P.popup.enabled
        end
    }
    use {
        "nvim-lua/plenary.nvim",
        opt = true,
        cond = function()
            return P.plenary.enabled
        end
    }
    use {
        "nvim-telescope/telescope.nvim",
        opt = true,
        cond = function()
            return P.telescope.enabled

        end,
        config = function()
            require 'lv-telescope'
        end
    }
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        opt = true,
        cond = function()
            return P.telescopeFzy.enabled
        end
    }

    -- Debugging
    use {
        "mfussenegger/nvim-dap",
        opt = true,
        cond = function()
            return P.dap.enabled
        end
    }

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        opt = true,
        cond = function()
            return P.compe.enabled
        end,
        config = function()
            require 'lv-compe'
        end
    }
    use {
        "hrsh7th/vim-vsnip",
        opt = true,
        cond = function()
            return P.vsnip.enabled
        end
    }
    use {
        "rafamadriz/friendly-snippets",
        opt = true,
        cond = function()
            return P.friendlySnippets.enabled
        end
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        cond = function()
            return P.treesitter.enabled

        end,
        config = function()
            require('lv-treesitter')
        end
    }
    use {
        "windwp/nvim-ts-autotag",
        opt = true,
        cond = function()
            return P.tsAutotag.enabled

        end
    }

    -- Explorer
    use {
        "kyazdani42/nvim-tree.lua",
        opt = true,
        cond = function()
            return P.nvimTree.enabled
        end
    }
    -- TODO remove when open on dir is supported by nvimtree
    use {
        "kevinhwang91/rnvimr",
        opt = true,
        cond = function()
            return P.rnvimr.enabled
        end,
        config = function()
            require 'lv-rnvimr'
        end
    }

    -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
    use {
        "lewis6991/gitsigns.nvim",
        cond = function()
            return P.gitsigns.enabled
        end,
        config = function()
            require('lv-gitsigns')
        end
    }
    use {
        "folke/which-key.nvim",
        opt = true,
        cond = function()
            return P.whichkey.enabled
        end,
        config = function()
            require 'lv-which-key'
        end
    }
    use {
        "ChristianChiarulli/dashboard-nvim",
        opt = true,
        cond = function()
            return P.dashboard.enabled
        end,
        config = function()
            require 'lv-dashboard'
        end
    }
    use {
        "windwp/nvim-autopairs",
        opt = true,
        cond = function()
            return P.autopairs.enabled
        end,
        config = function()
            require 'lv-autopairs'
        end
    }
    use {
        "terrortylor/nvim-comment",
        opt = true,
        cond = function()
            return P.comment.enabled
        end,
        config = function()
            require 'lv-comment'
        end
    }
    use {
        "kevinhwang91/nvim-bqf",
        opt = true,
        cond = function()
            return P.bqf.enabled
        end
    }

    -- Color
    use {
        "christianchiarulli/nvcode-color-schemes.vim",
        opt = true,
        cond = function()
            return P.nvcodeColorschemes.enabled
        end
    }

    -- Icons
    use {
        "kyazdani42/nvim-web-devicons",
        opt = true,
        cond = function()
            return P.webDevicons.enabled
        end
    }

    -- Status Line and Bufferline
    use {
        "glepnir/galaxyline.nvim",
        opt = true,
        cond = function()
            return P.galaxyline.enabled
        end,
        config = function()
            require 'lv-galaxyline'
        end
    }
    use {
        "romgrk/barbar.nvim",
        opt = true,
        cond = function()
            return P.barbar.enabled
        end,
        config = function()
            require 'lv-barbar'
        end
    }

    if (P.lspconfig.enabled) then require_plugin("nvim-lspconfig") end
    if (P.lspsaga.enabled) then require_plugin("lspsaga.nvim") end
    if (P.lspinstall.enabled) then require_plugin("nvim-lspinstall") end
    if (P.popup.enabled) then require_plugin("popup.nvim") end
    if (P.plenary.enabled) then require_plugin("plenary.nvim") end
    if (P.telescope.enabled) then require_plugin("telescope.nvim") end
    if (P.dap.enabled) then require_plugin("nvim-dap") end
    if (P.compe.enabled) then require_plugin("nvim-compe") end
    if (P.vsnip.enabled) then require_plugin("vim-vsnip") end
    if (P.friendlySnippets.enabled) then require_plugin("friendly-snippets") end
    if (P.treesitter.enabled) then require_plugin("nvim-treesitter") end
    if (P.tsAutotag.enabled) then require_plugin("nvim-ts-autotag") end
    if (P.nvimTree.enabled) then require_plugin("nvim-tree.lua") end
    if (P.rnvimr.enabled) then require_plugin("rnvimr") end
    if (P.gitsigns.enabled) then require_plugin("gitsigns.nvim") end
    if (P.whichkey.enabled) then require_plugin("which-key.nvim") end
    if (P.dashboard.enabled) then require_plugin("dashboard-nvim") end
    if (P.autopairs.enabled) then require_plugin("nvim-autopairs") end
    if (P.comment.enabled) then require_plugin("nvim-comment") end
    if (P.bqf.enabled) then require_plugin("nvim-bqf") end
    if (P.nvcodeColorschemes.enabled) then require_plugin("nvcode-color-schemes.vim") end
    if (P.webDevicons.enabled) then require_plugin("nvim-web-devicons") end
    if (P.galaxyline.enabled) then require_plugin("galaxyline.nvim") end
    if (P.barbar.enabled) then require_plugin("barbar.nvim") end

    -- User Plugins

    use {"liuchengxu/vista.vim", opt = true}
    use {"tpope/vim-repeat", opt = true}
    use {"tpope/vim-surround", opt = true}
    use {"tpope/vim-fugitive", opt = true}
    use {
        "norcalli/nvim-colorizer.lua",
        opt = true,
        config = function()
            require 'colorizer'
        end
    }
    use {"unblevable/quick-scope", opt = true}
    -- use {"airblade/vim-gitgutter", opt = true}
    use {"airblade/vim-rooter", opt = true}
    use {"nvim-treesitter/playground", opt = true}

    require_plugin("vista.vim")
    require_plugin("vim-repeat")
    require_plugin("vim-surround")
    require_plugin("vim-fugitive")
    require_plugin("nvim-colorizer")
    require_plugin("quick-scope")
    -- require_plugin("vim-gitgutter")
    require_plugin("vim-rooter")
    require_plugin("playground")

end)
