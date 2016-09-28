"-------------------------------------
"|          PREPARE PLUGINS          |
"-------------------------------------
set nocompatible                  " We don't care about vi compatibility
filetype off                      " Vundle stuff, required
set rtp+=~/.vim/bundle/Vundle.vim " Tell vim where vundle is
call vundle#begin()               " Start using vundle
Plugin 'VundleVim/Vundle.vim'     " Vundle loads itself
" --> PLUGINS MUST GO BELOW THIS LINE <--

" Here's are few I like. They are all github repos (which vundle deals with natively)
" Example: this plugin is hosted at github.com/tpope/vim-commentary
" Plugin 'tpope/vim-commentary'

" Syntax highlighting
Plugin 'christoomey/vim-tmux-navigator'         " Seamless tmux and vim movement
Plugin 'moll/vim-node'                          " Node syntax highlighting
Plugin 'othree/html5.vim'                       " HTML5 Syntax
Plugin 'othree/javascript-libraries-syntax.vim' " jQuery, etc syntax highlighting
Plugin 'pangloss/vim-javascript'                " Javascript Syntax highlighting
Plugin 'scrooloose/syntastic'                   " Syntax checking

" Source Control / File manipulation
Plugin 'scrooloose/nerdtree'         " Some people hate it, but I think it works best
Plugin 'Xuyuanp/nerdtree-git-plugin' " See changed files in git on nerdtree
Plugin 'airblade/vim-gitgutter'      " Tells you what lines have been changed (uses git)
Plugin 'tpope/vim-fugitive'          " Git integration
Plugin 'vim-airline/vim-airline'	 " bottom info bar!
Plugin 'vim-airline/vim-airline-themes' " theme for bottom info bar!

" Editor Behavior / functionality extensions
Plugin 'tpope/vim-sensible'      " A few options that should be default
Plugin 'tpope/vim-surround'      " Quick change surrounding chars
Plugin 'tpope/vim-repeat'        " Any action can be repeated by pressing .
Plugin 'tpope/vim-commentary'    " Quickly comment lines of code
Plugin 'junegunn/vim-easy-align' " Easily align text
Plugin 'ciaranm/detectindent'    " Detect and use a file's indent settings

" --> PLUGINS MUST GO ABOVE THIS LINE <--
call vundle#end()          
runtime macros/matchit.vim " Built in macro that matches closing html tags with %


"-------------------------------------
"|          Editor Settings          |
"-------------------------------------
filetype plugin indent on " Indent based on filetype

set autoindent  " This and smartindent are the only sane options
set smartindent
set breakindent " Wrapped lines start at current indent
set complete+=k
set complete-=i
set encoding=utf-8      " It's not the 90's anymore
set fileencodings=utf-8 " It's not the 90's anymore
set formatoptions-=o =-c

set guioptions-=l " GUI stuff
set guioptions-=T " GUI stuff
set guioptions-=r " GUI stuff
set guioptions-=R " GUI stuff


set hidden       " ingore empty windows with no file and no data
set ignorecase   " Don't worry about case, unless...
set smartcase    " Be case-sensitive when a string has upper and lowercase
set iskeyword+=-
set lazyredraw   " Improves performance in terminal when rapidly scrolling
set noerrorbells " Sound is annoyng. Also improves performance when scroll
set nojoinspaces " see :h nojoinspaces
set ruler        " Show line# and column
set splitbelow   " New hsplits below
set splitright   " new vsplits right
set title        " Set terminal title
set ttyfast      " Improves scrolling perfomance
set wildmenu     " Fuzzy tabbing through menus and options
set wildmode=longest,full


"----------File I/O, shell and platform-specific behavior and settings----------
set noswapfile                " Use git and backups, not swap
set backup                    " use backup, not swaps
set backupdir=~/.vim/backup// " Backup dir
set dir=~/.vim/swap//         " Swap dir (might be redundant)
set undofile                  " Save undo history to file
set undodir=~/.vim/undos      " Undo file location
set undolevels=5000           " Undo file length
set undoreload=5000
set autowrite                 " Auto save files
set autowriteall              " Auto save files
set mouse=a                   " use mouse
set pastetoggle=<F2>          " Press F2 before pasting to retain formatting
set clipboard=unnamed         " Needed for clipboard in Linux
:au FocusLost * :wa           " Save file when switching pane

autocmd BufLeave,FocusLost * silent! wall     " Save files when switching pane
:au FocusLost * :wa                           " Save files when switching pane
au BufNewFile,BufRead *.ejs set filetype=html " ejs files are treated like html


"----------Visual Stuff ----------
set t_Co=256        " Use al 256 colors. This must be before configuring colors
set background=dark " Dark BG
syntax on           " Use syntax highlighting
set cursorline      " Highlight the line that the cursor is on
set cursorcolumn    " Show cursor crosshair
:let g:airline_theme='solarized dark'
"colorscheme aCoolColorScheme

"---------- Behavior ------
set hlsearch       " Best searching
set number         " show line number
set relativenumber " Relative line number
set tabstop=4      " Tab is 4 spaces
set shiftwidth=4   " Tab is 4 spaces
set softtabstop=4  " Tab is 4 spaces
set noexpandtab    " Use tabs, not spaces
set smarttab       " Intelligent tab settin
set scrolloff=15   " Keeps cursor off the top and bottom line on screen
set colorcolumn=80 " Show guide at 80 spaces
set showbreak=┗━━━ " Makes it easier to read wrapped lines
set cpoptions+=n   " How wrapped lines are displayed
set wrap           " wrap long lines

"---------- Remaps ----------
" hitting :W (not :w) will still save
command! W w 
" Press L to go to last char in line
map L $      
" Press H to go to first char in line
map H ^       
" F8 will remove all trailing whitespace in a file
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
