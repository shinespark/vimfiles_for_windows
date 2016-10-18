setl completeopt-=preview
setl autoindent
setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setl expandtab tabstop=4 shiftwidth=4 softtabstop=0
" nerdcommenterには影響がないので注意
" https://github.com/scrooloose/nerdcommenter/issues/166
:inoremap # X#

" delete_last_blank_lines
autocmd BufWritePre * call s:delete_last_blank_line()
function! s:delete_last_blank_line()
  if getline('$') == ""
     $delete _
  endif
endfunction
