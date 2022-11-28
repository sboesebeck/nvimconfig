local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
null_ls.register({
	name = "shell",
	filetypes = { "sh" },
	sources = {
		null_ls.builtins.formatting.shfmt,
		-- null_ls.builtins.formatting.shellharden,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.hover.printenv,
	},
})

null_ls.register({
	name = "python",
	filetypes = { "py" },
	sources = {
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.pycodestyle,
		null_ls.builtins.diagnostics.pydocstyle,
		null_ls.builtins.diagnostics.pylama,
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.semgrep,
		null_ls.builtins.diagnostics.vulture,
		null_ls.builtins.code_actions.refactoring,
	},
})

null_ls.register({
	name = "Markdown",
	filetypes = { "md", "markdown" },
	sources = {
		null_ls.builtins.diagnostics.markdownlint.with({extra_args={"--disable MD013"}}),
		-- null_ls.builtins.diagnostics.markdownlint_cli2,
		-- null_ls.builtins.diagnostics.mdl,
		-- null_ls.builtins.formatting.cbfmt,
		-- null_ls.builtins.formatting.dprint,
		null_ls.builtins.diagnostics.cspell.with({extra_args={"--locale 'de,en'"}}),
		null_ls.builtins.code_actions.cspell.with({extra_args={"--locale 'de,en'"}}),
		-- null_ls.builtins.completion.spell.with({extra_args={"--locale 'de,en'"}}),
		-- null_ls.builtins.diagnostics.codespell.with({extra_args={"--dictionary=/Users/stephan/.config/dictionary_all.txt"}}),
	},
})

-- local ijformatter = {}
-- ijformatter.method = null_ls.methods.FORMATTING
-- ijformatter.generator = {
-- 	fn = function(params)
--     print("Running formatter for intellij")
--     P(params)
-- 		return {
-- 			{
--         text="Wonderful"
-- 			},
-- 		}
-- 	end,
-- }
--
-- null_ls.register({
-- 	name = "Java IntelliJ formatter",
-- 	filetypes = { "java" },
-- 	sources = {
-- 		ijformatter,
-- 	},
-- })

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.astyle.with({extra_args= {"--options=/Users/stephan/.config/nvim/astlye.cfg"}}),
		-- formatting.clang_format,
    formatting.uncrustify, -- uses ~/.uncrustify.cfg as default .with({extra_args= {"-c /Users/stephan/.config/nvim/uncrustify.cfg"}}),
    formatting.prettier,
    formatting.xmllint,
		-- formatting.google_java_format.with({ extra_args = { "-a" } }),
		diagnostics.flake8,
		diagnostics.semgrep,
    diagnostics.tidy,
	},
})
