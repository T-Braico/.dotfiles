-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }

    use 'folke/tokyonight.nvim'

    use 'tpope/vim-commentary'

    use 'tpope/vim-fugitive'

    use 'mbbill/undotree'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip'
    }

    use 'ellisonleao/gruvbox.nvim'

    use 'christoomey/vim-tmux-navigator'

    use {
        'RishabhRD/nvim-cheat.sh',
        requires = 'RishabhRD/popfix',
        config = function()
            vim.keymap.set("n", "<leader>cs", vim.cmd.Cheat)
        end
    }
end)
