let [plugins, ftplugin] = dein#load_cache_raw(['/Users/metroid/dotfiles/.vim/vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/metroid/.vim/dein'
let g:dein#_runtime_path = '/Users/metroid/.vim/dein/.dein'
let &runtimepath = '/Users/metroid/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/metroid/.vim/dein/repos/github.com/nixprime/cpsm,/Users/metroid/.vim/dein/repos/github.com/tsukkee/unite-tag,/Users/metroid/.vim/dein/repos/github.com/Shougo/unite-outline,/Users/metroid/.vim/dein/repos/github.com/Shougo/neomru.vim,/Users/metroid/.vim/dein/.dein,/Users/metroid/.vim,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/metroid/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimproc,/Users/metroid/.vim/,/Users/metroid/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/metroid/.vim/dein/.dein/after'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Dictionary call dein#autoload#_on_cmd('Dictionary', 'dictionary.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* OpenBrowser call dein#autoload#_on_cmd('OpenBrowser', 'open-browser.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* OpenBrowserSearch call dein#autoload#_on_cmd('OpenBrowserSearch', 'open-browser.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* OpenBrowserSmartSearch call dein#autoload#_on_cmd('OpenBrowserSmartSearch', 'open-browser.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* CSScomb call dein#autoload#_on_cmd('CSScomb', 'vim-csscomb', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Dash call dein#autoload#_on_cmd('Dash', 'dash.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* VimShell call dein#autoload#_on_cmd('VimShell', 'vimshell.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Fontzoom call dein#autoload#_on_cmd('Fontzoom', 'vim-fontzoom', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* OpenGithubFile call dein#autoload#_on_cmd('OpenGithubFile', 'open-browser-github.vim', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Align call dein#autoload#_on_cmd('Align', 'Align', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim', 'neosnippet-snippets', 'neosnippet.vim'])
