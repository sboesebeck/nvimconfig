--local colorscheme = "darkplus"
-- local colorscheme = "tokyonight"
-- local colorscheme= "duskfox"
local colorscheme= "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("Could not load colorscheme "..colorscheme)
	return
end
