return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- lua
					"lua_ls",
					"stylua",

					-- golang
					{ "golangci-lint", version = "v1.63.4" },
					"gopls",
					"gomodifytags", -- to check
					"gotests", -- to check
					"gofumpt", -- to check
					"goimports",

					-- shell
					{ "bash-language-server", auto_update = true },
					"shellcheck",
					"shfmt",

					-- python
					"black",
					"isort",
					"autopep8",
					"autoflake",
					"flake8",
					"pyright",
					"python-lsp-server",
					"ruff",
					"ruff-lsp",

					-- markdown
					"markdown-toc",
					"markdownlint",

					-- javascript
					"prettier",

					-- yaml
					"yamlfmt",
					"yamlfix",

					-- makefile
					"checkmake",
				},
			})
		end,
	},
}
