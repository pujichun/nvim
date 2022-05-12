local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- keep status bar position close to bottom
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = true, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = false, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  cursorcolumn = false, -- cursor column.
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- keep 8 height offset from above and bottom
  sidescrolloff = 8, -- keep 8 width offset from left and right
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  foldmethod = "expr", -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false, -- no fold to be applied when open a file
  foldlevel = 99, -- if not set this, fold will be everywhere
  spell = false, -- add spell support
  spelllang = { "en_us" }, -- support which languages?
  diffopt = "vertical,filler,internal,context:4", -- vertical diff split view
  background = "dark",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
]]

vim.cmd [[
	autocmd FileType html setlocal ts=2 sw=2 expandtab
	autocmd FileType json setlocal ts=2 sw=2 expandtab
	autocmd FileType typescript setlocal ts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=2 sw=2 expandtab
	autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab
	autocmd FileType lua setlocal ts=2 sw=2 expandtab
]]

vim.cmd [[
	let g:terminal_color_0  = '#000000'
	let g:terminal_color_1  = '#FF5555'
	let g:terminal_color_2  = '#50FA7B'
	let g:terminal_color_3  = '#F1FA8C'
	let g:terminal_color_4  = '#BD93F9'
	let g:terminal_color_5  = '#FF79C6'
	let g:terminal_color_6  = '#8BE9FD'
	let g:terminal_color_7  = '#BFBFBF'
	let g:terminal_color_8  = '#4D4D4D'
	let g:terminal_color_9  = '#FF6E67'
	let g:terminal_color_10 = '#5AF78E'
	let g:terminal_color_11 = '#F4F99D'
	let g:terminal_color_12 = '#CAA9FA'
	let g:terminal_color_13 = '#FF92D0'
	let g:terminal_color_14 = '#9AEDFE'
]]

vim.cmd [[ set t_Co=256 ]]
vim.cmd [[ colorscheme deus]]

vim.g.dashboard_custom_shortcut = {
  last_session = 'SEM s l',
  find_history = 'SEM f h',
  find_file = 'SEM f f',
  new_file = 'SEM c n',
  change_colorscheme = 'SEM t c',
  find_word = 'SEM f a',
  book_marks = 'SEM f b',
}
