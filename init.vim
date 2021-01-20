syntax on

" turned off for plugin loading turned back on below
"filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tweekmonster/gofmt.vim'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
"Plug 'vuciv/vim-bujo'
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
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile

"search sets
set ignorecase
set smartcase
set incsearch

"paste from clipboard
set clipboard+=unnamedplus

"gitgutter suggested setting
if has ('win64')
   let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
   set undodir=C:/.vim/undodir
endif

"Themeing
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = '1'
"set background=dark
highlight Normal ctermbg=NONE

"basic configuration
set number relativenumber
set colorcolumn=80

"Bindings
"Leader 
let mapleader="\<Space>"
"buffers
map gn :bn<cr>
map gp :bp<cr>
map gc :bd<cr>
map gs :b
map gl :ls<cr>

"splits
set splitright
map <silent><nowait><leader>vs :vs<cr>
map <silent><nowait><leader>vsb :vert belowright sb

"line numbers
nnoremap <silent> <F3> :exec &nu==&rnu "se nu!" : "se rnu!" <CR>

"fzf
let g:fzf_layout = { 'window': {'width' : 0.8, 'height' : 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
"fzf git checkout
nnoremap <leader>gc :GBranches<CR>
"Open File
nnoremap <leader>gf :Files<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"Exit input mode in terminal
tnoremap <Esc> <C-\><C-n>
"split terminal
map <silent><nowait><leader>vt :vs <cr>:terminal <cr>
