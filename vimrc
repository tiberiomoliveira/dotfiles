" My own theme
colorscheme tibas
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
" Enable the line number column
set number
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
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Be smart when using tabs
set smarttab
" Highlight cursor line
set cursorline

" Ignore files with following extentions:
set wildignore+=*.d,*.so,*.a,*.o,*.DEP,*.swp,*.zip

if exists("&colorcolumn")
    set colorcolumn=81
endif

" Enable syntax highlighting
syntax on

" Disable the auto comment for all files
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set a fancy status line for VI
set statusline=   " Clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset"
" Let status line always visible 
"set laststatus=2

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Regular " Install Powerline/fonts from git
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Vim-Plug installation
call plug#begin('~/.vim/plugged')
    " editor plugins
    Plug 'jiangmiao/auto-pairs'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'vim-airline/vim-airline'
    " C/C++ plugins
    Plug 'vim-syntastic/syntastic'
    Plug 'myint/syntastic-extras'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
    Plug 'majutsushi/tagbar'
    " git plugins
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " html/css plugins
    Plug 'ap/vim-css-color'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'groenewege/vim-less'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'
    Plug 'tomtom/tcomment_vim'
call plug#end()

filetype plugin on
filetype plugin indent on

" Easytag plugin
let g:easytags_file = '~/.vim/tags'

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic-extras configuration
let g:syntastic_c_checkers = ['check']
let g:syntastic_cpp_checkers = ['check']
let g:syntastic_make_checkers = ['gnumake']
let g:syntastic_javascript_checkers = ['json_tool']
let g:syntastic_json_checkers = ['json_tool']
let g:syntastic_python_checkers = ['pyflakes_with_warnings']
let g:syntastic_gitcommit_checkers = ['language_check']
let g:syntastic_svn_checkers = ['language_check']

" NERDTree
" Open NerdTree on vim startup even if it is not file open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NerdTree on vim startup even if it is opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Let file be the highlight window
autocmd VimEnter * wincmd w
" Close vim when the NerdTree is the last window opended
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1

" Airline configuration
set noshowmode " Do not show default mode indicator
let g:PowerLine_symbols = 'unicode'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline unicode symbols - you need to install fonts-powerline package
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" Airline extension configuration
let g:airline#extensions#hunks#enabled  = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_z = airline#section#create_right(['%p%%','%l/%L:%c'])

" NerdTree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }

" Css Color
let g:cssColorVimDoNotMessMyUpdatetime=1

" Css3 Syntax, fix highlight for vertical-aligh, box-shadow and others
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" Emmet vim - HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"--------- HELPERS ---------
"  Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

