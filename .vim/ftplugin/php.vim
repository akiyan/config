let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 0
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = x

" for QuickFix
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l


" from http://dotfiles.org/~pento/~/.vim/ftplugin/php.vim
"-------------------------                                                                                                                                     
" Bindings                                                                                                                                                     
"-------------------------                                                                                                                                     
" Function to locate endpoints of a PHP block {{{                                                                                                              
function! PhpBlockSelect(mode)                                                                                                                                 
        let motion = "v"                                                                                                                                       
        let line = getline(".")                                                                                                                                
        let pos = col(".")-1                                                                                                                                   
        let end = col("$")-1                                                                                                                                   
                                                                                                                                                               
        if a:mode == 1                                                                                                                                         
                if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'                                                                                       
                        let motion .= "l"                                                                                                                      
                elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'                                                                                       
                        " do nothing                                                                                                                           
                else                                                                                                                                           
                        let motion .= "/?>/e\"                                                                                                             
                endif                                                                                                                                          
                let motion .= "o"                                                                                                                              
                if end > 0                                                                                                                                     
                        let motion .= "l"                                                                                                                      
                endif                                                                                                                                          
                let motion .= "?<\\?(php)?\\>\"                                                                                                               
        else                                                                                                                                                   
                if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'                                                                                       
                        " do nothing                                                                                                                           
                elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'                                                                                       
                        let motion .= "h?\\S\""                                                                                                            
                else                                                                                                                                           
                        let motion .= "/?>/;?\\S\" 


endfunction                                                                                                                                                    
" }}}                                                                                                                                                          
                                                                                                                                                               
" Mappings to select full/inner PHP block                                                                                                                      
nmap   vaP PhpBlockSelect(1)                                                                                                                     
nmap   viP PhpBlockSelect(0)                                                                                                                     
" Mappings for operator mode to work on full/inner PHP block                                                                                                   
omap  aP :silent normal vaP                                                                                                                        
omap  iP :silent normal viP                                                                                                                        
                                                                                                                                                               
                                                                                                                                                               
let g:pdv_cfg_Uses = 1                                                                                                                                         
                                                                                                                                                               
" More common in PEAR coding standard                                                                                                                          
"inoremap  { {}O                                                                                                                                  
" Maybe this way in other coding standards                                                                                                                     
                                                                                                                                                               
imap { {}O
