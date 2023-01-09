return {

    "mrjones2014/legendary.nvim", --  commands dialog
	config = function()
		local status_ok, legend = pcall(require, "legendary")
		if not status_ok then
			print("legendary not installed!")
			return
		end

		legend.setup({
			keymaps = {
				-- map keys to a command
				-- { '<leader>ff', ':Telescope find_files', description = 'Find files' },
				-- map keys to a function
				{
					"<leader>k",
					function()
						print("hello world!")
					end,
					description = "Say hello",
				},
				-- keymaps have opts.silent = true by default, but you can override it
				-- { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
				-- create keymaps with different implementations per-mode
				{
					"<leader>c",
					{
						n = ':lua require("Comment.api").toggle.linewise()<CR>',
						v = "<Plug>(comment_toggle_linewise_visual)",
					},
					description = "Toggle comment",
				},
				{
					"<leader>fh",
					{ n = "<CMD>Legendary.toolbox()<CR>" },
					description = "Command window",
				},
			},
			commands = {
				-- easily create user commands
				{
					":SayHello",
					function()
						print("hello world!")
					end,
					description = "Say hello as a command",
				},
			},
			autocmds = {
				-- Create autocmds and augroups
				-- { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
				-- {
				-- name = 'MyAugroup',
				-- clear = true,
				-- autocmds here
				-- },
			},
			-- functions = {
			--   -- Make arbitrary Lua functions that can be executed via the item finder
			--   { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
			-- },
		})
	end,
}
