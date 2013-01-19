" Colorscheme for vim
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
set statusline=%<%F%h%m%r%w\ %9(%{&ff}%)\ \|\ %Y%=%-17.(A=\%03.3b\ -\ 0x\%02.2B%)\ %-14.(%04l,%04v%)\ %P
" Let status line always visible 
set laststatus=2
" Active syntax
filetype plugin indent on
syntax on

filetype plugin on
" 
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" Supertab option for context aware completation
let g:SuperTabDefaultCompletionType = "context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
