local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "lewis6991/impatient.nvim" })
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-spectre" })
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "stevearc/dressing.nvim" })
	use({ "mrjones2014/legendary.nvim" })
	-- use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "DanilaMihailov/beacon.nvim" }) -- cursor jump

	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	-- use({ "j-morano/buffer_manager.nvim" })
	use({ "rktjmp/lush.nvim" })
	-- Colorschemes
	use({ "folke/lsp-colors.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "danilo-augusto/vim-afterglow" })
	use({ "jacoborus/tender.vim" })
	use({ "christophermca/meta5" })
	-- cmp plugins
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	-- use({ "hrsh7th/cmp-nvim-lsp-signature-help"})
	use({ "ray-x/lsp_signature.nvim" })
	use({ "sbdchd/neoformat" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	use({ "onsails/lspkind.nvim" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		-- config = function()
		-- 	require("trouble").setup({
		-- 		-- your configuration comes here
		-- 		-- or leave it empty to use the default settings
		-- 		-- refer to the configuration section below
		-- 	})
		-- end,
	})
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "simrat39/rust-tools.nvim" })
	-- use({'zchee/deoplete-jedi'})
	--[[ use { "williamboman/nvim-lsp-installer" } -- simple to use language server installer ]]
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				-- your configuration
			})
		end,
	})
	use({ "RRethy/vim-illuminate" })

	-- Telescope
	use({ "kkharji/sqlite.lua" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "xiyaowong/telescope-emoji.nvim" })
	use({ "nvim-telescope/telescope-frecency.nvim", requires = "kkharji/sqlite.lua" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	-- Notetaking
	-- use({'lervag/wiki.vim'})

	-- utils
	use({ "nacro90/numb.nvim" })
	use({ "karb94/neoscroll.nvim" })
	-- use({'rcarriga/nvim-notify'})
	-- use({
	-- 	"https://github.com/nat-418/boole.nvim",
	-- 	config = function()
	-- 		require("boole").setup()
	-- 	end,
	-- })
	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "f-person/git-blame.nvim" })
	use({ "kdheepak/lazygit.nvim" })
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	-- use({"tpope/vim-fugitive"})
	use({ "airblade/vim-gitgutter" })
	-- DAP
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })
	use({ "mfussenegger/nvim-dap-python" })
	-- use({"HiPhish/debugpy.nvim"})
	use({ "MattesGroeger/vim-bookmarks" })

	-- JAVA
	use({ "mfussenegger/nvim-jdtls" })

	-- tools

	use({ "simrat39/symbols-outline.nvim" })
	use({ "folke/which-key.nvim" })
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"jakewvincent/mkdnflow.nvim",
		-- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
		config = function()
			require("mkdnflow").setup({})
		end,
	})
	use({
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup()
		end,
	})

	use({
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup()
			codewindow.apply_default_keybinds()
		end,
	})
	-- use({ "ldelossa/nvim-ide" })

	-- use({
	-- 	"nagy135/typebreak.nvim",
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>tb", require("typebreak").start, { desc = "Typebreak" })
	-- 	end,

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
