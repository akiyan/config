" 現在編集中のファイルのディレクトリを切り替える
function! Fd(dirname) 
  let paths = split(expand('%'), '/')
  call remove(paths, -2)
  call insert(paths, a:dirname, -1)
  let path =  join(paths, '/')
  exec ":e " . path
endfunction

command! -nargs=+ Fd :call Fd(<f-args>)
