-- Shorten function name
local keymap = vim.keymap.set
local opts = {}

-- Plugins --

-- FZF
-- " set rtp+=/usr/local/opt/fzf
-- nnoremap <C-p> :FZF<Cr>
-- keymap("n", "<C-p>", ":FZF<CR>", opts)
keymap("n", "<leader>ff", ":FZF<CR>", opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fq", ":Telescope quickfix<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
-- keymap("n", "<leader>fr", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", {noremap = true, silent = true})
-- keymap("n", "<C-p>", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", {noremap = true, silent = true})
keymap("n", "<leader>fm", "<Cmd>lua require('telescope').extensions.metals.commands()<CR>")


keymap("", "<leader>n", ":NERDTreeToggle<cr>")
keymap("", "<leader>r", ":NERDTreeFind<cr>")

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
