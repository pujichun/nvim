" 设置LEADER键为space
let mapleader=" "
" 键位映射
noremap k j
noremap , 5j
noremap j h
noremap i k
noremap h i
noremap H I
noremap I 5k
noremap L $
noremap J 0
noremap <LEADER><CR> :nohlsearch<CR>
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>



"
" 映射窗口切换键位
"
noremap <C-j> <C-w>h
noremap <C-k> <C-w>j
noremap <C-l> <C-w>l
noremap <C-i> <C-w>k

