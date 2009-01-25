set autoindent
set smartindent
"set number
set ruler
set nobackup
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set ts=4
set nocompatible
set incsearch
set shiftwidth=2
set expandtab
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2
nmap <Tab> :tabn<CR>
autocmd! BufRead,BufNewFile *.ctp set filetype=php
set scrolloff=3
set history=100
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
