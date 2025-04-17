return {
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				copilot_model = "gpt-4o-copilot",
				suggestion = {
					enable = true,
					auto_trigger = true,
					keymap = {
						accept = "<Tab><Tab>",
						dismiss = "<Esc>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},
}
