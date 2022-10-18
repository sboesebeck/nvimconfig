-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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

	-- Normal --
	-- Better window navigation
	keymap("n", "<leader>wj", "<C-w>h", opts)
	keymap("n", "<leader>wk", "<C-w>j", opts)
	keymap("n", "<leader>wi", "<C-w>k", opts)
	keymap("n", "<leader>wl", "<C-w>l", opts)
	keymap("n", "<leader>j", "<C-w>h", opts)
	keymap("n", "<leader>k", "<C-w>j", opts)
	keymap("n", "<leader>i", "<C-w>k", opts)
	keymap("n", "<leader>l", "<C-w>l", opts)

	-- Resize with arrows
	keymap("n", "<M-Up>", ":resize -2<CR>", opts)
	keymap("n", "<M-Down>", ":resize +2<CR>", opts)
	keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
	keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

	-- Navigate buffers
	keymap("n", "<S-l>", ":bnext<CR>", opts)
	keymap("n", "<S-k>", ":bprevious<CR>", opts)
	keymap("n", "<S-c>", ":close<CR>", opts)

	-- Clear highlights
	keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

	-- Close buffers
	keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

	-- Better paste
	keymap("v", "p", '"_dP', opts)

	-- Insert --
	-- Press jk fast to enter
	--keymap("i", "jk", "<ESC>", opts)

	-- Visual --
	-- Stay in indent mode
	keymap("v", "<", "<gv", opts)
	keymap("v", ">", ">gv", opts)

	-- Plugins --

	-- NvimTree
	keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

	-- Telescope
	keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
	keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
	keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
	keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

	-- Git
	keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

	-- Comment
	-- keymap("n", "<leader>gcc", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
	-- keymap("x", "<leader>gcc", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

	-- DAP
	keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
	keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
	keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
	keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
	keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
	keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
	keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
	keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
	keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

	-- -- lsp
	keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	-- keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

	-- Toggleterm
	keymap("n", "<F12>", "<cmd>ToggleTerm direction=float<cr>", opts)
	keymap("n", "<F10>", "<cmd>ToggleTerm direction=horizontal<cr>", opts)

	-- spectre
	keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
	keymap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
	keymap("n", "<leader>s", "<esc>:lua require('spectre').open_visual()<CR>", opts)
	keymap("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<cr>", opts)

	-- Toggleterm
	keymap("n", "<F12>", "<cmd>ToggleTerm direction=float<cr>", opts)
	keymap("n", "<F10>", "<cmd>ToggleTerm direction=horizontal<cr>", opts)
	-- debugging
	keymap("n", "<F8>", "<cmd>lua require('dap').step_over()<CR>", opts)
	keymap("n", "<F9>", "<cmd>lua require('dap').continue()<CR>", opts)
	keymap("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", opts)
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
	wk.register({
		f = {
			name = "Files",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			t = { "<cmd>Telescope live_grep<cr>", "Search for text" },
			p = { "<cmd>Telescope projects<cr>", "Show projects" },
			b = { "<cmd>Telescope buffers<cr>", "Show buffer" },
		},
	}, { mode = "n", prefix = "<leader>" })

	wk.register({
		s = {
			name = "Spectre",
			s = { "<cmd>lua require('spectre').open()<cr>", "Search/Replace" },
			w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search/Replace Word" },
			p = { "<cmd>lua require('spectre').open_file_search()<cr>", "File Search" },
		},
	}, { mode = "n", prefix = "<leader>" })
	wk.register({
		g = {
			name = "Goto",
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" }, -- create a binding with label
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration" },
			I = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "implementation" },
			r = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
		},
	}, { mode = "n", prefix = "" })

	wk.register({
		l = {
			f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format buffer" },
			i = { "<cmd>LspInfo<cr>", "Lsp Information" },
			-- I = { "<cmd>LspInstallInfo<cr>", "Lsp Installation Information" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code..." },
			j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Goto Next Item" },
			k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Goto Pref Item" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "LocList" },
			d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "diagnostic" },
		},
	}, { mode = "n", prefix = "" })

	wk.register({
		t = {
			m = { "<cmd>lua require('jdtls').test_nearest_method()<CR>", "Run method" },
		},
	}, { mode = "n", prefix = "<leader>" })

	wk.register({
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
	}, { mode = "n", prefix = "" })

	-- Toggleterm
	keymap("n", "<F12>", "<cmd>ToggleTerm direction=float<cr>", opts)
	keymap("n", "<F10>", "<cmd>ToggleTerm direction=horizontal<cr>", opts)
	-- debugging
	keymap("n", "<F8>", "<cmd>lua require('dap').step_over()<CR>", opts)
	keymap("n", "<F9>", "<cmd>lua require('dap').continue()<CR>", opts)
	keymap("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", opts)

	-- DAP
	wk.register({
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
	}, { mode = "n", prefix = "<leader>" })

	--window navigation
	wk.register({
		-- j = { "<C-w>h", "Window left" },
		-- k = { "<C-w>j", "Window down" },
		-- i = { "<C-w>k", "Window up" },
		-- l = { "<C-w>l", "Window right" },
		h = { "<cmd>nohlsearch<CR>", "no highlight search" },
	}, { mode = "n", prefix = "<leader>" })

	-- Buffers
	wk.register({
		L = { ":bnext<CR>", "next buffer" },
		K = { ":bprevious<CR>", "previous buffer" },
		C = { ":close<CR>", "close buffer" },
		Q = { "<cmd>Bdelete!<CR>", "Delete Buffer" },
	}, { mode = "n", prefix = "" })

	-- NvimTree
	wk.register({
		e = { ":NvimTreeToggle<CR>", "Explorer" },
		gg = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	}, { mode = "n", prefix = "<leader>" })
	-- Git
	-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)


	keymap("v", "<S-TAB>", "<gv", opts)
	keymap("v", "<TAB>", ">gv", opts)
	keymap("n", "<TAB>", ">>", opts)
	keymap("n", "<S-TAB>", "<<", opts)

  wk.register({
    w={
      j={":wincmd h<cr>","Window to the left"},
      k={":wincmd j<cr>","Window to the right"},
      i={":wincmd k<cr>","Window down"},
      l={":wincmd l<cr>","Window up"},
    }
  },{mode="n",prefix="<leader>"})
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
  keymap('n','f','<cmd>:HopChar1<cr>',opts)
  keymap('n','t','<cmd>:HopChar2<cr>',opts)
  keymap('n', '<leader>F', "<cmd>:HopWord<cr>", opts)
  keymap('n', '<leader>T', "<cmd>:HopLine<cr>", opts)

end
