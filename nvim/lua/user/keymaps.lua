local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open config file
keymap("n", "<leader>c", ":e ~/.config/nvim/init.lua <cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>s", ":SymbolsOutline<cr>", opts)
keymap("n", "<leader>t", ":Trouble <cr>", opts)

-- Hop.nvim
keymap("n", "<leader>w", ":HopWord <cr>", opts)
keymap("n", "<leader>l", ":HopLine <cr>", opts)

-- Google stuff.
keymap("n", "<leader>pp", ":PiperSelectActiveFiles<cr>", opts)
keymap("n", "<leader>pa", ":PiperLoadActiveAsBuffers<cr>", opts)

-- Telescope
keymap("n", "ff", ":Telescope file_browser<cr>", opts)
keymap("n", "fb", ":Telescope buffers<CR>", opts)
keymap("n", "fg", ":Telescope live_grep search_dirs=.<CR>", opts)
keymap("n", "fh", ":Telescope harpoon marks<CR>", opts)
keymap("n", "fu", ":Telescope undo<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Format code
keymap("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", opts)

-- Show more info with the LSP.
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Swap window
keymap("n", '<C-W>u', '<C-W>x', term_opts)

-- Toggle NvimTree
keymap("n", '<C-n>', ':NvimTreeToggle<CR>', term_opts)

-- Lsp key maps.
keymap("n", 'gr', ':lua vim.lsp.buf.references()<CR>', term_opts)
keymap("n", 'gd', ':lua vim.lsp.buf.definition()<CR>', term_opts)
keymap("n", 'ca', ':lua vim.lsp.buf.code_action()<CR>', term_opts)

-- Quickfix next and previous
keymap("n", '<Tab>j', '<cmd>cnext<CR>zz', term_opts)
keymap("n", '<Tab>k', '<cmd>cprev<CR>zz', term_opts)

-- Harpoon maps
keymap("n", 'gha', ":lua require(\"harpoon.mark\").add_file()<CR>", term_opts)
keymap("n", 'ghf', ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", term_opts)
