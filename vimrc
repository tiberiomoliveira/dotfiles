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


" Start pathogen
filetype off
execute pathogen#infect()
filetype plugin indent on
" Active syntax
syntax on

filetype plugin on
set tags+=~/.vim/tags

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

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
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1
