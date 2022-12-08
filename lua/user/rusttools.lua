local status_ok, rt = pcall(require, "rust-tools")
-- local rt = require("rust-tools")
if not status_ok then
    return
end
rt.setup({
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		-- on_attach = function(_,bufnr)
		--   vim.keymap.set("n","C-space",rt.hover_actions.hover_actions, { buffer = bufnr })
		--   -- Code action groups
		--   vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		-- end,

		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})
