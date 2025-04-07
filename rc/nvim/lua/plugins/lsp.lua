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
			local golang_setup = {
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
				end,
			}
			require("lspconfig").gopls.setup(golang_setup)

			local python_setup = {
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
				end,
			}
			require("lspconfig").pylsp.setup(python_setup)

			local lua_setup = {
				on_attach = function(client, bufnr)
					require("lsp_signature").on_attach(signature_setup, bufnr) -- Note: add in lsp client on-attach
				end,
			}
			require("lspconfig").lua_ls.setup(lua_setup)
		end,
	},
}
