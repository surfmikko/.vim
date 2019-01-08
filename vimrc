"vim: set ft=vimrc:

" Detect Python files by filename, somehow Python charset definition
"	# -*- coding: UTF-8 -*-
" Causes Python files to be detected as "conf" files.
"
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
set bg=dark

" Search case insensitive
set ignorecase

" Default indent 4, only spaces, never tabs
setlocal tabstop=4
setlocal softtabstop=0 noexpandtab
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab


"
" Experimental leader mappins
"

let mapleader="\<Space>"

set showcmd

" Escape insert mode with jj
imap jj <esc>

" CtrlP open search window
nnoremap <Leader>o :CtrlP<CR>

" Save file
nnoremap <Leader>w :w<CR>

" Copy and paste system clipboard for MacVim
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


"
" Quick fix list
"
"
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprev<CR>

"
" Fugitive mapping
"
"
noremap <leader>ge :Gedit<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gread <CR>
noremap <leader>gl :Glog -- %<CR>

" Git Tabs
nnoremap th  :tabfirst<cr>
nnoremap tj  :tabnext<cr>
nnoremap tk  :tabprev<cr>
nnoremap tl  :tablast<cr>
nnoremap tt  :tabedit<space>
nnoremap tn  :tabnext<space>
nnoremap tm  :tabm<space>
nnoremap td  :tabclose<cr>

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

" Fuzzy file search
Plugin 'kien/ctrlp.vim'

" Textmate-like snippets; engine and snippets are separate repos
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" Git integration
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

" Syntax checking for several languages

if v:version < 800
	Plugin 'scrooloose/syntastic'
else
	Plugin 'w0rp/ale'
endif

" Python autocompletion and refactoring
Plugin 'davidhalter/jedi-vim'

" Calculate sum, avg, min, max
" Plugin 'nixon/vim-vmath'

" Move selected text around; some dependencies
" Plugin 'vim-scripts/Align'
" Plugin 'clones/vim-cecutil'
" Plugin 'vim-scripts/vis'
" Plugin 'atweiden/vim-dragvisuals'

" Ansible YAML support
Plugin 'pearofducks/ansible-vim'

" Ctrl+q Ctrl+l for quick/location lists
Plugin 'milkypostman/vim-togglelist'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Ctrlp configuration
set wildignore+=*.pyc,**/.git/*,venv/*,.venv/*,*/build/lib/*,**/tmp/*,*.so,*.swp,*.zip,**/bower_components/*,**/node_modules/*
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -co |& egrep -v "\.(png|jpg|jpeg|gif)$|node_modules"']


" DragVisuals configuration
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

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
set statusline+=%{fugitive#statusline()} " Git branch
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" VMath configuration
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

let g:airline_extensions = ['ale', 'branch']

" Use gg=G to indent XML-files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Syntastic configuration
if exists("g:_SYNTASTIC_VERSION")

	" Toggle error list with <ctrl>e

	function! ToggleErrors()
		let old_last_winnr = winnr('$')
		lclose
		if old_last_winnr == winnr('$')
			" Nothing was closed, open syntastic error location panel
			Errors
		endif
	endfunction
	nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

	" Automatically populate quickfix list
	"
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1

endif
