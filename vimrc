colorscheme tibas
set t_Co=256
set hlsearch
set nobackup
set number
set autoindent
set smartindent
set cursorline
set ls=2
syntax on

set shiftwidth=2
set tabstop=2
set expandtab

" Show highlighting groups for current word
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc
