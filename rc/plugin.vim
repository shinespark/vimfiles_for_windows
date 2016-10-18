" Align.vim ----------------------------
let g:Align_xstrlen = 3
vnoremap <C-a> :<C-u>'<,'>Align =<CR>
vnoremap <C-h> :<C-u>'<,'>Align =><CR>


" cpsm ---------------------------------
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'


" emmet-vim ----------------------------
let g:user_emmet_settings = {
  \ 'indentation' : '  ',
  \ 'lang' : 'ja',
  \ 'eruby': {
  \   'snippets': {
  \     'pv' : "<% ${cursor} %>",
  \     'pv-': "<%= ${cursor} %>",
  \     'pve': "<% end %>",
  \   },
  \ },
  \}
let g:user_emmet_expandabbr_key = '<c-z>'


" gitgutter ----------------------------
nnoremap <Leader>g :<C-u>GitGutterToggle<CR>
nnoremap <Leader>h :<C-u>GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>b :<C-u>bw! fugitiveblame<CR>


" jedi.vim -----------------------------
let g:jedi#rename_command = "<leader>R"


" lightline.vim ------------------------
let g:lightline = {
      \ 'colorscheme': 'metroid',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
      \             [ 'ctrlpmark' ] ],
      \   'right': [ [ 'qfstatusline', 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'MyMode',
      \   'filename': 'MyFileName',
      \   'fugitive': 'MyFugitive',
      \   'ctrlpmark': 'MyCtrlPMark'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'qfstatusline': 'qfstatusline#Update'
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'qfstatusline': 'error'
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      \}

function! MyMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
       \ &ft == 'unite' ? 'Unite' :
       \ &ft == 'vimfiler' ? 'VimFiler' :
       \ &ft == 'vimshell' ? 'VimShell' :
       \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyFileName()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
       \ &ft == 'unite' ? unite#get_status_string() :
       \ &ft == 'vimshell' ? vimshell#get_status_string() :
       \ fname != '' ? fname : '[No Name]'
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyCtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2'
  \}

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction


let g:Qfstatusline#UpdateCmd = function('lightline#update')


