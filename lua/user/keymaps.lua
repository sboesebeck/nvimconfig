-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
vim.g.mapleader = " "
-- keymap("n","<PageDown>","<C-d>",opts)
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	-- Modes
	--   normal_mode = "n",
	--   insert_mode = "i",
	--   visual_mode = "v",
	--   visual_block_mode = "x",
	--   term_mode = "t",
	--   command_mode = "c",
	print("Cannot set keys without which-key")
else
	-- print("Configuring which-key")
	-- local opts = {
	--   mode = "n", -- NORMAL mode
	--   -- prefix: use "<leader>f" for example for mapping everything related to finding files
	--   -- the prefix is prepended to every mapping part of `mappings`
	--   prefix = "",
	--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	--   silent = true, -- use `silent` when creating keymaps
	--   noremap = true, -- use `noremap` when creating keymaps
	--   nowait = false, -- use `nowait` when creating keymaps
	-- }

	-- wk.register({
	-- 	t = {
	-- 		m = { "<cmd>lua require('jdtls').test_nearest_method()<CR>", "Run method" },
	-- 	},
	-- }, { mode = "n", prefix = "<leader>" })

	wk.register({
		-- K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		K = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
		g = {
			name = "Goto",
			f = { "<cmd>:HopChar1<CR>", "Hop char" },
			w = { "<cmd>:HopWord<CR>", "Hop word" },
			l = { "<cmd>:HopLine<CR>", "Hop Line" },
			-- d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" }, -- create a binding with label
			d = { "<cmd>Lspsaga peek_definition<cr>", "Definition" }, -- create a binding with label
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
			I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementation" },
			r = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
		},
	}, { mode = "n", prefix = "" })

	-- Toggleterm
	keymap("n", "<F12>", "<cmd>ToggleTerm direction=float<cr>", opts)
	keymap("n", "<F10>", "<cmd>ToggleTerm direction=horizontal<cr>", opts)
	-- debugging
	keymap("n", "<F8>", "<cmd>lua require('dap').step_over()<CR>", opts)
	keymap("n", "<F9>", "<cmd>lua require('dap').continue()<CR>", opts)
	keymap("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", opts)

	wk.register({
		f = {
			name = "Files",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			t = { "<cmd>Telescope live_grep<cr>", "Search for text" },
			p = { "<cmd>Telescope projects<cr>", "Show projects" },
			b = { "<cmd>Telescope buffers<cr>", "Show buffer" },
			e = {
				"<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
				"Recent files",
			},
			E = { "<cmd>Telescope frecency<cr>", "all last files" },
			-- n = { "<cmd>lua require('buffer_manager.ui').toggle_quick_menu()<CR>", "Buffer manager" },
		},
		s = {
			name = "Spectre",
			s = { "<cmd>lua require('spectre').open()<cr>", "Search/Replace" },
			w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search/Replace Word" },
			p = { "<cmd>lua require('spectre').open_file_search()<cr>", "File Search" },
			y = { "<cmd>SymbolsOutline<cr>", "Show outline" },
		},
		l = {
			f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format buffer" },
			i = { "<cmd>LspInfo<cr>", "Lsp Information" },
			-- I = { "<cmd>LspInstallInfo<cr>", "Lsp Installation Information" },
			-- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code..." },
			a = { "<cmd>Lspsaga code_action<cr>", "Code..." },
			j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Goto Next Item" },
			k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Goto Pref Item" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "LocList" },
			d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "diagnostic" },
		},
		d = {
			b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue..." },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into..." },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over..." },
			O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out..." },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Reppl toggle" },
			l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
			u = { "<cmd>lua require'dapui'.toggle()<cr>", "DapUI" },
			t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		},
		z = { ":bprevious<CR>", "previous buffer" },
		u = { ":bnext<CR>", "next buffer" },
		Q = { "<cmd>Bwipeout!<CR>", "Delete Buffer" },
		q = { "<cmd>Bdelete!<CR>", "close Buffer" },

		e = { ":NvimTreeToggle<CR>", "Explorer" },
		o = { ":lua require('codewindow').toggle_minimap()<cr>", "MiniMap" },
		gg = { "<cmd>LazyGit<CR>", "Lazygit" },
		gh = { "<cmd>LazyGitFilterCurrentFile<CR>", "Git history current file" },
		h = { "<cmd>nohlsearch<CR>", "no highlight search" },
		w = {
			h = { ":wincmd h<cr>", "Window to the left" },
			j = { ":wincmd j<cr>", "Window to the right" },
			k = { ":wincmd k<cr>", "Window up" },
			l = { ":wincmd l<cr>", "Window down" },
		},
		b = {
			q = { "<cmd>BookmarkToggle<cr>", "Bookmark" },
			k = { "<cmd>BookmarkNext<CR>", "next bookmark" },
			j = { "<cmd>BookmarkPrev<CR>", "prev bookmark" },
			x = { "<cmd>BookmarkClear<CR>", "clear bookmark" },
			X = { "<cmd>BookmarkClearAll<CR>", "clear all bookmarks" },
			a = { "<cmd>BookmarkAnnotate<CR>", "annotate bookmark" },
			i = { "<cmd>BookmarkShowAll<CR>", "show all bookmarks" },
		},
		-- keymap("n","<leader>mk","<cmd>BookmarkNext<CR>")
		-- keymap("n","<leader>mj","<cmd>BookmarkPrev<CR>")
		-- keymap("n","<leader>mx","<cmd>BookmarkClear<CR>")
		-- keymap("n","<leader>mX","<cmd>BookmarkClearAll<CR>")
		-- keymap("n","<leader>ma","<cmd>BookmarkAnnotate<CR>")
		-- keymap("n","<leader>mi","<cmd>BookmarkShowAll<CR>")
	}, { mode = "n", prefix = "<leader>" })

	-- Git
	-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
    
	wk.register({
       l ={
           a={"<cmd>Lspsaga code_action<cr>","Code..."}
        }
    },{mode="v",prefix="<leader>"})
	keymap("v", "<S-TAB>", "<gv", opts)
	keymap("v", "<TAB>", ">gv", opts)
	-- keymap("n", "<TAB>", ">>", opts)
	-- keymap("n", "<S-TAB>", "<<", opts)

	-- keymap("n", "<C-j>", "<cmd>:wincmd h<cr>", opts)
	-- keymap("n", "<C-k>", "<cmd>:wincmd j<cr>", opts)
	-- keymap("n", "<C-i>", "<cmd>:wincmd k<CR>", opts)
	-- keymap("n", "<C-l>", "<cmd>:wincmd l<CR>", opts)

	-- keymap("n", "<C-j>", "<C-w>h", opts)
	-- keymap("n", "<C-k>", "<C-w>j", opts)
	-- keymap("n", "<C-i>", "<C-w>k", opts)
	-- keymap("n", "<C-l>", "<C-w>l", opts)
	-- Resize with arrows
	keymap("n", "<M-Up>", ":resize -2<CR>", opts)
	keymap("n", "<M-Down>", ":resize +2<CR>", opts)
	keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
	keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

	-- hop
	-- keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", opts)
	-- keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", opts)
	-- keymap('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<cr>", opts)
	-- keymap('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<cr>", opts)
	-- keymap("n", "f", "<cmd>:HopChar1<cr>", opts)
	-- keymap("n", "t", "<cmd>:HopChar2<cr>", opts)

	-- Neoscroll

	local t = {}
	-- Syntax: t[keys] = {function, {function arguments}}
	t["<PAGEUP>"] = { "scroll", { "-vim.wo.scroll", "true", "250", [['sine']] } }
	t["<PAGEDOWN>"] = { "scroll", { "vim.wo.scroll", "true", "250", [['sine']] } }
	t["<C-PAGEUP>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450", [['circular']] } }
	t["<C-PAGEDOWN>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450", [['circular']] } }
	-- t["<C-y>"] = { "scroll", { "-0.10", "false", "100", [['cubic']] } }
	-- t["<C-e>"] = { "scroll", { "0.10", "false", "100", [['cubic']] } }
	t["zt"] = { "zt", { "250" } }
	t["zz"] = { "zz", { "250" } }
	t["zb"] = { "zb", { "250" } }

	require("neoscroll.config").set_mappings(t)
	keymap("i", "<PAGEUP>", "<cmd>lua require('neoscroll').scroll(-vim.wo.scroll,'true','250',[['sine']])<CR>")
	keymap("i", "<PAGEDOWN>", "<cmd>lua require('neoscroll').scroll(vim.wo.scroll,'true','250',[['sine']])<CR>")
	-- Shift or Ctrl-Pageup/down not working
	-- keymap("i","<C-PAGEUP", "<cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), 'true', '450', [['circular']])<CR>")
	-- keymap("i","<S-PAGEUP", "<cmd>lua require('neoscroll').scroll(-vim.api.nvim_win_get_height(0), 'true', '450', [['circular']])<CR>")
	-- keymap("i","<C-PAGEDOWN", "<cmd>lua require('neoscroll').scroll(vim.api.nvim_win_get_height(0), 'true', '450', [['circular']])<CR>")

	vim.cmd("autocmd FileType * lua CodeRunner()")

	function CodeRunner()
        -- print ("In function coderunner")
		local bufnr = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
		local fname = vim.fn.expand("%:p:t")
		local keymap_c = {} -- normal key map
		local keymap_c_v = {} -- visual key map

		if ft == "python" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>", "Run" },
				m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
			}
		elseif ft == "lua" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>luafile %<cr>", "Run" },
			}
		elseif ft == "rust" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>execute 'Cargo run' | startinsert<cr>", "Run" },
				D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
				h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
				R = { "<cmd>RustRunnables<cr>", "Runnables" },
			}
		elseif ft == "go" then
			keymap_c = {
				name = "Code",
				r = { "<cmd>GoRun<cr>", "Run" },
			}
		elseif ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
			keymap_c = {
				name = "Code",
				o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize Imports" },
				r = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
				i = { "<cmd>TypescriptAddMissingImports<cr>", "Import Missing" },
				F = { "<cmd>TypescriptFixAll<cr>", "Fix All" },
				u = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
				R = { "<cmd>lua require('config.test').javascript_runner()<cr>", "Choose Test Runner" },
				s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
				t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
			}
		elseif ft == "java" then
			keymap_c = {
				name = "Code",
				o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Imports" },
				v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
				c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
				t = { "<cmd>lua require('jdtls').test_class()<cr>", "Test Class" },
				n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
			}
			keymap_c_v = {
				name = "Code",
				v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
				c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
				m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
			}
		end

		if fname == "package.json" then
			keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
			keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
			keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
			keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
		end

		if fname == "Cargo.toml" then
			keymap_c.u = { "<cmd>lua require('crates').upgrade_all_crates()<cr>", "Upgrade All Crates" }
		end

		if next(keymap_c) ~= nil then
			wk.register(
				{ c = keymap_c },
				{ mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
			)
		end

		if next(keymap_c_v) ~= nil then
			wk.register(
				{ c = keymap_c_v },
				{ mode = "v", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
			)
		end
	end
end
