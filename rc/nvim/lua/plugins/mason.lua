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
					"golangci-lint-langserver",

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
					"eslint-lsp",

					-- yaml
					"yaml-language-server",
					"yamllint",
					"yamlfmt",
					"yamlfix",

					-- makefile
					"checkmake",

					-- html
					"html-lsp",
					"css-lsp",
					"css-variables-language-server",

					-- helm
					"helm-ls",

					-- docker
					"dockerfile-language-server",
					"docker-compose-language-service",
				},
			})
		end,
	},
}
