" 搜索设置
set hlsearch
exec "nohlsearch"
set ignorecase
set smartcase
" 显示匹配括号
set showmatch
set number
" 突出显示当前行
set cursorline
" 继承前一行的缩进方式
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 文件编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gbk
" 打开状态栏标尺
set ruler
" 取消自动备份及产生swp文件
set nobackup
set nowb
set noswapfile
set scrolloff=8
syntax on
set wrap
set showcmd
set relativenumber
set conceallevel=2
"设置命令行的高度
" 再次打开文件，定位到上次退出时的位置
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif

vnoremap Y "+y

" 在插入模式下将光标设置为细条
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam" 
endif


"
" 缩进设置
"
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sw=2 expandtab


"
" 运行代码设置
"
nnoremap r :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc


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


set background=dark
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
