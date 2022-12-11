local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print("Lspconfig missing")
	return
end
local cfg = {
	debug = false, -- set to true to enable debug logging
	log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
	-- default is  ~/.cache/nvim/lsp_signature.log
	verbose = false, -- show debug line number

	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	-- set to 0 if you DO NOT want any API comments be shown
	-- This setting only take effect in insert mode, it does not affect signature help in normal
	-- mode, 10 by default

	max_height = 12, -- max height of signature floating_window
	max_width = 80, -- max_width of signature floating_window
	noice = false, -- set to true if you using noice to render markdown
	wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

	floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap

	floating_window_off_x = 1, -- adjust float windows x position.
	floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

	close_timeout = 4000, -- close floating window after ms when laster parameter is entered
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
	hint_scheme = "String",
	hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
	},

	always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

	transparency = nil, -- disabled by default, allow floating win transparent value 1~100
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

	select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
	move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

require("lsp_signature").setup(cfg)

local function on_attach_lua(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- print("OnAttach for lua
	require("lsp_signature").on_attach({
		bind = true,
		andler_opts = {
			border = "rounded",
		},
	}, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<M-k>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>lf", vim.lsp.buf.formatting, bufopts)
end -- print("Setting up lsp")

-- require "user.lsp.lsp-installer"

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "jdtls" },
})
-- require("mason-lspconfig").setup_handlers({
-- 	-- The first entry (without a key) will be the default handler
-- 	-- and will be called for each installed server that doesn't have
-- 	-- a dedicated handler.
-- 	function(server_name) -- default handler (optional)
-- 		require("lspconfig")[server_name].setup({})
-- 	end,
-- 	-- Next, you can provide a dedicated handler for specific servers.
-- 	-- For example, a handler override for the `rust_analyzer`:
-- 	["rust_analyzer"] = function()
-- 		require("rust-tools").setup({})
-- 	end,
-- 	["sumneko_lua"] = function()
-- 		lspconfig.sumneko_lua.setup({
-- 			settings = {
-- 				Lua = {
-- 					diagnostics = {
-- 						globals = { "vim" },
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- })

-- python
-- lspconfig.pyright.setup{}
local function on_attach_pyright(client, bufnr) end

lspconfig.pyright.setup({
	on_attach = on_attach_pyright,
})
lspconfig.pylsp.setup({})

-- LUA config
lspconfig.sumneko_lua.setup({
	on_attach = on_attach_lua,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.api.nvim_get_runtime_file("", true),
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
					-- require("nvim_lsp").util.root_pattern('.git')
				},
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- BASH config
local bashlsconfig = {
	filetypes = { "sh" },
}

lspconfig.bashls.setup({ bashlsconfig })

-- -- clangd
-- local clangdconfig = {
-- 	-- capabilities = default capabilities, with offsetEncoding utf-8,
-- 	cmd = { "clangd", "--background-index" },
-- 	filetypes = { "ino", "arduino", "c", "cpp", "objc", "objcpp" },
-- 	log_level = 2,
-- 	-- on_init = function to handle changing offsetEncoding
-- 	-- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")
-- 	settings = {},
-- }
-- lspconfig.clangd.setup({ clangdconfig })

--
-- function onAttachJdtls(client, bufnr)
-- 		require("jdtls").setup_dap({ hotcodereplace = "auto" })
-- 		require("jdtls.dap").setup_dap_main_class_configs()
--
-- 		client.resolved_capabilities.document_formatting = false
-- 		client.resolved_capabilities.completion.completionItem.snippetSupport = false
-- 		vim.lsp.codelens.refresh()
--
-- end
--
-- lspconfig.jdtls.setup({})
--
--require ("jdtls").setup_dap { hotcodereplace = "auto"}
--require ("jdtls.dap").setup_dap_main_class_configs()
--vim.lsp.codelens.refresh()
