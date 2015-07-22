" vim:fdm=marker

filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Straightforward stuff (no custom config) {{{
" ================================================================
Bundle 'beloglazov/vim-online-thesaurus'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'closetag.vim'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'pangloss/vim-javascript'
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'Z1MM32M4N/vim-superman'
Bundle 'lilydjwg/fcitx.vim'
Bundle 'wlangstroth/vim-racket'
Bundle 'honza/vim-snippets'
" }}}

" Vim JSX {{{
" ================================================================
Bundle 'mxw/vim-jsx'

let g:jsx_ext_required = 0
" }}}

" Rainbow parentheses {{{
" ================================================================
Bundle 'kien/rainbow_parentheses.vim'

autocmd FileType racket :RainbowParenthesesToggle
autocmd FileType racket :RainbowParenthesesLoadRound
autocmd FileType racket :RainbowParenthesesLoadSquare
autocmd FileType racket :RainbowParenthesesLoadBraces
" }}}
" MatchTagAlways - Highlight HTML tags {{{
" ================================================================
Bundle 'Valloric/MatchTagAlways'

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'mako' : 1,
    \}
"}}}
" vim-dispatch by tpope {{{
" ================================================================
Bundle 'tpope/vim-dispatch'

nnoremap <f6> :w<cr>:Dispatch! make<cr>
inoremap <f6> <esc>:w<cr>:Dispatch! make<cr>
vnoremap <f6> <esc>:w<cr>:Dispatch! make<cr>
"}}}
" vim-markdown by tpope {{{
" ================================================================
Bundle 'tpope/vim-markdown'

" Syntax highlighting for fenced code blocks. Neat eh?
let g:markdown_fenced_languages = ['javascript', 'js=javascript',
            \'json=javascript', 'python', 'bash=sh', 'zsh=sh']
"}}}
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
nnoremap <leader>gd :Gvdiff<cr>
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

" Grep
nnoremap <leader>ge :Gtabedit! grep 

" Open current file in master
nnoremap <leader>got :Gtabedit master:%<cr>
nnoremap <leader>gos :Gsplit master:%<cr>
nnoremap <leader>gov :Gvsplit master:%<cr>

" Less intrusive push/pull - requires vim-dispatch plugin
nnoremap <leader>gps :Dispatch git push<cr>
nnoremap <leader>gpl :Dispatch git pull<cr>

" Map .. to going back when exploring git tree objects
autocmd User fugitive
            \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
            \   nnoremap <buffer> .. :edit %:h<CR> |
            \ endif

" Auto delete inactive fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}
" Gitv - Requires fugitive - "command line gitk" {{{
" ================================================================
Plugin 'gregsexton/gitv'

" Their default <c-whatever> keybindings clash with mine => disable them
let g:Gitv_DoNotMapCtrlKey = 1

nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
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
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
            \'\.so$', '\.egg$', '^\.git$', '\.gem$',  '\.rbc$', '\~$',
            \ '^__pycache__$']

nnoremap <leader>d <esc>:NERDTree<cr>
nnoremap <leader>e :NERDTreeToggle<cr>
" }}}
" Syntastic {{{
" ================================================================
Bundle 'scrooloose/syntastic'


let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "active_filetypes": [],
      \ "passive_filetypes": ["rst"] }

let g:syntastic_python_checkers=['flake8']

" We're actually using syntastic-react here
" https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers=['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5
" }}}
" vim-rooter - automatically chdir to project root {{{
" ================================================================
Bundle 'airblade/vim-rooter'

let g:rooter_change_directory_for_non_project_files = 1
let g:rooter_silent_chdir = 1

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
" localvimrc - Project-specific vimrc {{{
" ================================================================
Bundle 'embear/vim-localvimrc'

" Store and restore decisions only if answer was in upper case (Y/N/A).
let g:localvimrc_persistent = 1
" }}}
" Enhanced diff - allows switching to Patience diff algo {{{
" ================================================================
Bundle 'chrisbra/vim-diff-enhanced'
" }}}
" Solarized colorscheme {{{
" ================================================================
Bundle 'altercation/vim-colors-solarized'

set background=dark
set t_Co=16
let g:solarized_termcolors=16
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
    " Vim-gitgutter - Provides modified git info for airline {{{
    " ================================================================
    Bundle 'airblade/vim-gitgutter'

    " I just want airline integration, not gutter symbols => disable them
    let g:gitgutter_signs = 0
    " }}}
    " Airline {{{
    " ================================================================
    Bundle 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline_theme='powerlineish'

    " Fix slow mode switch issue
    if ! has('gui_running')
        set ttimeoutlen=10
    endif

    " I don't really need section y (encoding type and shit), so truncate it
    " at width 100.
    let g:airline#extensions#default#section_truncate_width = {
                \ 'b': 79,
                \ 'x': 60,
                \ 'y': 100,
                \ 'z': 45,
                \ }

    " Removed the tagbar message. It's rarely useful but often obscures the
    " file name (which is obviously more important)
    let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),0)}'

    let g:airline#extensions#hunks#non_zero_only = 1
    "}}}
endif

filetype plugin indent on     " required!
