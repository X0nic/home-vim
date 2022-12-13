-- Shorten function name
local keymap = vim.keymap.set

-- Plugins --

-- FZF
-- " set rtp+=/usr/local/opt/fzf
-- nnoremap <C-p> :FZF<Cr>
keymap("n", "<C-p>", ":FZF<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
