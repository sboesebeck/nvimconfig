local neoscroll_ok, ns = pcall(require, "neoscroll")

if not neoscroll_ok then
	print("Neoscroll not installed")
	return
end

ns.setup({
	-- mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

-- local t = {}
-- -- Syntax: t[keys] = {function, {function arguments}}
-- t["<PAGEUP>"] = { "scroll", { "-vim.wo.scroll", "true", "250", [['sine']] } }
-- t["<PAGEDOWN>"] = { "scroll", { "vim.wo.scroll", "true", "250", [['sine']] } }
-- t["<C-PAGEUP>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450", [['circular']] } }
-- t["<C-PAGEDOWN>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450", [['circular']] } }
-- -- t["<C-y>"] = { "scroll", { "-0.10", "false", "100", [['cubic']] } }
-- -- t["<C-e>"] = { "scroll", { "0.10", "false", "100", [['cubic']] } }
-- t["zt"] = { "zt", { "250" } }
-- t["zz"] = { "zz", { "250" } }
-- t["zb"] = { "zb", { "250" } }
--
-- require("neoscroll.config").set_mappings(t)
