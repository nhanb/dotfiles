setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=119
setlocal smarttab
setlocal expandtab

augroup syntax_highlight_from_start
    autocmd!
    autocmd BufEnter *.py :syntax sync fromstart
augroup end
