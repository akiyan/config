" cake.vim - Utility for CakePHP developpers.
" Maintainer:  Yuhei Kagaya <yuhei.kagaya@gmail.com>
" License:     This file is placed in the public domain.

let s:save_cpo = &cpo
set cpo&vim

let s:unite_source_shell = {
      \ 'name' : 'cake_shell',
      \ 'description' : 'CakePHP Shells',
      \ }

function! s:unite_source_shell.gather_candidates(args, context) "{{{
  let candidates = []
  for i in items(g:cake.get_shells())
    call add(candidates, {
          \ 'word' : i[0],
          \ 'kind' : 'file',
          \ 'source' : 'cake_shell',
          \ 'action__path' : i[1],
          \ 'action__directory' : fnamemodify(i[1],":p:h"),
          \ })
  endfor

  return candidates
endfunction " }}}
function! unite#sources#cake_shell#define() "{{{
    return s:unite_source_shell
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
" vim:set fenc=utf-8 ff=unix ft=vim fdm=marker:
