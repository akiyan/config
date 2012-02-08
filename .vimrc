set nocompatible
filetype off                   " (1)

set rtp+=~/.vim/vundle.git/    " (2)
call vundle#rc()               " (3)

Bundle 'vim-scripts/Align'
Bundle 'violetyk/cake.vim'
Bundle 'grep.vim'
if $SUDO_USER == ''
  Bundle 'Shougo/neocomplcache'
endif
Bundle 'thinca/vim-ref'
"Bundle 'php.vim'
Bundle 'nishigori/vim-php-dictionary'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'vim-scripts/php.vim-html-enhanced'
"Bundle 'vim-scripts/php.vim-for-php5'
Bundle 'tpope/vim-surround'
Bundle 'taglist.vim'
Bundle 'matchit.zip'
Bundle 'motemen/git-vim'

" colorscheme
Bundle 'desert256.vim'
Bundle 'mrkn256.vim'
Bundle 'twilight256.vim'

" syntax
"Bundle 'JavaScript-syntax'
"Bundle 'javascript.vim'
Bundle 'jQuery'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'naberon/vim-cakehtml'

" gf
Bundle 'kana/vim-gf-user'
Bundle 'kana/vim-gf-diff'

" textobj
Bundle 'kana/vim-textobj-user'
Bundle 'akiyan/vim-textobj-php'

"

" original repos on github
" Bundle 'tpope/vim-fugitive'
"
" " vim-scripts repos
" Bundle 'rails.vim'
"
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"
filetype plugin indent on     " (5)

syntax on

" インデント
set autoindent
set smartindent
set shiftwidth=2

" 情報表示
set number "行番号
set ruler  "右下の行数表示
" set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set statusline=%F%m%r%h%w\%=[%Y]\[%{&ff}]\[%{&fileencoding}]\[%l/%L]\[%v]
set laststatus=2

" 表示
set showmatch "括弧をハイライト
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white "全角スペースをハイライト
match ZenkakuSpace /　/
set list
set listchars=tab:>-,nbsp:%,extends:>,precedes:<,eol:$
set display=lastline "画面最後の行をできる限り表示する。
set t_Co=256 "256color
colorscheme desert256

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
set ts=2
set softtabstop=2
set expandtab

" splitしたときに下に出す。
set splitbelow

" vsplitしたときに右に出す。
set splitright

set showcmd
set whichwrap=b,s,h,l,<,>,[,]
nmap tn :tabn<CR>
nmap tp :tabp<CR>
filetype on
filetype plugin on
"autocmd! BufRead,BufNewFile *.ctp set filetype=php
autocmd! BufRead,BufNewFile *.thtml set filetype=php
autocmd! BufRead,BufNewFile *.t set filetype=perl
autocmd! BufRead,BufNewFile *.less set filetype=css
autocmd FileType perl set ts=4
set scrolloff=3
set history=100
set hidden
set backspace=indent,eol,start
set vb t_vb= "no beep
set display=uhex

set foldlevel=100

" コマンドライン補完を拡張モードにする
set wildmenu
set wildchar=<tab>
set wildmode=longest,list

" 対応する括弧の強調表示を停止
"let loaded_matchparen = 1

" 対応する括弧の表示時間を2にする
set matchtime=2

set smartcase
set ambiwidth=double
set mouse=a

" 高速ターミナル接続を行う
set ttyfast

set ttymouse=xterm2

set formatoptions=q
set virtualedit+=block

" cake.vim
let g:cakephp_enable_auto_mode = 1

" remap
noremap j gj
noremap k gk
noremap <F-3> g&
noremap <C-s>  :w<Return>
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-f>  <C-x><C-o>
inoremap <C-s>  <ESC>:w<Return>
inoremap <C-TAB>  tn

" xでバッファに格納しない
nnoremap x "_x
let g:yankring_n_keys = 'Y D'

" php
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
"let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = x



" Visual mode で選択したテキストを*で検索する
" http://vim-users.jp/2009/11/hack104/
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" encoding
:set encoding=utf-8
:set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,

" 前回終了したカーソル行に移動
" via http://masaoo.blogspot.com/2009/08/ubuntu-vim-vimrc.html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 自動で閉じタグ
"augroup MyXML
"  autocmd!
"  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
"  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
"augroup END
"

" neocomplcache
"let g:neocomplcache_enable_at_startup = 1
highlight Pmenu ctermbg=lightcyan ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=black
highlight PmenuSbar ctermbg=darkgray
highlight PmenuThumb ctermbg=lightgray
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
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

" 自動的にディレクトリを作成する
" http://vim-users.jp/2011/02/hack202/
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" いいかんじにファイルをたどって開く
" http://hail2u.net/blog/software/only-one-line-life-changing-vimrc-setting.html
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/


if 1 && filereadable($HOME . '/.vimrc_local')
  unlet! g:vimrc_local_finish
  source ~/.vimrc_local
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif


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
