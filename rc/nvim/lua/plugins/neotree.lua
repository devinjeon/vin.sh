return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {'3rd/image.nvim', opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true, -- 현재 파일을 따라가기
					leave_dirs_open = true,
				},
				use_libuv_file_watcher = true, -- 파일 변경 감지
			},
		})
	end,
}
