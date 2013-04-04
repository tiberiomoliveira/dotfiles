colorscheme tibas
" Number of colors supported
set t_Co=256
" Set highlight search
set hlsearch
" Disable backup file
set nobackup
" Enable a column whit line number
set number

" Enable C style indenting 
set cindent
" Number of spaces to use for each spet of indent
set shiftwidth=2
" Number of spaces that a <Tab> in the file counts for
set tabstop=2
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Highlight cursor line
set cursorline

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

" C/C++ complete
" ctags for c++ complete
set tags+=~/.vim/tags
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
" Close popup menu when it is not visible
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Supertab option for context aware completation
let g:SuperTabDefaultCompletionType = "context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1
let g:clang_use_library=1
let g:clang_library_path = "/usr/lib"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Avoids lame path cache generation and other unknown sources for includes 
let g:clang_auto_user_options=''
let g:clang_user_options='-std=c++11 -stdlib=libc++'
let g:clang_memory_percent=70

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

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
let g:nerdtree_tabs_open_on_console_startup = 1
