return {
 
    "nvim-telescope/telescope.nvim",
	config = function()
        local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {

				-- prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", "node_modules" },

				mappings = {
					i = {
						-- ["<Down>"] = actions.cycle_history_next,
						-- ["<Up>"] = actions.cycle_history_prev,
						-- ["<C-k>"] = actions.move_selection_next,
						-- ["<C-j>"] = actions.move_selection_previous,
						["<C-k>"] = actions.cycle_history_next,
						["<C-j>"] = actions.cycle_history_prev,
						["<C-i>"] = actions.cycle_history_prev,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				emoji = {
					action = function(emoji)
						-- argument emoji is a table.
						-- {name="", value="", cagegory="", description=""}

						vim.fn.setreg("*", emoji.value)
						print([[Press p or "*p to paste this emoji]] .. emoji.value)

						-- insert emoji when picked
						-- vim.api.nvim_put({ emoji.value }, 'c', false, true)
					end,
				},
			},
		})

		require("telescope").load_extension("fzf")

		require("telescope").load_extension("emoji")

		require("telescope").load_extension("frecency")
	end,
}
