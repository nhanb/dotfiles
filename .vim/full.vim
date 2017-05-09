" vim:fdm=marker

" File: full.vim
" Author: nhanb
" Description: Vundle plugins that require more work (external package,
" compiled library, etc.

" LanguageTool - somewhat ok grammar check {{{
" ================================================================
Bundle 'LanguageTool'

let g:languagetool_jar='$HOME/languagetool/dist/languagetool-commandline.jar'
"}}}
" YouCompleteMe - Awesome completion {{{
" ================================================================

Bundle 'Valloric/YouCompleteMe'

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" Don't ask every time
let g:ycm_confirm_extra_conf = 0
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_filetype_blacklist = {
            \ 'notes' : 1,
            \ 'text' : 1,
            \}

" Jump to definition, else declaration (YouCompleteMe stuff)
nnoremap <f3> :YcmCompleter<space>GoToDefinitionElseDeclaration<cr>
"}}}
