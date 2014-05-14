"vim: set ft=vimrc:

" Detect Python files by filename, somehow Python charset definition
"	# -*- coding: UTF-8 -*-
" Causes Python files to be detected as "conf" files.
au BufNewFile,BufRead *.py set filetype=python

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
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle (required!)
Plugin 'gmarik/vundle'

"
" Load the plugins here
"
"

" Load UltiSnips and the snippets (these are separate repos)
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
" Easymotion seems not to work
" Plugin 'lokaltog/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Easymotion configuration
"
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"map  s <Plug>(easymotion-s)
"omap S <Plug>(easymotion-t)

" Jedi configuration
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "top"
autocmd FileType python setlocal completeopt-=preview

" End of Vundle configuration

" UltiSnips configuration
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Clear the search history with enter-key
nnoremap <CR> :noh<CR><CR>

" Statusline configuration
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

