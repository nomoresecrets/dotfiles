" Load pathogen from bundle directory
runtime bundle/vim-pathogen/autoload/pathogen.vim

"  =========
"  Shortcuts
"  =========
let mapleader=","		" change leader to comma instead of back-slash
set nocompatible		"  Disable vi compatible mode

" ================================
" Load plugins managed by Pathogen
" ================================
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on	" enable loading indent and plugin file for filetype
syntax on			        " enable syntax highlighting

" recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
