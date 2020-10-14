colorscheme PaperColor
set background=dark
syntax on

set number "显示行号
set laststatus=2 
set noruler  "打开状态栏标尺
set relativenumber  "显示相对行号
set autoindent    "设置自动对齐
set cindent    "使用C/C++的自动缩进方式
set tabstop=4    "设置tab的宽度4个空格
set shiftwidth=4   "自动缩进使用4个空格
set softtabstop=4   "设置软制表的宽度
set smarttab
set nocompatible   "不使用vi的键盘模式，使用自己的
set showcmd   "命令行显示输入的命令
set showmode   "命令行显示当前模式
"set t_Co=256   "颜色256色
set termguicolors "真彩模式
set cursorline  "突出显示当前行
set mouse=a    "允许鼠标
set showmatch   "高亮显示括号
set smartindent  
set hlsearch   "高亮搜索
set incsearch  "逐字高亮
"set nobackup   "不备份
set encoding=utf-8
set noerrorbells  "出错是不要发出声音
set backspace=2
set guifont=MonospaceBold:h13

call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim',{'branch':'release'}
call plug#end()

" lighlin 配置信息
let g:lightline={
			\'colorscheme':'wombat',
			\'active':{
			\'left':[['mode','paste'],['readonly','filename','modifyed']],
			\'right':[['lineinfo'],['percent'],['fileformat','fileencoding','filetype']]
			\},
			\}

" rainbow 配置信息
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" nerdtree配置
map <F3> :NERDTreeMirror <CR>
map <F3> :NERDTreeToggle <CR>
let NERDChristmasTree=1 "显示增强
let NERDTreeAutoCenter=1 "自动调整焦点
let NERDTreeShowFiles=1 "显示文件
let NERDTreeShowLineNumbers=1 "显示行号
let NERDTreeHightCursorline=1 "高亮当前文件
let NERDTreeShowHidden=0 "显示隐藏文件
let NERDTreeMinimalUI=0 "不显示'Bookmarks' label 'Press ? for help'
let NERDTreeWinSize=31 "窗口宽度

" coc-nvim 配置
set hidden	"设置隐藏, 允许未保存的文件在缓冲区
set updatetime=100 "刷新时间100ms  默认为4s，较长的时间会导致明显的延迟  
set shortmess+=c	"自动补全减少没用的东西
let g:coc_global_extensions = ['coc-json']

"允许将行号和标识合为一列
"if has("patch-8.1.1564")
 " set signcolumn=number
"else
set signcolumn=yes
"endif
"tab 补全
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space()
inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" : "\<TAB>" 

" 使用ctrl+space触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" 用 [g 和 ]g 来跳转代码错
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 查看当前函数 gd定义 gy类型定义 gi使用 gr参考资料
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 space+h 来展示文档
nnoremap <silent> <space>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" 高亮光标选中的同一个词
autocmd CursorHold * silent call CocActionAsync('highlight')

