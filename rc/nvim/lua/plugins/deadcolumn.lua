return {
	"Bekaboo/deadcolumn.nvim",
	config = function()
		local filetype_colorcolumn = {
			markdown = "100",
			python = "80",
			text = "72",
		}

		for ft, col in pairs(filetype_colorcolumn) do
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ft,
				callback = function()
					vim.opt_local.colorcolumn = col
				end,
			})
		end
	end,
}
