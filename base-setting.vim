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
let &t_ut=''
set list
set listchars=tab:\|\ ,trail:▫
set backspace=indent,eol,start
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 在插入模式下将光标设置为细条
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam" 
endif

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
		:term go run .
	endif
endfunc

