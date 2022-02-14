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
" Be smart when using tabs
set smarttab
" Highlight cursor line
set cursorline

" Ignore files with following extentions:
set wildignore+=*.d,*.so,*.a,*.o,*.DEP,*.swp,*.zip

" Colunm for text line limit
if exists("&colorcolumn")
    set colorcolumn=81
endif

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

" Set a fancy status line for VI/VIM
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=   " Clear the statusline for when vimrc is reloaded
set statusline+=%{StatuslineGit()}           " branch name
set statusline+=-\ %f                        " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset"
" Let status line always visible
set laststatus=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Vim-Plug installation
call plug#begin('~/.vim/plugged')
    " colorscheme
    Plug 'morhetz/gruvbox'
    " editor plugins
    Plug 'jiangmiao/auto-pairs'
    Plug 'adelarsq/vim-matchit'
    Plug 'tpope/vim-surround'
    Plug 'will133/vim-dirdiff'
    Plug 'vim-scripts/ShowTrailingWhitespace'
    " C/C++ plugins
    Plug 'vim-syntastic/syntastic'
    Plug 'myint/syntastic-extras'
    Plug 'xolox/vim-easytags'
    Plug 'xolox/vim-misc'
    Plug 'majutsushi/tagbar'
    " Go plugins
    Plug 'fatih/vim-go'
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

" Set a good colorscheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Gruvbox theme config
set background=dark

" Let colorscheme have a transparenty background
hi Normal ctermbg=NONE guibg=NONE

" Fix backspace key
set backspace=indent,eol,start

" Easytag plugin
let g:easytags_file = '~/.vim/tags'

" Tagbar from Exuberant Ctags
nmap <F8> :TagbarToggle<CR>

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

" CSS Color
let g:cssColorVimDoNotMessMyUpdatetime=1

" CSS3 Syntax, fix highlight for vertical-aligh, box-shadow and others
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" Emmet vim - HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" DirDiff configuration
let g:DirDiffExcludes = "*.class,*.o,*.pyc"

"--------- HELPERS ---------
" Delete trailing whitespace on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
