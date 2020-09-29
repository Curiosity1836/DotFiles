syntax on

" turned off for plugin loading turned back on below
"filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tweekmonster/gofmt.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'

call plug#end()

"Basic sets
set noerrorbells
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=C:/.vim/undodir
set undofile
set incsearch

"paste from clipboard
set clipboard+=unnamedplus

"gitgutter suggested setting
if has ('win64')
   let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
endif

"Themeing
colorscheme gruvbox
"set background=dark
let g:gruvbox_contrast_dark = 'hard'
"basic configuration
set relativenumber
set colorcolumn=80

"Bindings
"buffers
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
map gs :b

"line numbers
nnoremap <silent> <F3> :exec &nu==&rnu "se nu!" : "se rnu!" <CR>

"fzf