let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:white = [ '#ffffff', 255 ]
let s:yellow = [ '#fef935', 227 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 197 ]
let s:magenta = [ '#ff4cfc', 200 ]
let s:blue = [ '#8ac6f2', 117 ]
let s:cyan = s:blue
let s:green = [ '#00f896', 48 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:yellow ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base1 ] ]
let s:p.tabline.right = [ [ s:base2, s:base01 ] ]
let s:p.normal.error = [ [ s:base02, s:yellow ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#metroid#palette = lightline#colorscheme#flatten(s:p)


" neocomplete --------------------------
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_syntax_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#max_list = 25
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#smart_close_popup() . "\<CR>" " For inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>" " For no inserting <CR> key.
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.python = '[^. \t]\.\w*'
" let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


" neosnippet ---------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"


" NERDCommenter ------------------------
" use NERDCommenterToggle c--
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters = {
  \  'haml': { 'left': '/'},
  \  'scss': { 'left': '//'}
  \}
let NERDSpaceDelims = 1
nmap <c-_> <Plug>NERDCommenterToggle
vmap <c-_> <Plug>NERDCommenterToggle
nmap <c-l> <Plug>NERDCommenterAlignLeft
vmap <c-l> <Plug>NERDCommenterAlignLeft


" surroud.vim --------------------------
noremap <c-3> ysst


" qfsines.vim --------------------------
let g:qfsigns#SignSymbol = '⚠'


" unite.vim ----------------------------
let g:unite_update_time = 250
let g:unite_enable_start_insert = 0 " unite starts in insert mode
let g:unite_force_overwrite_statusline = 0

call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#custom#substitute('file', '[^~.]\zs/', '*/*', 20)
call unite#custom#substitute('file', '/\ze[^*]', '/*', 10)
call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('file', '^\\', '~/*')
call unite#custom#substitute('file', '^;v', '~/.vim/*')
call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/*"')
call unite#custom#substitute('file', '\*\*\+', '*', -1)
call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
call unite#custom#substitute('file', '\\ \@!', '/', -30)

function! IsInsideWorkTree()
  let l:is_inside = system('git rev-parse --is-inside-work-tree')
  return l:is_inside == "true\n" ? 1 : 0
endfunction

function! DispatchUniteFileRecAsyncOrGit()
  if IsInsideWorkTree()
    Unite -start-insert file_rec/git:--cached:--others:--exclude-standard
  else
    Unite -start-insert file_rec/async
  endif
endfunction

" unite mapping
nnoremap [unite] <Nop>
nmap ,u [unite]
nnoremap <silent>[unite]a  :<C-u>Unite -buffer-name=files buffer file_mru bookmark file tab<CR>
nnoremap <silent>[unite]b  :<C-u>Unite buffer<CR>
" nnoremap <silent>[unite]c  :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent>[unite]c  :execute "Unite file file/new -input=" . expand("%:p:h") . "/"<CR>
nnoremap <silent>[unite]p :<C-u>Unite -start-insert file_rec/async<CR>
nnoremap <silent>[unite]g :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent>[unite]f :<C-u>Unite find<CR>
" nnoremap <silent>[unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer -direction=topleft -no-quit<CR>
" nnoremap <silent>[unite]gg :<C-u>Unite grep:. -buffer-name=search-buffer -direction=topleft -no-quit<CR><C-r><C-w><CR>
" nnoremap <silent>[unite]gr :<C-u>UniteResume search-buffer -auto-preview<CR>
nnoremap <silent>[unite]l  :<C-u>Unite tab<CR>
nnoremap <silent>[unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent>[unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent>[unite]me :<C-u>Unite output:message<CR>
nnoremap <silent>[unite]n  :<C-u>Unite file/new<CR>
nnoremap <silent>[unite]o  :<C-u>Unite outline -vertical -winwidth=50<CR>
nnoremap <silent>[unite]qc :<C-u>UniteWithBufferDir -buffer-name=files file file/new -no-quit<CR>
nnoremap <silent>[unite]qo :<C-u>Unite outline -vertical -winwidth=30 -no-quit<CR>
nnoremap <silent>[unite]qt :<C-u>Unite tab -no-quit<CR>
nnoremap <silent>[unite]qu :<C-u>Unite file_mru tab -no-quit<CR>
nnoremap <silent>[unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent>[unite]s  :<C-u>Unite source<CR>
nnoremap <silent>[unite]t  :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
nnoremap <silent>[unite]u  :<C-u>Unite -start-insert file_mru tab<CR>

" use ag(The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" open with separated window
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" open with separated vertical window
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" close on push esc*2
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" unite-tag ----------------------------
let g:unite_source_tag_max_name_length  = 50
let g:unite_source_tag_max_fname_length = 50


" vim-quickrun -------------------------
let g:quickrun_config = {
  \ '_': {
  \   'runner': 'vimproc',
  \   'runner/vimproc/updatetime': '100',
  \   'outputter': 'buffer',
  \   'split': 'botright 5sp',
  \   'close_on_empty': 1,
  \   'hook/time/enable': 1
  \ },
  \ 'javascript': {
  \   'commond': 'node',
  \   'tempfile': '{tempname()}.js'
  \ },
  \ 'watchdogs_checker/_': {
  \   'outputter': 'quickfix',
  \   'hook/time/enable': 0,
  \   'hook/back_window/enable_exit' : 1,
  \   'hook/qfsigns_update/enable_exit': 1,
  \   'hook/qfsigns_update/priority_exit': 1,
  \   'hook/qfstatusline_update/enable_exit': 1,
  \   'hook/qfstatusline_update/priority_exit': 1
  \ },
  \ 'haml/watchdogs_checker': {
  \   'type': 'watchdogs_checker/haml-lint'
  \ },
  \ 'javascript/watchdogs_checker': {
  \   'type': 'watchdogs_checker/jshint'
  \ },
  \ 'python/watchdogs_checker': {
  \   'type': 'watchdogs_checker/flake8'
  \ },
  \ 'ruby/watchdogs_checker': {
  \   'type': 'watchdogs_checker/rubocop',
  \   'cmdopt': '-D'
  \ },
  \ 'scss/watchdogs_checker': {
  \   'type': 'watchdogs_checker/scss-lint',
  \   'cmdopt': '-c $HOME/git/cojprn2016/src/vendor/gems/scss-lint/config/default.yml'
  \ }
  \}
  " \ 'watchdogs_checker/_': {
  " \   'outputter/quickfix/open_cmd': '',
  " \ },
  " \ 'php/watchdogs_checker': {
  " \   'type': 'watchdogs_checker/phpmd',
  " \   'cmdopt': '$HOME/.config/phpmd.xml'
  " \ },
  " \ 'php/watchdogs_checker': {
  " \   'type': 'watchdogs_checker/phpcs',
  " \   'cmdopt': '--standard=$HOME/.config/phpcs.xml'
  " \ },
  " \ 'scss/watchdogs_checker': {
  " \   'type': 'watchdogs_checker/scss-lint',
  " \   'cmdopt': '-c $HOME/.config/.scss-lint.yml'
  " \ }
" 'split': 'botright 50vsp',
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
nnoremap <Leader>w :<C-u>ccl<CR>


" vim-watchdogs ------------------------
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {
\  'haml': 0
\}
let g:watchdogs_check_CursorHold_enable = 1
let g:watchdogs_check_CursorHold_enables = {
\  'haml': 0
\}
let g:watchdogs_check_BufWritePost_enable_on_wq = 0
call watchdogs#setup(g:quickrun_config)
