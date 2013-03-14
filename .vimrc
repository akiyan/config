set nocompatible
filetype off                   " (1)

set rtp+=~/.vim/vundle.git/    " (2)
call vundle#rc()               " (3)

Bundle 'Shougo/vimproc'
Bundle 'akiyan/vim-textobj-php'
Bundle 'desert256.vim'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'git@github.com:nanapi/nanapi.vim.git'
Bundle 'glidenote/memolist.vim'
Bundle 'gregsexton/gitv'
Bundle 'grep.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jQuery'
"Bundle 'jelera/vim-javascript-syntax'
Bundle 'joonty/vim-phpqa.git'
Bundle 'kana/vim-gf-diff'
Bundle 'kana/vim-gf-user'
Bundle 'kana/vim-tabpagecd'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-operator-replace.git'
Bundle 'kana/vim-operator-user.git'
Bundle 'lukaszb/vim-web-indent'
Bundle 'matchit.zip'
Bundle 'mattn/zencoding-vim'
Bundle 'miya0001/vim-dict-wordpress'
Bundle 'motemen/git-vim'
Bundle 'mrkn256.vim'
Bundle 'naberon/vim-cakehtml'
Bundle 'nishigori/vim-php-dictionary'
Bundle 'othree/html5.vim'
"Bundle 'pangloss/vim-javascript'
Bundle 'rgo/taglist.vim'
Bundle 'rosenfeld/rgrep.vim'
Bundle 'sjl/clam.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'twilight256.vim'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/dbext.vim'
"Bundle 'vim-scripts/IndentAnything'
"Bundle 'vim-scripts/javascript.vim'
Bundle 'violetyk/cake.vim'
Bundle 'tyru/open-browser-github.vim'
Bundle 'tyru/open-browser.vim'
if $SUDO_USER == ''
 Bundle 'Shougo/neocomplcache'
endif
"Bundle 'JavaScript-syntax'
"Bundle 'PHP-correct-Indenting'
"Bundle 'javascript.vim'
"Bundle 'php.vim'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'tomtom/checksyntax_vim'
"Bundle 'tomtom/quickfixsigns_vim'
"Bundle 'vim-scripts/YankRing.vim'
"Bundle 'vim-scripts/php.vim-for-php5'
"Bundle 'vim-scripts/php.vim-html-enhanced'
"Bundle 'vim-scripts/vimgrep.vim'
"
filetype plugin indent on     " (5)
filetype plugin on
filetype on
syntax on

" インデント
set autoindent
set smartindent
set shiftwidth=2
"set cinkeys="0{,0},0),:,0#,!^F,o,O,e"
set cinkeys="!^F,o,O,e"

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
set mouse=a
set cinkeys=0{,0},0),0#,!^F,o,O,e

" 
set showcmd
set hidden
set vb t_vb= "no beep
set ttyfast " 高速ターミナル接続を行う
set ttymouse=xterm2
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
noremap <C-s>  :w<Return>
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
autocmd BufRead,BufNewFile *.t set filetype=perl
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile ~/**/application/views/**/*.php set filetype=htmlcake
autocmd BufRead,BufNewFile ~/**/views/elements/**/*.php set filetype=htmlcake
autocmd BufRead,BufNewFile *.ctp set filetype=htmlcake
autocmd BufRead,BufNewFile *.thtml set filetype=htmlcake
"autocmd BufWritePost *.php :CheckSyntax
"autocmd BufWritePost *.ctp :CheckSyntax
" 前回終了したカーソル行に移動
" via http://masaoo.blogspot.com/2009/08/ubuntu-vim-vimrc.html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" いいかんじにファイルをたどって開く
" http://hail2u.net/blog/software/only-one-line-life-changing-vimrc-setting.html
"autocmd FileType html,xhtml,htmlcake setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

"HTMLのsmartインデントを無効にする.
"autocmd FileType html,xhtml,htmlcake set nosmartindent

"HTMLではハイフンは単語の境界にしない
"autocmd FileType html,xhtml,htmlcacke set iskeyword+=-



autocmd FileType perl set ts=4
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" cake.vim
let g:cakephp_enable_auto_mode = 1

" zencoding-vim
let g:use_zen_complete_tag = 1

" html5.vim


" xでバッファに格納しない
nnoremap x "_x
"let g:yankring_n_keys = 'Y D'

" php
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
"let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = x

" phpqa.vim
let g:phpqa_messdetector_autorun = 0 " Don't run messdetector on save (default = 1)
let g:phpqa_codesniffer_autorun  = 0 " Don't run codesniffer on save (default = 1)
let g:phpqa_codecoverage_autorun = 0 " Show code coverage on load (default = 0)

" ctags.vim
" via http://loumo.jp/wp/archive/20120421182934/
set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
map <silent> <leader>tl :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'

" neocomplcache.vim
"let g:neocomplcache_enable_at_startup = 1
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

"minibuf
let g:miniBufExplVSplit = 20
let g:miniBufExplSplitBelow = 0
let g:miniBufExplAutoOpen = 0
map <Leader>b :MiniBufExplorer<cr>

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

" 端末上の Vim からローカルにコピーする
" http://blog.remora.cx/2011/08/yank-to-local-clipboard-from-vim-on-screen.html
"
" yank to remote
"let g:y2r_config = {
"\   'tmp_file': '/tmp/vim-exchange-file',
"\   'key_file': expand('$HOME') . '/.exchange.key',
"\   'host': 'localhost',
"\   'port': 52224,
"\}
"function! Yank2Remote()
"    call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
"    let s:params = ['cat %s %s | nc -w1 %s %s']
"    for s:item in ['key_file', 'tmp_file', 'host', 'port']
"        let s:params += [shellescape(g:y2r_config[s:item])]
"    endfor
"    let s:ret = system(call(function('printf'), s:params))
"endfunction
"nnoremap <silent> <unique> <Leader>y :call Yank2Remote()<CR>

" .vimrc_local
if 1 && filereadable($HOME . '/.vimrc_local')
  unlet! g:vimrc_local_finish
  source ~/.vimrc_local
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif
