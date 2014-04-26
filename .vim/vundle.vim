" vim:fdm=marker

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Straightforward stuff (no custom config) {{{
" ================================================================
Bundle 'shougo/vimproc'
Bundle 'shougo/vimshell'
Bundle 'beloglazov/vim-online-thesaurus'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'groenewege/vim-less'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-dispatch'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'closetag.vim'
Bundle 'mako.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'stephpy/vim-yaml'
Bundle 'gregsexton/MatchTag'
Bundle 'marijnh/tern_for_vim'
" }}}
" delimitMate - Auto bracket {{{
" ================================================================
Bundle 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
"}}}
" Fugitive - Ultimate git wrapper for vim {{{
" ================================================================
Bundle 'tpope/vim-fugitive'

nnoremap <leader>gg :Git<space>
nnoremap <leader>gm :Gmove<space>
nnoremap <leader>gcc :Gcommit<cr>
nnoremap <leader>gca :Git commit --amend<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>

" Stage current file
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gw :Gwrite<cr>

" Revert current file to last commit
nnoremap <leader>gr :Gread<cr>

" Open git log in a new buffer
nnoremap <leader>gll :Gtabedit! log<cr>
nnoremap <leader>glo :Gtabedit! log --pretty=oneline<cr>
nnoremap <leader>glg :Gtabedit! log --graph<cr>
nnoremap <leader>glp :Gtabedit! log -p<cr>

" Open git diff in a new buffer
nnoremap <leader>gff :Gtabedit! diff<cr>
nnoremap <leader>gfc :Gtabedit! diff --cached<cr>

" Map .. to going back when exploring git tree objects
autocmd User fugitive
            \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
            \   nnoremap <buffer> .. :edit %:h<CR> |
            \ endif

" Auto delete inactive fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
" Extradite - Requires fugitive - git history viewer {{{
" ================================================================
Bundle 'int3/vim-extradite'

" Extradite split size
let g:extradite_width = 84
" }}}
" UltiSnips - Code snippets {{{
" ================================================================
Bundle 'SirVer/ultisnips'

" Map snippet expand - Have to unmap these combinations first, since they're
" mapped to certain functionalities by vim's default
inoremap <c-j> <nop>
inoremap <c-k> <nop>
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
"let g:UltiSnipsListSnippets = '<c-m>'
" }}}
" Slimux - vim-tmux integration {{{
" ================================================================
Bundle 'epeli/slimux'

nnoremap <Leader>t :SlimuxREPLSendLine<CR>
vnoremap <Leader>t :SlimuxREPLSendSelection<CR>
nnoremap <Leader>sl :SlimuxShellLast<CR>
nnoremap <Leader>sp :SlimuxShellPrompt<CR>
" }}}
" CtrlP {{{
" ================================================================
Bundle 'kien/ctrlp.vim'

nnoremap <leader>o :CtrlPMixed<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
"}}}
" Tagbar {{{
" ================================================================
Bundle 'majutsushi/tagbar'

" F5 toggles tagbar
nnoremap <f5> :TagbarToggle<cr>
" }}}
" vim-indent-guides {{{
" ================================================================
Bundle 'nathanaelkane/vim-indent-guides'

" Indentation guidlines
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 4
"}}}
" NERDTree {{{
" ================================================================
Bundle 'scrooloose/nerdtree'

" Auto quit NERDTree if it's the only buffer left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Ignore irrelevant files in NERDTree
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']

nnoremap <leader>d <esc>:NERDTree<cr>
nnoremap <leader>e :NERDTreeToggle<cr>
" }}}
" Syntastic {{{
" ================================================================
Bundle 'scrooloose/syntastic'

let g:syntastic_python_checkers=['frosted']
let g:syntastic_javascript_checkers=['jslint']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5
" }}}
" vim-rooter - automatically chdir to project root {{{
" ================================================================
Bundle 'airblade/vim-rooter'

let g:rooter_change_directory_for_non_project_files = 1
" }}}
" Emmet-vim {{{
" ================================================================
Bundle 'mattn/emmet-vim'

inoremap <c-c> <nop>
let g:user_emmet_leader_key = '<c-c>'
" }}}
" vim-tmux-navigator - seamless tmux/vim split navigation {{{
" ================================================================
Bundle 'christoomey/vim-tmux-navigator'

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
" }}}
" Solarized colorscheme {{{
" ================================================================
Bundle 'altercation/vim-colors-solarized'

set background=dark
colorscheme solarized
hi Folded cterm=None ctermfg=166
hi CursorLineNr ctermfg=112 cterm=bold
hi SignColumn ctermbg=8
hi MatchParen ctermfg=123
"set t_Co=256
"let g:solarized_termcolors=256
" }}}

if $MYVIM == "full"
    so $HOME/.vim/full.vim
else
    " Vim Airline will do if you can't have powerline
    Bundle 'bling/vim-airline'
endif

filetype plugin indent on     " required!
