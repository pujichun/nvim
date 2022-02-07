"
" 检查是否存在plug.vim
"
if empty(glob('C:\Users\pujic\AppData\Local\nvim\autoload\plug.vim'))
	silent !curl -fLo C:\Users\pujic\AppData\Local\nvim\autoload\plug.vim --create-dirs
				\https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
