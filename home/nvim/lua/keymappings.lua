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

-- quicker tab jumping
keymap("", "<leader>1", "1gt")
keymap("", "<leader>2", "2gt")
keymap("", "<leader>3", "3gt")
keymap("", "<leader>4", "4gt")
keymap("", "<leader>5", "5gt")
keymap("", "<leader>6", "6gt")
keymap("", "<leader>7", "7gt")
keymap("", "<leader>8", "8gt")
keymap("", "<leader>9", "9gt")
keymap("", "<leader>0", ":tablast<CR>")

-- Quick new tab
keymap("", "<leader>tn", ":tabe %<cr>")
