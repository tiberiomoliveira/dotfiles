" Number of colors supported
set t_Co=256
" Searching
set hlsearch   " Set highlight search
set incsearch  " Show matches as soon as possible
set showmatch  " Show matching brackets when typing
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Turn on the wild menu
set wildmenu
set wildmode=list:longest,full
" Set mouse support
set mouse=r
" Disable backup file
set nobackup
set nowb
set noswapfile
" Enable a column line number for the current line and relative line number
" for the rest
set relativenumber number
setglobal relativenumber number
autocmd BufEnter * set relativenumber number
let g:netrw_bufsettings = "noma nomod nu nobl nowrap ro rnu"
" Enable invisible characters
set list
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Autoident files
set smartindent
" Wrap lines
set wrap
" Number of spaces to use for each step of indent
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Sets the number of columns for a <Tab>
set softtabstop=4
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Be smart when using tabs - it respects 'tabstop'. 'shiftwidth', and 'softtab'
set smarttab
" Highlight cursor line
set cursorline
" Highlight cursor column
set cursorcolumn
" Enable spell correction
set spell
" Ignore files with following extentions:
set wildignore+=*.d,*.so,*.a,*.o,*.DEP,*.swp,*.zip
" Set compatibility to Vim only
set nocompatible
" Helps force plug-ins to load correctly when it is turned back on below
filetype off
" Turn on syntax highlighting
syntax on
" For plug-ins to load correctly
filetype plugin indent on
" Disable the auto comment for all files
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Let status line always visible
set laststatus=2
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Fix backspace key
set backspace=indent,eol,start
" Colunm for text line limit
if exists("&colorcolumn")
    set colorcolumn=101
endif

" Vim-Plug installation
call plug#begin('~/.vim/plugged')
    " colorscheme
    Plug 'morhetz/gruvbox'
    " editor plugins
    Plug 'tmsvg/pear-tree'
    Plug 'adelarsq/vim-matchit'
    Plug 'tpope/vim-surround'
    Plug 'will133/vim-dirdiff', { 'on': 'DirDiff' }
    Plug 'vim-scripts/ShowTrailingWhitespace'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    " Linter
    Plug 'dense-analysis/ale'
    " IDE plugins
    Plug 'honza/vim-snippets'
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer' }
    " Go plugins
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    " git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " html/css plugins
    Plug 'ap/vim-css-color'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'groenewege/vim-less'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'
    Plug 'tomtom/tcomment_vim'
call plug#end()

" ---- Gruvbox theme config ----
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" Let colorscheme have a transparenty background
hi Normal ctermbg=NONE guibg=NONE

" ---- CSS Color ----
let g:cssColorVimDoNotMessMyUpdatetime=1

" ---- CSS3 Syntax, fix highlight for vertical-align, box-shadow and others ----
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" ---- Emmet vim - HTML/CSS ----
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ---- DirDiff configuration ----
let g:DirDiffExcludes = "*.class,*.o,*.pyc"

" ---- vim-airline ----
" Choose theme
let g:airline_powerline_theme = 'base16_gruvbox_dark_hard'
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Remove empty angle at the end
let g:airline_skip_empty_sections = 1
" Extension for tab line
let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Caches the changes to the highlighting groups
let g:airline_highlighting_cache = 1
" Short form text for mode map
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S-L',
    \ ''     : 'S-B',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V-L',
    \ ''     : 'V-B',
    \ }
" Display all buffers
let g:airline#extensions#tabline#enabled = 1

" Check for symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode symbol - Fixing wrong unicode character
let g:airline_symbols.colnr = "\u2105 :"

" Integrate ALE with vim-airline
let g:airline#extensions#ale#enabled = 1

"--------- HELPERS ---------
" Delete trailing white-space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
