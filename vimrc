"vim: set ft=vimrc:

"
" Settings required for Vundle
" Note: filetype on + filetype off is intentional, fixes vim exit status to 0
"
set nocompatible
filetype on
filetype off
filetype plugin on
filetype indent on

""
"" General settings
""
syntax on
set modelines=1
set ignorecase
set bg=dark

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab

"
" Fugitive mapping
"
"
map <leader>ge :Gedit<CR>
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog -- %<CR>
map <leader>gr Gread

" Git Tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>

"
" VIM plugins management with Vundle
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

"
" Load the plugins here
"
Bundle "SirVer/ultisnips"
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle "scrooloose/syntastic"
Bundle "Lokaltog/vim-easymotion"

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Clear the search history with enter-key
nnoremap <CR> :noh<CR><CR>

set laststatus=2
set statusline=%t\      "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
