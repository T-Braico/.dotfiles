return {

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = { ':TSUpdate', ':TSBufEnable highlight' }
    },

    'folke/tokyonight.nvim',

    'tpope/vim-commentary',

    'tpope/vim-fugitive',

    'mbbill/undotree',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip'
    },

    'ellisonleao/gruvbox.nvim',

    'christoomey/vim-tmux-navigator',

    {
        'RishabhRD/nvim-cheat.sh',
        dependencies = 'RishabhRD/popfix',
        config = function()
            vim.keymap.set("n", "<leader>cs", vim.cmd.Cheat)
        end
    },

    'ThePrimeagen/harpoon',

    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup()
        end,
    },

    'yssl/QFEnter',

    'mfussenegger/nvim-dap',

    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
    },

    {
        'julianolf/nvim-dap-lldb',
        dependencies = { 'mfussenegger/nvim-dap' },
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_initialized['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end
    },

    'Civitasv/cmake-tools.nvim',

    'voldikss/vim-floaterm',
    'alepez/vim-gtest',

    'ggandor/leap.nvim',

    'Vonr/align.nvim'

}
