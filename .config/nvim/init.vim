call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
"Plug 'Shougo/vimshell'
Plug 'akiyan/vim-textobj-php'
"Plug 'akiyan/vim-textobj-erb'
Plug 'akiyan/vim-textobj-xml-attribute'
"Plug 'AndrewRadev/linediff.vim'
"Plug 'chrisbra/csv.vim'
"Plug 'fholgado/minibufexpl.vim'
"Plug 'gcmt/wildfire.vim'
"Plug 'glidenote/memolist.vim'
"Plug 'gregsexton/gitv'
"Plug 'grep.vim'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'jQuery'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'joonty/vim-phpqa.git'
"Plug 'kana/vim-gf-user'
"Plug 'kana/vim-gf-diff'
Plug 'kana/vim-tabpagecd'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-line'
"Plug 'kien/ctrlp.vim'
Plug 'lukaszb/vim-web-indent'
" Plug 'alpaca-tc/alpaca_powertabline'
" Plug 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
Plug 'majutsushi/tagbar'
"Plug 'matchit.zip'
"Plug 'mattn/qiita-vim'
"Plug 'mattn/gist-vim'
"Plug 'mattn/webapi-vim'
"Plug 'miya0001/vim-dict-wordpress'
"Plug 'mklabs/vim-issues'
"Plug 'motemen/git-vim'
"Plug 'mrkn256.vim'
"Plug 'nishigori/vim-php-dictionary'
"Plug 'stephpy/vim-php-cs-fixer'
"Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'pydave/AsyncCommand'
Plug 'rgo/taglist.vim'
Plug 'rking/ag.vim'
Plug 'rosenfeld/rgrep.vim'
"Plug 'sjl/clam.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'
"Plug 'thinca/vim-ref'
"Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'twilight256.vim'
"Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/Align'
"Plug 'vim-scripts/dbext.vim'
"Plug 'SQLUtilities'
"Plug 'Shougo/unite.vim'
"Plug 'ujihisa/unite-colorscheme'
"Plug 'violetyk/gitquick.vim'
"Plug 'terryma/vim-expand-region'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
"Plug 'kannokanno/previm'
" Plug 't9md/vim-choosewin'
" Plug 'plasticboy/vim-markdown'
"PlugFetch 'jszakmeister/markdown2ctags'
"Plug 'violetyk/iikanji-markdown.vim'
"Plug 'leafOfTree/vim-vue-plugin'

"ruby
"Plug 'slim-template/vim-slim'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-rails'
"Plug 'vim-ruby/vim-ruby'
"Plug 'scrooloose/syntastic'

"colorschemes
"Plug 'altercation/vim-colors-solarized'
"Plug 'jonathanfilip/vim-lucius'
"Plug 'jpo/vim-railscasts-theme'
Plug 'nanotech/jellybeans.vim'
"Plug 'tomasr/molokai'
"Plug 'vim-scripts/Wombat'
"Plug 'vim-scripts/rdark'
"Plug 'vim-scripts/twilight'
"Plug 'w0ng/vim-hybrid'
"Plug 'fatih/vim-go'

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Chrome'

if $SUDO_USER == ''
 if has('lua') 
   Plug 'Shougo/neocomplete.vim'
   Plug 'violetyk/neocomplete-php.vim'
  endif
endif
"Plug 'JavaScript-syntax'
"Plug 'PHP-correct-Indenting'
"Plug 'javascript.vim'
"Plug 'php.vim'
"Plug 'shawncplus/phpcomplete.vim'
Plug 'tomtom/checksyntax_vim'
"Plug 'tomtom/quickfixsigns_vim'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'vim-scripts/php.vim-for-php5'
"Plug 'vim-scripts/php.vim-html-enhanced'
"Plug 'vim-scripts/vimgrep.vim'
call plug#end()

filetype plugin indent on     " (5)
filetype plugin on
filetype on
syntax on

" インデント
set autoindent
set smartindent
set shiftwidth=4
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
colorscheme jellybeans

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

