--local colorscheme = "darkplus"
-- local colorscheme = "tokyonight"
-- local colorscheme= "duskfox"
local defaultColorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. defaultColorscheme)
if not status_ok then
	print("Could not load colorscheme " .. defaultColorscheme)
	return
end

vim.cmd("autocmd FileType * lua ColorSchemeUpdate()")

function ColorSchemeUpdate()
	local bufnr = vim.api.nvim_get_current_buf()
	local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
	-- local fname = vim.fn.expand("%:p:t")

	local colorscheme = defaultColorscheme
	if ft == "python" then
		colorscheme = "carbonfox"
	elseif ft == "lua" then
		colorscheme = "tokyonight"
	elseif ft == "java" then
		colorscheme = "onedark"
	elseif ft == "rust" then
		colorscheme = "dustfox"
	end
	status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		print("could not load colorscheme on filechange to " .. colorscheme)
	end
end
