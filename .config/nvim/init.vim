call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
Plug 'akiyan/vim-textobj-php'
Plug 'akiyan/vim-textobj-xml-attribute'
Plug 'kana/vim-tabpagecd'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
Plug 'othree/html5.vim'
Plug 'rking/ag.vim'
Plug 'rosenfeld/rgrep.vim'
Plug 'thinca/vim-quickrun'
Plug 'tomtom/checksyntax_vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Align'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'github/copilot.vim'

"colorschemes
Plug 'nanotech/jellybeans.vim'

if $SUDO_USER == ''
 if has('lua') 
   Plug 'Shougo/neocomplete.vim'
   Plug 'violetyk/neocomplete-php.vim'
  endif
endif
call plug#end()

filetype plugin indent on
filetype plugin on
filetype on
syntax on

" インデント
set autoindent
set smartindent
set shiftwidth=4
"set cinkeys="0{,0},0),:,0#,!^F,o,O,e"
set cinkeys="!^F,o,O,e"
let g:html_indent_inctags = "article,main,section,aside,template"

" 情報表示
set number "行番号
set ruler  "右下の行数表示
" set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set statusline=%F%m%r%h%w\%=[%Y]\[%{&ff}]\[%{&fileencoding}]\[%l/%L]\[%v]
set laststatus=2

" 表示
set showmatch "括弧をハイライト
set matchtime=2 "対応する括弧の表示時間を2にする
set list
set listchars=tab:>-,nbsp:%,extends:>,precedes:<,eol:$
set display=lastline "画面最後の行をできる限り表示する。
set t_Co=256 "256color
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=3
set display=uhex
set foldlevel=100
colorscheme desert

" 検索
set incsearch     "インクリメンタルサーチ
set hlsearch      "検索語句をハイライト
set nowrapscan    "検索でファイル終端に来たら先頭に戻らない
set ignorecase    "検索時大文字小文字無視
set smartcase     "全て小文字なら無視、混在なら特定

" バックアップ
set nobackup
set noswapfile

" タブ文字の扱い
set ts=4
set softtabstop=4
set expandtab

" split動作
set splitbelow " splitしたときに下に出す。
set splitright " vsplitしたときに右に出す。

" コマンドライン
set history=300
set wildmenu " コマンドライン補完を拡張モードにする
set wildchar=<tab>
set wildmode=longest,list
set wildignorecase

" 操作
set backspace=indent,eol,start
set ambiwidth=double
set mouse=
set cinkeys=0{,0},0),0#,!^F,o,O,e

" other
set showcmd
set hidden
set vb t_vb= "no beep
set ttyfast " 高速ターミナル接続を行う
set formatoptions=q
set virtualedit+=block

" encoding
:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,

" remap
noremap j gj
noremap k gk
noremap <C-n> :cnext<Return>
noremap <C-p> :cprevious<Return>
noremap <F-3> g&
noremap <C-s>  :VimShellCreate<Return>
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-f>  <C-x><C-o>
inoremap <C-s>  <ESC>:w<Return>
inoremap <C-TAB>  tn
nmap tn :tabn<CR>
nmap tp :tabp<CR>
"vimの連続コピペ問題 #Vim - Qiita
"http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-p> "0p<CR>
map R  <Plug>(operator-replace)

" autocmd
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.blade.php set filetype=html
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufWritePost *.php :CheckSyntax
autocmd BufWritePost *.ctp :CheckSyntax

autocmd BufRead,BufNewFile *.php set ts=4
autocmd BufRead,BufNewFile *.php set softtabstop=4
autocmd BufRead,BufNewFile *.php set shiftwidth=4

autocmd BufRead,BufNewFile *.vue set ts=2
autocmd BufRead,BufNewFile *.vue set softtabstop=2
autocmd BufRead,BufNewFile *.vue set shiftwidth=2

autocmd BufRead,BufNewFile *.scss set ts=2
autocmd BufRead,BufNewFile *.scss set softtabstop=2
autocmd BufRead,BufNewFile *.scss set shiftwidth=2

autocmd BufRead,BufNewFile *.js set ts=2
autocmd BufRead,BufNewFile *.js set softtabstop=2
autocmd BufRead,BufNewFile *.js set shiftwidth=2

autocmd BufRead,BufNewFile *.html set ts=2
autocmd BufRead,BufNewFile *.html set softtabstop=2
autocmd BufRead,BufNewFile *.html set shiftwidth=2
" 前回終了したカーソル行に移動
" via http://masaoo.blogspot.com/2009/08/ubuntu-vim-vimrc.html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"HTMLではハイフンは単語の境界にしない
autocmd FileType html,xhtml,ejs set iskeyword-=-

"PHPではハイフンは単語の境界にする
autocmd FileType php set iskeyword-=-

au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" xでバッファに格納しない
nnoremap x "_x
"let g:yankring_n_keys = 'Y D'

" php
let php_baselib = 1
let php_htmlInStrings = 1
"let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = x

" neocomplete
" let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
highlight Pmenu ctermbg=lightcyan ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=black
highlight PmenuSbar ctermbg=darkgray
highlight PmenuThumb ctermbg=lightgray
autocmd FileType php :set dictionary=~/.vim/dict/php_func.dict
" 入力文字がこれ以上だと補完しない
" デフォルトは5だけど当然PHPの関数名はそんなんじゃ収まらないからとりあえず増やしまくる
let g:neocomplcache_max_try_keyword_length=100
" 大文字小文字無視
let g:neocomplcache_ignore_case=1
" 大文字を最初に入力したら補完しない
" let g:NeoComplCache_SmartCase=1
" " 補完リストは最大100
" let g:NeoComplCache_MaxList=1000
" _ があっても補完する
let g:neocomplcache_enable_underbar_completion=1
" neocomplete-php
let g:neocomplete_php_locale = 'ja'


" 入力モードの時にステータスラインの色を変える。
let g:hi_insert = 'highlight StatusLine guifg=LightGrey guibg=darkblue gui=none ctermfg=white ctermbg=blue cterm=none'

if has('syntax')
augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" Vim/insertモードでカーソルキーが使えない [俺の基地]
" http://yakinikunotare.boo.jp/orebase2/vim/dont_work_arrow_keys_in_insert_mode
if !has('gui_running')
  set notimeout
  set ttimeout
  set timeoutlen=100
endif

" .vimrc_local
if 1 && filereadable($HOME . '/.vimrc_local')
  unlet! g:vimrc_local_finish
  source ~/.vimrc_local
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