" 自動保存
" 
" set autowrite
" set updatetime=500
"
" function s:AutoWriteIfPossible()
"   if !&readonly && bufname('%') !=# ''
"     w
"   endif
" endfunction

"autocmd CursorHold * call s:AutoWriteIfPossible()
"autocmd CursorHoldI * call s:AutoWriteIfPossible()

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

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" autocmd
autocmd BufRead,BufNewFile *.t set filetype=perl
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

autocmd BufRead,BufNewFile *.blade.php set ts=2
autocmd BufRead,BufNewFile *.blade.php set softtabstop=2
autocmd BufRead,BufNewFile *.blade.php set shiftwidth=2

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


autocmd FileType perl set ts=4
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

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

" ruby
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_slim_checkers = ['slim_lint']

" ctags.vim
" via http://loumo.jp/wp/archive/20120421182934/
set tags=tags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
map <silent> <leader>tl :TlistToggle<CR>
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'
let g:tlist_markdown_settings = 'markdown;h:Headlins'

" tagbar
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : $HOME . '/.vim/bundle/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

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

"minibuf
let g:miniBufExplVSplit = 20
let g:miniBufExplSplitBelow = 0
let g:miniBufExplAutoOpen = 0
map <Leader>b :MiniBufExplorer<cr>

"unite
nnoremap [unite] :<C-u>Unite<Space>
"nmap f [unite]

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
" let g:y2r_config = {
" \   'tmp_file': expand('$HOME') . '/.vim-exchange-file',
" \   'key_file': expand('$HOME') . '/.vim-exchange-key',
" \   'host': 'localhost',
" \   'port': 52224,
" \}
" function! Yank2Remote()
"     call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
"     let s:params = ['cat %s %s | nc -w1 %s %s']
"     for s:item in ['key_file', 'tmp_file', 'host', 'port']
"         let s:params += [shellescape(g:y2r_config[s:item])]
"     endfor
"     let s:ret = system(call(function('printf'), s:params))
" endfunction
" nnoremap <silent> <unique> <Leader>y :call Yank2Remote()<CR>



function! Paste64Copy()
  let b64 = webapi#base64#b64encode(@")
  if $TMUX != ""
    "tmuxのとき
    let cmd = printf('printf "\x1bPtmux;\x1b\x1b]52;;%s\x1b\x1b\\\\\x1b\\" > /dev/tty', b64)
  elseif $TERM == "xterm-256color"
    "GNU Screenのとき
    let cmd = printf('printf "\x1bP\x1b]52;;%s\x07\x1b\\" > /dev/tty', b64)
  else
    let cmd = printf('printf "\x1b]52;;%s\x1b\\" > /dev/tty', b64)
  endif
  call system(cmd)
endfunction
nnoremap <Leader>y :call Paste64Copy()<CR>

" choosewin

" '-' で呼び出し
nmap  -  <Plug>(choosewin)

" オーバーレイを使う
let g:choosewin_overlay_enable = 1

" マルチバイトバッファでオーバーレイフォントを崩さないように
let g:choosewin_overlay_clear_multibyte = 1

" neocomplete-php
let g:neocomplete_php_locale = 'ja'

"---- php-cs-fixer
" php-cs-fixerをインストールした場所を指定
let g:php_cs_fixer_path = "~/php-cs-fixer"
" psr0 psr1 psr2 allを指定
let g:php_cs_fixer_level = "all"
" default sf20 sf21の指定symfonyの指定などの構造確認？が出来る
let g:php_cs_fixer_config = "default"
" phpコマンドの場所
let g:php_cs_fixer_php_path = "php"
" フィルター（http://cs.sensiolabs.org/ここにしていされているやつが使える）
let g:php_cs_fixer_fixers_list = ""
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_verbose = 0

" .vimrc_local
if 1 && filereadable($HOME . '/.vimrc_local')
  unlet! g:vimrc_local_finish
  source ~/.vimrc_local
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

