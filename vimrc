"vim: set ft=vimrc:

set nocompatible " Required for Vundle
filetype off	" Required for Vundle

filetype plugin on
filetype indent on

"
" General settings
"
syntax on
set modelines=1
set ignorecase
set bg=dark


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
Bundle 'tpope/vim-fugitive'


filetype plugin indent on     " Required for Vundle

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
