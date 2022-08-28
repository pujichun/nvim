vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = false }
local opts_s = { noremap = true, silent = true }

--
-- base setting
--

-- move
keymap("n", "<C-h>", "<C-w>h", opts_s)
keymap("n", "<C-j>", "<C-w>j", opts_s)
keymap("n", "<C-k>", "<C-w>k", opts_s)
keymap("n", "<C-l>", "<C-w>l", opts_s)

keymap("", "<A-j>", "5j", opts_s) -- alt+j move dowm 5 lines
keymap("", "<A-k>", "5k", opts_s) -- alt+k move up 5 lines

keymap("", "H", "0", opts) -- shift+h goto top of line
keymap("", "L", "$", opts) -- shift+l goto end of line

keymap("n", "<leader><CR>", ":nohlsearch<CR>", opts) -- space+enter set search no highlight

keymap("", "S", ":w<CR>", { noremap = false, silent = false }) -- use shift+s save file
keymap("", "<Nop>", "s", { noremap = false, silent = true })
keymap("", "Q", ":q<CR>", { noremap = false, silent = false }) -- use shift+q quit vim
keymap("v", "Y", '"+y', opts) -- use shift+y copy to system clipboard
keymap("v", "<S-Tab>", "<", opts) -- use shift+tab unindent
keymap("v", "<Tab>", ">", opts) -- use tab indent

keymap("n", "<leader>f", ":Format<CR>", opts)

--
-- plugin keybinding
--

-- nvim-tree
keymap("n", "tt", ":NvimTreeToggle<CR>", opts) -- t+t open NvimTree
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts) -- n+n find the current file in NvimTree
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- buffer-line
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts_s) -- use leader+number goto other buffers
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts_s)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts_s)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts_s)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts_s)
keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts_s)
keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts_s)
keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts_s)
keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts_s)
keymap("n", "<A-w>", ":BufferLineCloseLeft<CR>", opts_s)
keymap("n", "<A-e>", ":BufferLineCloseRight<CR>", opts_s)


-- keymap('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>', opts_s)
-- keymap('n', '<A-.>', '<Cmd>BufferMoveNext<CR>', opts_s)
-- -- Goto buffer in position...
-- keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts_s)
-- keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts_s)
-- keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts_s)
-- keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts_s)
-- keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts_s)
-- keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts_s)
-- keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts_s)
-- keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts_s)
-- keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts_s)
-- keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts_s)
-- keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts_s)
-- keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts_s)
--
-- dashboard
keymap("n", ";fh", ":DashboardFindHistory<CR>", opts)
keymap("n", ";ff", ":DashboardFindFile<CR>", opts)
keymap("n", ";tc", ":DashboardChangeColorscheme<CR>", opts)
keymap("n", ";fa", ":DashboardFindWord<CR>", opts)
keymap("n", ";fb", ":DashboardJumpMark<CR>", opts)
keymap("n", ";cn", ":DashboardNewFile<CR>", opts)

-- telescope
keymap("n", ";ff", ":Telescope find_files<CR>", opts)
keymap("n", ";fg", ":Telescope live_grep<CR>", opts)
keymap("n", ";fb", ":Telescope buffers<CR>", opts)
