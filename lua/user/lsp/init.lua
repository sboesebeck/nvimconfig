local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("Lspconfig missing")
  return
end
--[[ print("Setting up lsp") ]]
--[[ require "user.lsp.lsp-installer" ]]

require("mason").setup()
require("mason-lspconfig").setup()
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

--require ("jdtls").setup_dap { hotcodereplace = "auto"}
--require ("jdtls.dap").setup_dap_main_class_configs()
--vim.lsp.codelens.refresh()

