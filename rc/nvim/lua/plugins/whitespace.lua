return {
	{
		"ntpeters/vim-better-whitespace",
		config = function()
			-- Highlight color 설정 (원하는 색상으로 변경 가능)
			vim.g.better_whitespace_ctermcolor = "White"
			vim.g.better_whitespace_guicolor = "White"

			-- 저장할 때 불필요한 공백 자동 제거
			vim.g.better_whitespace_enabled = 1

			-- strip은 tidy 에서 실행
			vim.g.strip_whitespace_on_save = 0

			-- 특정 파일 유형에서는 공백 제거하지 않도록 설정
			vim.g.better_whitespace_filetypes_blacklist = {
				"diff",
				"git",
				"gitcommit",
				"unite",
				"qf",
				"help",
				"markdown",
				"fugitive",
			}
		end,
		dependencies = {
			{
				"mcauley-penney/tidy.nvim",
				opts = {
					enabled_on_save = true,
					filetype_exclude = {
						"diff",
						"git",
						"gitcommit",
						"unite",
						"qf",
						"help",
						"markdown",
						"fugitive",
					},
				},
			},
		},
	},
}
