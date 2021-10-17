call plug#begin('~/.vim/plugged')


" 状态栏显示文件信息
Plug 'vim-airline/vim-airline'

" 自动补全括号 引号等
Plug 'jiangmiao/auto-pairs'

" 补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" go lsp
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" 启动页面
" Plug 'mhinz/vim-startify'
Plug 'pujichun/dashboard-nvim'

Plug 'liuchengxu/vim-which-key'

" markdown
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" 彩虹括号
Plug 'luochen1990/rainbow'

" 快速注释插件
Plug 'preservim/nerdcommenter'

" 语法检查插件
" Plug 'dense-analysis/ale'

" 主题
Plug 'theniceboy/vim-deus'
" Plug 'morhetz/gruvbox'
" Plug 'connorholyday/vim-snazzy'
" Plug 'chowie/vim-hybrid-reverse'
" Plug 'sts10/vim-pink-moon'

" 格式化插件
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" 顶栏
Plug 'mg979/vim-xtabline'

" 缩进高亮插件
Plug 'nathanaelkane/vim-indent-guides'

" 代码片段
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 在当前单词显示下划线
Plug 'itchyny/vim-cursorword'

" 选中区域内容插件和插入括号引号插件
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

" 多光标插件
Plug 'mg979/vim-visual-multi'

" 图标插件
Plug 'ryanoasis/vim-devicons'

" 根据符号对齐
Plug 'junegunn/vim-easy-align'

Plug 'liuchengxu/vim-clap'
Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color'

call plug#end()
