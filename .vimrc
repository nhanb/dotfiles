" vim:fdm=marker
set nocompatible               " be iMproved
set nomodeline

syntax on

au BufNewFile,BufRead *.zsh-theme set filetype=zsh
au BufNewFile,BufRead *.mak set filetype=mako
au BufNewFile,BufRead *.md set filetype=markdown

" % on steroid
runtime macros/matchit.vim

set encoding=utf-8
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set guifont=Meslo\ LG\ S\ for\ Powerline\ 10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"" closes the scratch (tip) buffer when cursor moves in insert mode
"autocmd! CursorMovedI * if pumvisible() == 0|pclose|endif
" closes the scratch (tip) and locationlist buffer when leave insert mode
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif

" Let horizontal splits minimize
set winminheight=0

"set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set tabstop=4 expandtab softtabstop=4
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=7777         " remember more commands and search history
set undolevels=7777      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set noerrorbells         " don't beep
set colorcolumn=80       " 80-character indicator line

" Keep temporary files in mybackupdir
let mybackupdir=$HOME.'/.vim_backup'
if !isdirectory(mybackupdir)
    " Create directory if not available
    call mkdir(mybackupdir, "p")
endif
let &backupdir=mybackupdir
let &directory=mybackupdir

" Easier block indenting (does not exit visual mode after one shift)
vnoremap < <gv
vnoremap > >gv

" Auto reload file on change
set autoread

" Set relative line numbers but active line has absolute number
set number
set relativenumber


" ================================================================
" HERE COME KEYBINDINGS
" ================================================================

" Change the leader key from \ to ,
let mapleader=","
noremap \ <nop>

" ---- Esc alternatives ----
inoremap jj <esc>
" Save, stay in normal mode
inoremap jk <esc>:w<cr>l
" Save, stay in insert mode
inoremap jh <esc>:w<cr>a

" F2 clears search highlight & search message
nnoremap <silent> <f2> :silent noh<cr>:echo<cr>
nnoremap <silent> <f1> :silent noh<cr>:echo<cr>

"" F3 toggles paste mode
set pastetoggle=<F10>

" F7 Clean ^M characters from Windows files
nnoremap <f7> :%s/<c-v><c-m>//g<cr>

" Tidy up with html5-tidy
nnoremap <f8> :%!tidy<space>-q<space>-i<space>--show-errors<space>0<cr>

" Up Down Left Right to adjust current split size
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Write file with sudo permission
nnoremap <leader>wf :w<space>!sudo<space>tee<space>%<cr>

" Moving around splits using Ctrl+h/j/k/l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" C-w is super difficult to press, so make it <leader>w
nmap <leader>w <c-w>

" Moving around tabs using <leader>n/m
nnoremap <leader>n <esc>:tabprevious<cr>
nnoremap <leader>m <esc>:tabnext<cr>

" Change working dir to the current file's dir
nnoremap <leader>h :cd<space>%:p:h<cr>:pwd<cr>

" Visually select a piece of text then press ~ to change its case. There are
" three types: all lowercase, ALL UPPERCASE, First Letters Uppercase.
function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

" Open oh-my-zsh nhanb theme
nnoremap <leader>zt :e<space>~/dotfiles/oh-my-zsh-custom/nhanb.zsh-theme<cr>

" Open .zshrc
nnoremap <leader>zr :e<space>~/.zshrc<cr>

" Moving up/down 1 row instead of 1 line (fix wrap issue)
nnoremap j gj
nnoremap k gk

" Saner new split position
set splitbelow
set splitright

" Easier splitting
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>

" Quickly insert current date time
:iab <expr> dts strftime("%Y-%m-%d %H:%M")

" Save with 1 keystroke (why have I never thought about this?)
inoremap <f9> <nop>
inoremap <f9> <esc>:w<cr>
nnoremap <f9> <esc>:w<cr>
vnoremap <f9> <esc>:w<cr>
inoremap <c-f9> <nop>
inoremap <c-f9> <esc>:wq<cr>
nnoremap <c-f9> <esc>:wq<cr>
vnoremap <c-f9> <esc>:wq<cr>

" Format json
nnoremap <leader>j :%!python -m json.tool<cr>
vnoremap <leader>j !python -m json.tool<cr>

" Search visually selected text
vnoremap // y/<c-r>"<cr>"

" Convenient saving without leaving home row
" http://reefpoints.dockyard.com/2013/09/11/vim-staying-on-home-row-via-map.html
inoremap ;d <esc>:w<cr>
inoremap ;s <c-o>:w<cr>

" Run, Forrest, Run!
nnoremap <leader>q :!chmod +x %<cr><cr>:echo 'File is now executable'<cr>

" Space to center cursor vertically
" (yeah, zz is an abomination to ergo-minded people... or at least me)
nnoremap <space> zz
nnoremap <leader><space> zt

" Close quickfix
nnoremap <leader>x :cclose<cr>

" Remap Y to 'yank till end of line' to make it consistent with C, D
map Y y$

" Use '+' register or xsel to do system clipboard stuff {{{
if has('clipboard')
    vnoremap <leader>y "+y
                \:echo 'Selection yanked to system clipboard'<cr>
    nnoremap <leader>y "+yy
                \:echo '1 line yanked to system clipboard'<cr>
    nnoremap <leader>p "+p
elseif executable('xsel')
    vnoremap <leader>y :w !xsel -i -b<cr><cr>
                \:echo 'Selection yanked to system clipboard'<cr>
    nnoremap <leader>y V:w !xsel -i -b<cr><cr>
                \:echo '1 line yanked to system clipboard'<cr>
    nnoremap <leader>p :silent :r !xsel -o -b<cr>
else
    function! NoClipboardWarning()
        echohl WarningMsg
        echo 'Cannnot use system clipboard. Install `xsel` or recompile vim'.
                    \' with "+clipboard" to solve this.'
        echohl None
    endfunction
    vnoremap <leader>y :call NoClipboardWarning()<cr>
    nnoremap <leader>y :call NoClipboardWarning()<cr>
    nnoremap <leader>p :call NoClipboardWarning()<cr>
endif
"}}}

" Only use plugins if envar $MYVIM has been set
if !empty($MYVIM)
    so $HOME/.vim/vundle.vim
else
    colorscheme wombat
    filetype plugin indent on
endif


" ==========================================================================
" More instantly better vim
" http://programming.oreilly.com/2013/10/more-instantly-better-vim.html
" ==========================================================================

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" The Silver Searcher - snippet snatched from Thoughtbot
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<space>
  nnoremap <leader>ge :Ag<space>
endif
