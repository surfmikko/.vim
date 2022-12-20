"vim: set ft=vimrc:

""
"" General settings
""

set nocompatible
syntax on
filetype plugin indent on

set modelines=1
set bg=dark
set showcmd
set ignorecase
set cmdheight=1

" Default indent 4, only spaces, never tabs
setlocal tabstop=4
setlocal softtabstop=4 expandtab
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab

" Experimental leader mapping
let mapleader="\<Space>"

" Open help / cheatsheet
nnoremap <leader>hh :h cheatsheet<CR>

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

" Location list navigation (syntax check)
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

" Quickfix list navigation (Ggr / grep)
nnoremap <C-l> :cnext<CR>
nnoremap <C-h> :cprev<CR>

" Fugitive mapping
noremap <leader>ge :Gedit<CR>
noremap <leader>gg :Git<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gd :Git diff<CR>
noremap <leader>gb :Git blame<CR>
noremap <leader>gr :Gread <CR>
noremap <leader>gl :Git log -- %<CR>

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
" Install Plugins
"

call plug#begin('~/.vim/bundle')

" Fuzzy file search
Plug 'kien/ctrlp.vim'

" Textmate-like snippets; engine and snippets are separate repos
if has('python3')
    Plug 'sirver/ultisnips'
else
    " This is the last version which supports Python2
    Plug 'sirver/ultisnips', {'tag': '3.2'}
endif

Plug 'honza/vim-snippets'

" Git integration
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Syntax checking for several languages
Plug 'dense-analysis/ale'

" Python autocompletion and refactoring
Plug 'davidhalter/jedi-vim'

" Ansible YAML support
Plug 'pearofducks/ansible-vim'

" <leader>q <leader>l for quick/location lists
Plug 'milkypostman/vim-togglelist'

" Commenting and uncommenting lines
Plug 'scrooloose/nerdcommenter'

" PlantUML integration
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

call plug#end()

" Ctrlp configuration
set wildignore+=*.pyc,**/.git/*,venv/*,.venv/*,*/build/lib/*,**/tmp/*,*.so,*.swp,*.zip,**/bower_components/*,**/node_modules/*
let g:ctrlp_map = '<c-p>'

" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -co |& egrep -v "\.(png|jpg|jpeg|gif)$|node_modules"']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -co | egrep -v "\.(png|jpg|jpeg|gif)$|node_modules"']

" Jedi configuration
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "top"
autocmd FileType python setlocal completeopt-=preview

" Nerdcommenter - Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']


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
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Use gg=G to indent XML-files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Use :Ggr to open grep results in quick-fix list
:command! -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" Tell Vim automatically if pasting text
if &term =~ "xterm.*"
	let &t_ti = &t_ti . "\e[?2004h"
	let &t_te = "\e[?2004l" . &t_te
	function! XTermPasteBegin(ret)
		set pastetoggle=<Esc>[201~
		set paste
		return a:ret
	endfunction
	map <expr> <Esc>[200~ XTermPasteBegin("i")
	imap <expr> <Esc>[200~ XTermPasteBegin("")
	vmap <expr> <Esc>[200~ XTermPasteBegin("c")
	cmap <Esc>[200~ <nop>
	cmap <Esc>[201~ <nop>
endif


" Detect Python files by filename
au BufNewFile,BufRead *.py set filetype=python

" PlantUML configuration
let g:plantuml_previewer#plantuml_jar_path=$HOME.'/scratch/plantuml/plantuml.jar'
