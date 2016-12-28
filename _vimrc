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

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>

" Color settings
set t_Co=256        " Enable 256 colors
set background=dark	" dark background in use

" some fix for putty
let g:solarized_termcolors=256
colorscheme solarized   " use colorscheme

" Line numbers
set number		      " display line numbers
set numberwidth=1	  " use only one column when possible

" Search
set incsearch		    " do incremental search
set hlsearch		    " highlight search value
set wrapscan		    " wrap around to the beginning of file on search if end is reached
set ignorecase		  " case-insensitive search
set smartcase		    " if a pattern contains an uppercase letter, it is case sensitive

" Indentation
set autoindent		  " always enable autoindenting
set smartindent		  " use smart indent if there is no indent file

" Misc
set title		        " show title in console title bar
set showmatch		    " show matching brackets
set matchpairs+=<:>,":"	" comma-separated list of characters that form pairs
set wildmenu		    " menu completion on <TAB> in command mode
set wildmode=list:longest,full		" cycle between all matches
set ruler		        " display cursor position
set tabstop=2		    " <TAB> inserts four spaces
set shiftwidth=2	  " indent level is 4 spaces wide
set softtabstop=2	  " <BS> over an autoindent deletes both spaces
set expandtab		    " use spaces for autoindent/tab
set smarttab		    " Handle tabs more intelligently
set laststatus=2    " always show statusline
set statusline=[%l,%v\ %p%%]\ %F%m%r%h%w\ %=%03.b,0x%B\ %{fugitive#statusline()}\ [%{&ff}]\ %y\ [len:%L]
set cursorline      " highlight the line containing the cursor
set backspace=2     " Allow backspacing over autoindent, EOL, and BOL
set confirm         " raise a dialog because of unsaved changes
set report=0        " always display changed line count
set noerrorbells    " don't bell
set visualbell t_vb=

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" F3 to toggle numbers
nnoremap <F3> :set invnumber<CR>

" F11 to toggle paste mode
map <F11> :set invpaste<CR>
set pastetoggle=<F11>

" some other keymapping
map <leader>n :NERDTreeToggle<CR>      " Open NERDTree
map <leader>g :GundoToggle<CR>         " Open Gundo window
map <leader>t <Plug>TaskList           " toggle tasklist

