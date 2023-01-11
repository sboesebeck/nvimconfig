return {
    "lewis6991/impatient.nvim", -- speed up startup
    -- My plugins here
    "wbthomason/packer.nvim", -- Have packer manage itself
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "windwp/nvim-spectre", -- search and replace
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    -- "numToStr/Comment.nvim", -- commenting
    -- use({ "JoosepAlviste/nvim-ts-context-commentstring" })
    -- "ahmedkhalf/project.nvim", -- project settings
    "kyazdani42/nvim-web-devicons", -- icons
    -- "akinsho/bufferline.nvim", -- status line
    "moll/vim-bbye", -- closing of buffers
    "DanilaMihailov/beacon.nvim", -- cursor jump
    "fladson/vim-kitty",

    -- "akinsho/toggleterm.nvim", -- show terminal
    -- "lukas-reineke/indent-blankline.nvim", -- indent blank lines
    -- "goolord/alpha-nvim", -- startup menu
    -- use({ "j-morano/buffer_manager.nvim" })
    -- Colorschemes
    "rktjmp/lush.nvim", -- color
    "folke/lsp-colors.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    "lunarvim/darkplus.nvim",
    "danilo-augusto/vim-afterglow",
    "jacoborus/tender.vim",
    "christophermca/meta5",
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').load()
        end
    },
    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp", -- lsp connection
    "hrsh7th/cmp-nvim-lua", -- lua
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    "ray-x/lsp_signature.nvim", -- help with signature of methods while typing
    "sbdchd/neoformat", --  formatter
    "onsails/lspkind.nvim", -- better code completion disply / icons

    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- enable LSP
    -- use({'zchee/deoplete-jedi'})
    --[[ use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer ]]
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
            })
        end
    },
    -- "RRethy/vim-illuminate", -- hightlighting same word unter cursor

    -- Telescope
    "kkharji/sqlite.lua", -- needed for some other plugins
    -- "zim-telescope/telescope.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    "xiyaowong/telescope-emoji.nvim",
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = "kkharji/sqlite.lua"
    }, -- recently used files

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context", --- show current context on top of view!
    -- Notetaking
    -- use({'lervag/wiki.vim'})

    -- utils
    -- use({'rcarriga/nvim-notify'})
    -- use({
    -- 	"https://github.com/nat-418/boole.nvim",
    -- 	config = function()
    -- 		require("boole").setup()
    -- 	end,
    -- })
    -- Git
    "f-person/git-blame.nvim", -- blam linej
    "kdheepak/lazygit.nvim", -- lazygit opening
    -- use({"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}) -- another git client
    -- "tpope/vim-fugitive",
    "airblade/vim-gitgutter", --- git status
    -- DAP
    "mfussenegger/nvim-dap", -- debugging
    "rcarriga/nvim-dap-ui", -- debuggin ui
    "ravenxrz/DAPInstall.nvim",
    "mfussenegger/nvim-dap-python",
    -- "HiPhish/debugpy.nvim",
    "MattesGroeger/vim-bookmarks",

    -- JAVA
    "mfussenegger/nvim-jdtls", -- java support

    "andymass/vim-matchup",
    "vim-test/vim-test",
    "j-hui/fidget.nvim",

    --
    'godlygeek/tabular',
    -- 'preservim/vim-markdown',

    -- tools
    'kevinhwang91/nvim-bqf',
    "folke/which-key.nvim",

    {
        "jakewvincent/mkdnflow.nvim",
        -- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
        config = function() require("mkdnflow").setup({}) end
    },
    {
        "andrewferrier/wrapping.nvim",
        config = function() require("wrapping").setup() end
    },

    {
        "gorbit99/codewindow.nvim",
        config = function()
            local codewindow = require("codewindow")
            codewindow.setup()
            codewindow.apply_default_keybinds()
        end
    }, ---- mini view of files

    -- use({
    -- 	"nagy135/typebreak.nvim",
    -- 	config = function()
    -- 		vim.keymap.set("n", "<leader>tb", require("typebreak").start, { desc = "Typebreak" })
    -- 	end,

    -- Put this at the end after all plugins
    -- if PACKER_BOOTSTRAP then require("packer").sync() end
}
