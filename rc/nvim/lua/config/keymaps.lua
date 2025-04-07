local mapKey = require("utils.keyMapper").mapKey

-- general
mapKey("<C-q>", ":q<CR>")
-- pane navigation
mapKey("<C-h>", "<C-w>h") -- Left
mapKey("<C-j>", "<C-w>j") -- Down
mapKey("<C-k>", "<C-w>k") -- Up
mapKey("<C-l>", "<C-w>l") -- Right

-- diagnostic flaot
mapKey("<leader>i", ":lua vim.diagnostic.open_float()<CR>")

-- indent
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")

-- paste mode
mapKey("<leader>p", ":set paste<CR>a")
mapKey("<leader>o", ":set nopaste<CR>")

-- delete all additional ui
mapKey("<leader>q", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local buf_ft = vim.bo[buf].filetype
		if buf_ft == "netrw" then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
		if buf_ft == "lazy" or buf_ft == "lazy_backdrop" then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end)
-- Plugin: Neotree toggle
mapKey("<leader>e", ":Neotree toggle<CR>")

-- Plugin: whitespace
mapKey("<leader>wt", function()
	require("tidy").toggle()
	vim.cmd(":ToggleWhitespace")
end)
mapKey("<leader>ww", function()
	require("tidy").run()
	vim.cmd(":StripWhitespace")
end)

-- Plugin: replace (custom)
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>lua _G.replace_text()<CR>", { noremap = true, silent = true })

-- Plugin: telescope
local builtin = require("telescope.builtin")
mapKey("<C-f>", builtin.current_buffer_fuzzy_find)
mapKey("<leader>fg", builtin.live_grep)
mapKey("<leader>ff", builtin.find_files)
mapKey("<leader>fh", builtin.help_tags)
mapKey("<leader>fc", ":Telescope neoclip<CR>")
mapKey("<leader>fw", ":Telescope workspaces<CR>")

-- Plugin: lsp
mapKey("K", vim.lsp.buf.hover)
mapKey("gk", vim.lsp.buf.signature_help)
mapKey("<F6>", vim.lsp.buf.rename)

-- lsp.definition
mapKey("gd", ":tab split | lua vim.lsp.buf.definition()<CR>")
mapKey("gD", vim.lsp.buf.definition)
mapKey("<leader>gds", function()
	-- right
	vim.cmd("vsplit")
	vim.cmd("wincmd l")
	vim.lsp.buf.definition()
end)
mapKey("<leader>gdS", function()
	-- down
	vim.cmd("split")
	vim.cmd("wincmd j")
	vim.lsp.buf.definition()
end)

-- format
mapKey("gf", function()
	require("tidy").run()
	vim.cmd(":StripWhitespace")
	vim.lsp.buf.format()
	require("conform").format({ async = true, lsp_fallback = true })
end)

mapKey("gdc", vim.lsp.buf.declaration)
mapKey("ga", vim.lsp.buf.code_action)
mapKey("gi", builtin.lsp_implementations)
mapKey("<leader>gt", builtin.lsp_type_definitions)
mapKey("gr", builtin.lsp_references)
mapKey("<leader>gs", builtin.lsp_document_symbols)
