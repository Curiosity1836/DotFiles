"Cedric Mords' vimrc file.

set nocompatible

syntax on
filetype on
set number

"indenting
filetype indent on
set tabstop=3
set shiftwidth=3
set expandtab
set smartindent
set autoindent

"white space clean
autocmd BufWritePre * :%s/\s\+$//e

"highlight found words
set hlsearch
"show matching parenth
set showmatch
"vundle stuff
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/VUndle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'leafgarland/typescript-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vimwiki/vimwiki'
Plugin 'gabrielelana/vim-markdown'
Plugin 'aonemd/kuroi.vim'

call vundle#end()
filetype plugin indent on
"plugin Conf

set laststatus=2
set backspace=indent,eol,start
"let g:lightline={
"   'colorscheme' : 'wombat',
"    }

colorscheme kuroi "gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set encoding=UTF-8
map <C-o> :NERDTreeToggle<CR>
set omnifunc=syntaxcomplete#Complete
set showtabline=2
  let g:vimwiki_list = [{'path': '~/my_site/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]
hi Normal guibg=NONE ctermbg=NONE
set guifont = "System San Francisco Display 12"
highlight LineNr ctermfg=grey
map <F8> :w <CR> :!g++ *.cpp -o %< && ./%< <CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
