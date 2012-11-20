set nocompatible
filetype off                   " (1)

set rtp+=~/.vim/vundle.git/    " (2)
call vundle#rc()               " (3)

Bundle 'vim-scripts/Align'
Bundle 'violetyk/cake.vim'
Bundle 'grep.vim'
Bundle 'rosenfeld/rgrep.vim'
"Bundle 'vim-scripts/vimgrep.vim'
if $SUDO_USER == ''
  Bundle 'Shougo/neocomplcache'
endif
Bundle 'thinca/vim-ref'
"Bundle 'php.vim'
Bundle 'nishigori/vim-php-dictionary'
"Bundle 'PHP-correct-Indenting'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'vim-scripts/php.vim-html-enhanced'
"Bundle 'vim-scripts/php.vim-for-php5'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-surround'
Bundle 'rgo/taglist.vim'
Bundle 'matchit.zip'
"Bundle 'vim-scripts/YankRing.vim'
Bundle 'sjl/clam.vim'
Bundle 'kana/vim-tabpagecd'
"Bundle 'joonty/vim-phpqa.git' "自動Syntaxチェック
Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/zencoding-vim'

" git
Bundle 'motemen/git-vim'
Bundle 'gregsexton/gitv'

" colorscheme
Bundle 'desert256.vim'
Bundle 'mrkn256.vim'
Bundle 'twilight256.vim'

" syntax
"Bundle 'JavaScript-syntax'
"Bundle 'javascript.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'jQuery'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'naberon/vim-cakehtml'

" gf
Bundle 'kana/vim-gf-user'
Bundle 'kana/vim-gf-diff'

" textobj
Bundle 'kana/vim-textobj-user'
Bundle 'akiyan/vim-textobj-php'

" other
Bundle 'glidenote/memolist.vim'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'Shougo/vimproc'
Bundle 'tomtom/checksyntax_vim'
Bundle 'tomtom/quickfixsigns_vim'

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
"autocmd BufRead,BufNewFile *.ctp set filetype=htmlcake
autocmd BufRead,BufNewFile *.thtml set filetype=php
autocmd BufRead,BufNewFile *.t set filetype=perl
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile ~/**/application/views/**/*.php set filetype=htmlcake
autocmd BufRead,BufNewFile ~/**/views/elements/**/*.php set filetype=htmlcake
autocmd BufWritePost *.php :CheckSyntax
autocmd BufWritePost *.ctp :CheckSyntax

autocmd FileType perl set ts=4
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
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

" zencoding-vim
let g:use_zen_complete_tag = 1

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

"pやPを押した時に最後にyankしたテキストを貼り付けるようにする | この先生きのこるには
"http://project-p.jp/halt/?p=1747
"nnoremap p "0p
"nnoremap P "0P

" xでバッファに格納しない
nnoremap x "_x
let g:yankring_n_keys = 'Y D'

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" php
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
"let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = x

" phpqa
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0



" via http://loumo.jp/wp/archive/20120421182934/
set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
map <silent> <leader>tl :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'


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

"単純置換
function! s:replace(...) range "{{{
  if a:0 < 2
      return
        endif

  let range = a:firstline .','. a:lastline

  let tmp = @@
    silent exec range .'yank'
      let text = @@
        let @@ = tmp

  let text =  substitute(text,'\C\V'. escape(a:1,'\'), escape(a:2,'&~\'),'g')

  silent exec "normal! :". range . "change!\<CR>" . text . "."

endfunction "}}}
command! -nargs=+ -buffer -range Replace :<line1>,<line2>call s:replace(<f-args>)
