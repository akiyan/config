syntax on

" インデント
set autoindent
set smartindent
set shiftwidth=2

" 情報表示
set number "行番号
set ruler  "右下の行数表示
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2

" 表示
set showmatch "括弧をハイライト
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white "全角スペースをハイライト
match ZenkakuSpace /　/
set list
set listchars=tab:>-,nbsp:%,extends:>,precedes:<,eol:$
set display=lastline "画面最後の行をできる限り表示する。
set t_Co=256 "256color
colorscheme Dark2

" 検索
set incsearch     "インクリメンタルサーチ
set hlsearch      "検索語句をハイライト
set nowrapscan    "検索でファイル終端に来たら先頭に戻らない

" バックアップ
set nobackup
set noswapfile

" タブ文字の扱い
set ts=2
set expandtab

set nocompatible
set showcmd
set whichwrap=b,s,h,l,<,>,[,]
nmap tn :tabn<CR>
nmap tp :tabp<CR>
filetype on
filetype plugin on
autocmd! BufRead,BufNewFile *.ctp set filetype=php
"let php_folding = 1
set scrolloff=3
set history=100
set hidden
set backspace=indent,eol,start
set vb t_vb= "no beep
set display=uhex
set wildmenu
set wildchar=<tab>
set wildmode=longest,list
set smartcase
set ambiwidth=double
set mouse=a
set ttymouse=xterm2
set formatoptions=q
set virtualedit+=block

" remap
noremap j gj
noremap k gk
noremap <F-3> g&
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-f>  <C-x><C-o>

" xでバッファに格納しない
nnoremap x "_x
let g:yankring_n_keys = 'Y D'

" Visual mode で選択したテキストを*で検索する
" http://vim-users.jp/2009/11/hack104/
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" encoding
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" 前回終了したカーソル行に移動
" via http://masaoo.blogspot.com/2009/08/ubuntu-vim-vimrc.html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 自動で閉じタグ
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
augroup END
