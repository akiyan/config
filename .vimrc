set autoindent
set smartindent
"set number
set ruler
set nobackup
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/
set ts=2
set nocompatible
set incsearch
set shiftwidth=4
set showmatch
set whichwrap=b,s,h,l,<,>,[,]
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set laststatus=2
nmap <Tab> :tabn<CR>
autocmd! BufRead,BufNewFile *.ctp set filetype=php
set foldmethod=indent
let perl_fold=2
set foldlevel=100
