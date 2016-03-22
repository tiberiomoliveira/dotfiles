colorscheme tibas
" Number of colors supported
set t_Co=256
" Set highlight search
set hlsearch
" Disable backup file
set nobackup
" Enable a column whit line number
set number

" Autoident files
set smartindent
" Number of spaces to use for each step of indent
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Highlight cursor line
set cursorline

" Disable the auto comment for all files
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set a fancy status line for VI
set statusline=%<%F%h%m%r%w\ %9(%{&ff}%)\ \|\ %Y%=%-18.(A=\%03.3b\ -\ 0x\%02.2B%)\ %-14.(%04l,%04v%)\ %P
" Let status line always visible 
set laststatus=2

" Enable Pathogen
filetype off
execute pathogen#infect()

" Enable syntax
syntax on
filetype plugin on
filetype plugin indent on

" Easytag plugin
let g:easytags_file = '~/.vim/tags'

" NERDTree
" Make NerdTree auto startup
autocmd VimEnter * NERDTree
" Make NerdTree startup even if it is not file open
autocmd VimEnter * if !argc() | NERDTree | endif
" Let file be the highlight window
autocmd VimEnter * wincmd w
" Close vim when the NerdTree is the last window opended
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_focus_on_files=1
