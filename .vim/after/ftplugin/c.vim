" Disable auto comment for //
setlocal comments-=://
setlocal comments+=f://

" Compile and run current file
nnoremap <buffer> <C-F6> :w<CR>:cd<space>%:p:h<cr>:pwd<cr>:!gcc<Space>-Wall<Space>-ansi<Space>-pedantic<Space>%<Space>-o<Space>%:r<Space>&&<Space>./%:r<CR>

" Compile all *.c files in current dir then run the compiled a.out
nnoremap <buffer> <F6> :w<CR>:cd<space>%:p:h<cr>:pwd<cr>:!gcc<Space>-Wall<Space>-ansi<Space>-pedantic<Space>*.c<Space>&&<Space>./a.out<CR>

" Ask user which files to compile (separated by spaces)
nnoremap <buffer> <F5> :w<CR>:cd<space>%:p:h<cr>:pwd<cr>:call NhanbCompileSpecific()<CR>
function! NhanbCompileSpecific()
    call inputsave()
    let cfiles = input("Which files: ")
    call inputrestore()
    execute '!gcc -Wall -ansi -pedantic ' . cfiles . ' && ./a.out'
    return 0
endfunction
