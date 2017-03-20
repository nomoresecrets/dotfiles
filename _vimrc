" Load pathogen from bundle directory
runtime bundle/vim-pathogen/autoload/pathogen.vim

"  =========
"  Shortcuts
"  =========
let mapleader=","                 " change leader to comma instead of back-slash
set nocompatible                  " disable vi compatible mode

" ================================
" Load plugins managed by Pathogen
" ================================
filetype off

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

call pathogen#infect()
call pathogen#helptags()

" enable loading indent and plugin file for filetyp
filetype plugin indent on

" enable syntax highlighting
syntax on

" recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" configure airline theme
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

" NERDTree settings
let NERDTreeShowHidden=1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/dotfiles/_vim/bundle/vim-snippets/UltiSnips"


" TagBar settings
let g:tagbar_type_puppet = {
\ 'ctagstype': 'puppet',
\ 'kinds': [
    \'c:class',
    \'s:site',
    \'n:node',
    \'d:definition'
  \]
\}

" CtrlP settings
"
" always open in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" displays tabs and trailing whitespaces with :set list
"set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮
set list
"set showbreak=↪

" Color settings
" set t_Co=256                      " Enable 256 colors
set t_ut=
set background=dark               " dark background in use

" some fix for putty
let g:solarized_termcolors=256
colorscheme solarized

" Line numbers
set relativenumber                " display relativenumer
set number                        " display line numbers
set numberwidth=1                 " use only one column when possible

" Search
set incsearch                     " do incremental search
set hlsearch                      " highlight search value
set wrapscan                      " wrap around to the beginning of file on search if end is reached
set ignorecase                    " case-insensitive search
set smartcase                     " if a pattern contains an uppercase letter, it is case sensitive

" Indentation
set autoindent                    " always enable autoindenting
set smartindent                   " use smart indent if there is no indent file

" Misc
set title                         " show title in console title bar
set showmatch                     " show matching brackets
set matchpairs+=<:>,":"           " comma-separated list of characters that form pairs
set wildmenu                      " menu completion on <TAB> in command mode
set wildmode=list:longest,full    " cycle between all matches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set ruler                         " display cursor position
set tabstop=2                     " <TAB> inserts two spaces
set shiftwidth=2                  " indent level is 2 spaces wide
set softtabstop=2                 " <BS> over an autoindent deletes both spaces
set expandtab                     " use spaces for autoindent/tab
set smarttab                      " Handle tabs more intelligently
set laststatus=2                  " always show statusline
set statusline=[%l,%v\ %p%%]\ %F%m%r%h%w\ %=%03.b,0x%B\ %{fugitive#statusline()}\ [%{&ff}]\ %y\ [len:%L]
set cursorline                    " highlight the line containing the cursor
set backspace=2                   " Allow backspacing over autoindent, EOL, and BOL
set confirm                       " raise a dialog because of unsaved changes
set report=0                      " always display changed line count
set scrolloff=5                   " scroll 5 lines ahead
set noerrorbells                  " don't bell
set visualbell t_vb=

" functions
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" automatic toggle relative numbering in INSERT mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" handle puppet :: delimiter correctly
au FileType puppet setlocal isk+=:

" automatic open puppet ctag in new tab
au FileType puppet nnoremap <leader>t :tab split<CR>:exe "tag " . substitute(expand("<cword>"), "^::", "", "")<CR>

" Get off my lawn
nnoremap <Left> :echoe "please use h"<CR>
nnoremap <Right> :echoe "please use l"<CR>
nnoremap <Up> :echoe "please use k"<CR>
nnoremap <Down> :echoe "please use j"<CR>

" key mapping in VisualBlock mode for moving blocks around
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight
vmap <unique> D       <Plug>SchleppDup

" set <leader> shortcuts
" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<CR>:let @/=''<CR>

" shortcut to save
nmap <leader>, :w<cr>
nmap <leader>gs :Gstatus<cr>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" F3 to toggle numbers
nnoremap <F3> :call NumberToggle()<CR>

" F5, F6, F7 fugitive shortcuts
nnoremap <F5> :Gstatus<CR>
nnoremap <F6> :Gcommit<CR>
nnoremap <F7> :Gpush<CR>

" F8 toggle TagBar
nmap <F8> :TagbarToggle<CR>

" F11 to toggle paste mode
map <F11> :set invpaste<CR>
set pastetoggle=<F11>

" some other keymapping
map <leader>n :NERDTreeTabsToggle<CR>  " Open NERDTree
map <leader>u :GundoToggle<CR>         " Open Gundo window

