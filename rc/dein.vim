if &compatible
  set nocompatible               " Be iMproved
endif

let s:vimdir = $HOME . "/.vim"

" dein
let s:dein_enabled  = 0
if v:version >= 704
  let s:dein_enabled = 1

  " Set dein paths
  let s:dein_dir = s:vimdir . '/dein'
  let s:dein_github = s:dein_dir . '/repos/github.com'
  let s:dein_repo_name = "Shougo/dein.vim"
  let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

  " Check dein has been installed or not.
  if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed, install now "
    let s:dein_repo = "https://github.com/" . s:dein_repo_name
    echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
    call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
  endif
  let &runtimepath = &runtimepath . "," . s:dein_repo_dir

  " Check cache
  if dein#load_state(expand(s:dein_dir))
    " Begin plugin part
    call dein#begin(expand(s:dein_dir))

    call dein#add('Shougo/dein.vim') " unsortable

    call dein#add('Shougo/neocomplete.vim', {'lazy': 1, 'on_i': 1})
    call dein#add('Shougo/neomru.vim', {'lazy': 1, 'on_path': '.*'})
    call dein#add('Shougo/neosnippet-snippets', {'on_i': 1})
    call dein#add('Shougo/neosnippet.vim', {'depends': 'neosnippet-snippets', 'lazy': 1, 'on_i': 1, 'on_ft': 'snippet'})
    call dein#add('Shougo/unite-outline', {'lazy': 1, 'on_source': 'unite.vim'})
    call dein#add('Shougo/unite.vim', {'depends': ['neomru.vim', 'unite-outline', 'unite-tag']})
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/vimshell.vim', {'lazy': 1, 'on_cmd': 'VimShell'})
    call dein#add('Yggdroot/indentLine', {'lazy': 1, 'on_ft': 'html'})
    call dein#add('airblade/vim-gitgutter')
    call dein#add('csscomb/vim-csscomb', {'lazy': 1, 'on_cmd': 'CSScomb'})
    call dein#add('dannyob/quickfixstatus')
    call dein#add('davidhalter/jedi-vim', {'build': 'pip install jedi', 'lazy': 1, 'on_ft': 'python'})
    call dein#add('hynek/vim-python-pep8-indent', {'on_ft': 'python'})
    call dein#add('itchyny/dictionary.vim', {'lazy': 1, 'on_cmd': 'Dictionary'})
    call dein#add('itchyny/lightline.vim')
    call dein#add('kchmck/vim-coffee-script', {'lazy': 1, 'on_ft': 'coffee'})
    call dein#add('osyo-manga/shabadou.vim', {'depends': 'vim-watchdogs'})
    call dein#add('osyo-manga/vim-watchdogs')
    call dein#add('rizzatti/dash.vim', {'lazy': 1, 'on_cmd': 'Dash'})
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('shinespark/vim-qfsigns', {'rev': 'feature/changeable-sign-symbol'})
    call dein#add('shinespark/vim-qfstatusline')
    call dein#add('thinca/vim-fontzoom', {'lazy': 1, 'on_cmd': 'Fontzoom'})
    call dein#add('thinca/vim-quickrun', {'depends': ['shabadou.vim', 'vim-watchdogs']})
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rails', {'lazy': 1, 'on_ft': 'eruby'})
    call dein#add('tpope/vim-surround')
    call dein#add('tsukkee/unite-tag', {'lazy': 1, 'on_source': 'unite.vim'})
    call dein#add('tyru/open-browser-github.vim', {'lazy': 1, 'on_cmd': 'OpenGithubFile'})
    call dein#add('tyru/open-browser.vim', {'lazy': 1, 'on_cmd': ['OpenBrowser', 'OpenBrowserSearch', 'OpenBrowserSmartSearch'], 'on_source': 'open-browser-github.vim'})
    call dein#add('vim-scripts/Align', {'lazy': 1, 'on_cmd': 'Align'})
    call dein#add('yuzuemon/emmet-vim', {'lazy': 1, 'on_ft': ['html', 'markdown', 'eruby']})

    " only mac
    if has('mac')
      call dein#add('ctrlpvim/ctrlp.vim', {'depends': 'cpsm'})
      call dein#add('nixprime/cpsm', {'build': 'sh install.sh'})
    endif

    call dein#end()
    call dein#save_state()
  endif

  filetype plugin indent on

  " If you want to install not installed plugins on startup.
  if dein#check_install()
   call dein#install()
  endif
endif

" dein command
command! DeinClearState :dein#clear_state()
