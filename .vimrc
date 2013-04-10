" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

if has('gui_running')
    "set guifont=Monospace\ 12
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 14
    set background=dark
    colorscheme solarized
else
    set t_Co=256
    set background=dark
    "colorscheme calmar256-dark
    "let g:solarized_termcolors=256
    "let g:solarized_termtrans=1
    colorscheme solarized
endif

" Required for pathogen, will be turned on after #infect
filetype off
" git clone http://github.com/gmarik/vundle.git ~/.vim/vundle.git
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundles:
" Bundle "git://github.com/tpope/vim-surround.git"
" Bundle "git://github.com/tpope/vim-repeat.git"
" Bundle "git://github.com/tomtom/checksyntax_vim.git"
call pathogen#infect()

filetype plugin indent on

set fileencodings=utf-8,cp1251,latin1
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"Установка доп раскладки
set keymap=russian-jcukenwin
"Раскладка по умолчанию основная (eng)
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0

set laststatus=2
let g:Powerline_symbols = 'fancy'

set noerrorbells
set visualbell
set t_vb=
set mouse=a
set tabstop=4
set expandtab
set noautoindent smartindent
set shiftwidth=4
set shiftround
set nojoinspaces
set number
set showmode
set showcmd " Display an incomplete command in the lower right corner of the Vim window

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't update the display while executing macros (perfomance booster)
set lazyredraw

" Persistent undo
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undodir
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

set title
set wildmenu
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""

"Note <leader> is the user modifier key (like g is the vim modifier key)
"One can change it from the default of \ using: let mapleader = ","

"\n to turn off search highlighting
nmap <silent> <leader>n :silent :nohlsearch<CR>
"\l to toggle visible whitespace
nmap <silent> <leader>l :set list!<CR>
"Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>
"This is necessary to allow pasting from outside vim. It turns off auto stuff.
"You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
"Command alias W -> w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

"Taglist window toggle
map <silent><F5> :TlistToggle<CR>
imap <silent><F5> <ESC>:TlistToggle<CR>i

" Open a new tab and invoke FufFile in it
nnoremap <silent> <C-W>t :tabnew<CR>:FufFile<CR>

" toggle between terminal and vim mouse
map <silent><F12> :let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>
imap <silent><F12> <ESC>:let &mouse=(&mouse == "a"?"":"a")<CR>:call ShowMouseMode()<CR>i
function ShowMouseMode()
    if (&mouse == 'a')
        echo "mouse-vim"
        set number
    else
        echo "mouse-xterm"
        set nonumber
    endif
endfunction

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

"don't move the cursor after pasting
"(by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[

"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function Home()
    let curcol = wincol()
    normal ^
    let newcol = wincol()
    if newcol == curcol
        normal 0
    endif
endfunction

"<end> goes to end of screen before end of line
imap <kend> <end>
nmap <kend> <end>
inoremap <silent> <end> <C-O>:call End()<CR>
nnoremap <silent> <end> :call End()<CR>
function End()
    let curcol = wincol()
    normal g$
    let newcol = wincol()
    if newcol == curcol
        normal $
    endif
    "The following is to work around issue for insert mode only.
    "normal g$ doesn't go to pos after last char when appropriate.
    "More details and patch here:
    "http://www.pixelbeat.org/patches/vim-7.0023-eol.diff
    if virtcol(".") == virtcol("$") - 1
        normal $
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""

if v:version >= 700 && has("gui_running")
    "The following are a bit slow
    "for me to enable by default
    set cursorline   "highlight current line
    "set cursorcolumn "highlight current column
endif

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

hi LineNr ctermfg=grey

""""""""""""""""""""""""""""""""""""""""""""""""
" PHP specific
""""""""""""""""""""""""""""""""""""""""""""""""

let PHP_removeCRwhenUnix = 1
autocmd BufNewFile,Bufread *.php set runtimepath+=~/.vim/php-documentation

" Use K for description of funtion under cursor
autocmd BufNewFile,Bufread *.php set keywordprg="help"
"autocmd BufNewFile,Bufread *.php setlocal keywordprg=$HOME/.vim/external/phpmanual.sh

"autocmd BufNewFile,Bufread *.php setlocal dictionary+=~/.vim/dic/phpproto
"autocmd BufNewFile,Bufread *.php setlocal dictionary+=~/.vim/dic/phpfunclist
"autocmd BufNewFile,Bufread *.php setlocal dictionary+=~/.vim/dic/funclist.txt

autocmd BufNewFile,Bufread *.php let php_sql_query=1
autocmd BufNewFile,Bufread *.php let php_htmlInStrings=1

au FileType php set omnifunc=phpcomplete#CompletePHP
" Always open NERDTree
" au FileType php autocmd VimEnter * NERDTree
" au FileType php autocmd VimEnter * wincmd p

""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific
""""""""""""""""""""""""""""""""""""""""""""""""

" Alt-/  or Alt-? (lucky mode)
au BufNewFile,Bufread *.py let ropevim_vim_completion=1
au BufNewFile,Bufread *.py let ropevim_vim_completion=1
let g:syntastic_python_checker_args='--ignore=E501'
let g:pymode_lint_ignore = "E501,E127,E128"
autocmd FileType python set nosmartindent

""""""""""""""""""""""""""""""""""""""""""""""""
" Omni complete
""""""""""""""""""""""""""""""""""""""""""""""""

"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
set completeopt=menu,longest,preview

" Change the behavior of the <Enter> key when the popup menu is visible.
" In that case the Enter key will simply select the highlighted menu item, just as <C-Y> does.
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:SuperTabDefaultCompletionType = "context"

autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-x><c-p>") |
\ endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" taglist plugin parameter
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1

" FuzzyFinder options
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem = 400
let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'



" Sudo write
" comm! W exec 'w !sudo tee % > /dev/null' | e!


