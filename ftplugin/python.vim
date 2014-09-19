setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab

setlocal backspace=indent,eol,start

" Highlight long lines
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

" Highlight tabs in beginning of line
highlight ExtraWhiteSpace ctermbg=darkred ctermfg=white guibg=#592929
match ExtraWhiteSpace /\s\+$/

let g:syntastic_python_checkers=['pep8', 'pylint']
