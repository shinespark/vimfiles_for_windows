setl autoindent
setl smartindent cinwords=if,elsif,else,for,while,try,except,finally,def,class
setl expandtab tabstop=2 shiftwidth=2 softtabstop=0
:inoremap # X#

" delete_last_blank_lines
autocmd BufWritePre * call s:delete_last_blank_line()
function! s:delete_last_blank_line()
  if getline('$') == ""
     $delete _
  endif
endfunction
