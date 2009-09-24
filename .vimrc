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
autocmd! BufRead,BufNewFile *.ctp set filetype=php
set scrolloff=3
set history=100
set hidden
set backspace=indent,eol,start
set vb t_vb= "no beep
set display=uhex
set wildmenu
set wildchar=<tab>
set wildmode=list:full
set ignorecase
set ambiwidth=double
set mouse=a
set ttymouse=xterm2
set formatoptions=q

" remap
noremap j gj
noremap k gk
noremap <F-3> g&

" xでバッファに格納しない
nnoremap x "_x
let g:yankring_n_keys = 'Y D'
