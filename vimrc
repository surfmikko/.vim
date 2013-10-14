"vim: set ft=vimrc:

"
" Settings required for Vundle
"
set nocompatible
filetype off
filetype plugin on
filetype indent on

"
" General settings
"
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
Bundle "scrooloose/syntastic"
Bundle 'Lokaltog/vim-easymotion'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
