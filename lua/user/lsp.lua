local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("Lspconfig missing")
  return
end

local function on_attach_lua(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- print("OnAttach for lua

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<M-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end-- print("Setting up lsp")
-- require "user.lsp.lsp-installer"

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "jdtls" },
})

-- python
-- lspconfig.pyright.setup{}
lspconfig.pylsp.setup{}

-- LUA config
lspconfig.sumneko_lua.setup({
  on_attach = on_attach_lua,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          vim.api.nvim_get_runtime_file("", true),
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
          -- require("nvim_lsp").util.root_pattern('.git')
        }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- BASH config
local bashlsconfig={
  filetypes={"sh"}
}

lspconfig.bashls.setup({bashlsconfig})



-- clangd
local clangdconfig={
  -- capabilities = default capabilities, with offsetEncoding utf-8,
    cmd = { "clangd", "--background-index" },
    filetypes = { "ino","arduino","c", "cpp", "objc", "objcpp" },
    log_level = 2,
    -- on_init = function to handle changing offsetEncoding
    -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")
    settings = {}
}
lspconfig.clangd.setup({clangdconfig})

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


