
syntax on
set runtimepath+=$HOME/.vim/
helptags ~/.vim/doc

call pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'gabesoft/vim-ags'
Plugin 'mindriot101/vim-yapf'
" Bundle 'myusuf3/numbers.vim'
"
call vundle#end()            " required
filetype plugin indent on    " required

" Set tabs to be 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" Display line numbers
set number
" Show relative numbers for lines
" set relativenumber
" Enable python syntax
" let python_highlight_all = 1
" Ignore pyc  and other files when using Command-T
set wildignore+=*.o,*.git,*.pyc,*.swp,.git,*.pyo
" Disable swap files
set noswapfile

" Set wrap and do not break words when breaking the line
set wrap
set linebreak

" Remove trailing whitespace on python files
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

if has("autocmd")
    " autocmd FileType python,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
    autocmd BufWritePre *.py,*.js,*.h,*.cpp :call <SID>StripTrailingWhitespaces()

    " Source the vimrc file after saving it
    "autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Highlight over 79 characters
":au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

"set my own color scheme
colo jaime

" Use the indent of plugin
set nosmartindent
if has('transparency')
    set transparency=3
    " Disable visual bell
    set vb
endif
" Map <Leader> Key to ,
let mapleader = ","
" Highlight searchs
set hlsearch

"Enable filetype to use pyflakes
filetype on
filetype plugin on
filetype indent on

" Remove swap files
set nobackup

" Set NERDTree to ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" Set options to minibuffexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Enable save on loose focus
au FocusLost * :wa

" Give a try to use correct movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Remap to go visual line to visual line, instead of file line to file line
nnoremap j gj
nnoremap k gk

" Remap move lines to cursors
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv
" Left and Right to cycle buffers
nnoremap <left> :bprevious<CR>
nnoremap <right> :bnext<CR>

" Remap to escape with control and letter 'l'
inoremap <c-l> <Esc>

" Map semicolon to colon to avoid hitting CAPS
" nnoremap ; :

" Enable syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                          \  'active_filetypes': [],
                          \  'passive_filetypes': [] }
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=1
" Deactivate cpp checker as it's not working properly
let g:loaded_syntastic_cpp_gcc_checker = 0
" let g:syntastic_quiet_warnings=1
let g:syntastic_python_flake8_args='--ignore=E122,E128,E121,E123,E127,N813,N801,N802,N803,N806,N814'
let g:syntastic_python_checkers = ['python', 'flake8']
" Signify options
let g:signify_vcs_list = [ 'git', 'hg' ]

" Ags options
let g:ags_agexe = '~/.vim/ag-bash.sh'
let g:ags_agexe = '/opt/local/bin/ag'
let g:syntastic_rst_checkers = ['proselint']
let g:syntastic_text_proselint_quiet_messages = {
    \ 'regex': [
    \   '\m^typography\.symbols\.ellipsis',
    \   '\m^typography\.symbols\.curly',
    \ ] }

set tags=~/mytags

" Set CTRP
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<leader>t'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l -p ~/.agignore --nocolor -g ""'
