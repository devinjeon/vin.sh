return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.bashls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.css_variables.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.eslint.setup({})
			lspconfig.golangci_lint_ls.setup({})
			lspconfig.helm_ls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			-- lspconfig.yamlls.setup({})
		end,
	},
	{
		-- holding lsp signature while function typing
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			-- cfg options
		},
		config = function()
			local signature = {
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
				end,
			}
			require("lspconfig").lua_ls.setup(signature)
			require("lspconfig").gopls.setup(signature)
			require("lspconfig").pylsp.setup(signature)
			require("lspconfig").bashls.setup(signature)
			require("lspconfig").cssls.setup(signature)
			require("lspconfig").css_variables.setup(signature)
			require("lspconfig").docker_compose_language_service.setup(signature)
			require("lspconfig").dockerls.setup(signature)
			require("lspconfig").eslint.setup(signature)
			require("lspconfig").golangci_lint_ls.setup(signature)
			require("lspconfig").helm_ls.setup(signature)
			require("lspconfig").html.setup(signature)
			require("lspconfig").jsonls.setup(signature)
		end,
	},
}
