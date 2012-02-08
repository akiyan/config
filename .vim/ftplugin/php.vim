" for QuickFix
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" $this-&gt; をラクに入力する - 永遠に未完成
" http://d.hatena.ne.jp/thinca/20120208/1328676033
function! s:at()
  let syntax = synstack(line('.'), col('.'))
  let name = empty(syntax) ? '' : synIDattr(syntax[-1], "name")
  return name =~# 'String\|Comment\|None' ? '@' : '$this->'
endfunction
inoremap <expr> <buffer> @ <SID>at()
