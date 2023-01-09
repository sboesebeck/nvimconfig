return {
	"goolord/alpha-nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", " " .. " Show files", ":NvimTreeToggle<CR>"),
			dashboard.button("a", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button(
				"p",
				" " .. " Find project",
				":lua require('telescope').extensions.projects.projects()<CR>"
			),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
			-- dashboard.button("d", " " .. " New Daily note", ":ObsidianToday<cr>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		local function footer()
			return "Stephans new config"
		end

		dashboard.section.footer.val = footer()

		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"

		dashboard.opts.opts.noautocmd = true
		require("alpha").setup(dashboard.opts)
	end,
}
