return {
    "akinsho/toggleterm.nvim", -- show terminal 
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-#>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<M-h>", [[<F12><C-n><C-W>h]], opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<M-j>", [[<F12><C-n><C-W>j]], opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<M-k>", [[<F12><C-n><C-W>k]], opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<M-l>", [[<F12><C-n><C-W>l]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<F10>", "<cmd>:ToggleTerm<cr>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<F12>", "<cmd>:ToggleTerm<cr>", opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<TAB>", "<TAB>", opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<S-TAB>", "<S-TAB>", opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<TAB>", "<C-w>h", opts)
			-- vim.api.nvim_buf_set_keymap(0, "t", "<S-TAB>", "<C-w>l", opts)

			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", "<cmd>:wincmd h<cr>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<cmd>:wincmd j<cr>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", "<cmd>:wincmd k<CR>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", "<cmd>:wincmd l<CR>", opts)
			-- -- Resize with arrows
			vim.api.nvim_buf_set_keymap(0, "t", "<S-Down>", "<cmd>:resize -2<CR>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<S-Up>", "<cmd>:resize +2<CR>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<S-Left>", "<cmd>:vertical resize -2<CR>", opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<S-Right>", "<cmd>:vertical resize +2<CR>", opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
