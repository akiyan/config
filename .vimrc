syntax on
set autoindent
set smartindent
set number
set ruler
set nobackup
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set ts=4
set nocompatible
set incsearch
set shiftwidth=2
set expandtab
set showmatch "括弧をハイライト
set showcmd
set whichwrap=b,s,h,l,<,>,[,]
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2
nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>
autocmd! BufRead,BufNewFile *.ctp set filetype=php
set scrolloff=3
set history=100
set list
set listchars=tab:>-,nbsp:%,extends:>,precedes:<,eol:$
set hidden
set noswapfile
set backspace=indent,eol,start
set vb t_vb= "no beep
set display=uhex
set wildmenu
set wildchar=<tab>
set wildmode=list:full
set ignorecase
set hlsearch
"set mouse=a
"set ttymouse=xterm2
set formatoptions=q
nnoremap j gj
nnoremap k gk
