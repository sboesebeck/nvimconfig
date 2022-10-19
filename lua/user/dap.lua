local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

dap_install.setup({})

dap_install.config("python", {})

-- dap.adapters.python = {
--   type = 'executable';
--   command = '/Users/stephan/.virtualenvs/debugpy/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }
--
-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch';
--     name = "Launch file";
--
--     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
--     program = "${file}"; -- This configuration will launch the current file if used.
--     pythonPath = function()
--       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--         return '/Users/stephan/.virtualenvs/debugpy/bin/python'
--     end;
--   },
-- }
dap.adapters.sh = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/bash-debug-adapter",
}
-- print( vim.fn.stdpath "data" .."/mason/bin/bash-debug-adapter")
dap.configurations.sh = { { name = "Bash", type = "sh", request = "launch", program = "${file}" } }

-- require("dap-python").setup('/Users/stephan/.virtualenvs/debugpy/bin/python')
require("dap-python").setup("/opt/homebrew/opt/python@3.10/bin/python3")
-- print("setting log-level for dap")
require("dap").set_log_level("TRACE")

-- add other configs here
require("dapui").setup({
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				{id="console",size=0.7},
			},
			size = 40,
			position = "bottom",
		},
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
