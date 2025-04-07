return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black", "ruff", "autoflake", "autopep8" },
					javascript = { "prettier", stop_after_first = true },
					go = { "gofmt", "gofumpt", "goimports" },
				},
				-- format_on_save = {
				--   -- These options will be passed to conform.format()
				--   timeout_ms = 2000,
				--   lsp_format = "fallback",
				-- },
			})
		end,
	},
}
