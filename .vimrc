"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'haya14busa/incsearch.vim'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'drmingdrmer/vim-syntax-markdown'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-misc'     " needed for vim-session
Plugin 'epeli/slimux'
Plugin 'ajh17/VimCompletesMe'  "use TAB for competiion
Plugin 'rbgrouleff/bclose.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'vim-scripts/MatlabFilesEdition'  " Proper MATLAB syntax highlighting
" Plugin 'vim-scripts/VOoM'
" Plugin 'hdima/python-syntax'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mindriot101/vim-yapf'
Plugin 'christoomey/vim-tmux-navigator'
"
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Indent Stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yapf stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>y :call Yapf()<cr>


"nnoremap <leader>gq :%!pandoc expand('%') -o epxand('%:r').pdf -V geometry:margin=1in --variable urlcolor=cyan --number-sections<CR>
nnoremap <leader>gq :w! <bar> :exec "!pandoc %<.md -o %<.pdf -V geometry:margin=1in --variable urlcolor=cyan --number-sections"<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Markdown stuff 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_math = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore files in NERDTree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.aux$','\.dvi$','\.acr$','\.acn$','\.acl$','\.out$','\.synctex.gz$']
let NERDTreeHijackNetrw=1  " allow nerdtree to open in current window ( e .)
"let g:NERDTreeWinPos = "right"
let g:NERDTreeWinPos = "left"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Vim-Airline Options (buffers)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

 " " Powerline stuff (replacing airline)
 " source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
 " set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"       From https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell check 
set spelllang=en
set spell
" Sets how many lines of history VIM has to remember
set history=700
" Enable filetype plugins
filetype plugin on
filetype indent on
" Change Leader to ,
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
" Backup files
set backupdir=~/.backup,.,/tmp
set directory=~/.backup,.,/tmp

" Don't lose undo history when switching back/forth between buffers
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compatibility 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove ^M from Windows formatted files
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder (fzf) shortcuts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <leader>f   :Files<cr>      " current directory fuzzy finder
map     <leader>F   :Files ~/<cr>   " global dir fuzzy finder

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular Shortcuts (code alignment) 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Align on = sign
map     <leader>=   :Tabularize /=<cr>
map     <leader>&   :Tabularize /&<cr>
map     <leader>%   :Tabularize /%<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slimux Stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <Leader>s   :SlimuxREPLSendLine<CR>
vmap    <Leader>s   :SlimuxREPLSendSelection<CR>
map     <Leader>rl  :w! <bar> :SlimuxShellLast<CR>
map     <Leader>rp  :w! <bar> :SlimuxShellPrompt<CR>
"map     <Leader>k   :SlimuxSendKeysLast<CR>
"map     <Leader>l   :SlimuxREPLSendBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=0
" Turn on the WiLd menu
set wildmenu
set wildmode=longest:list,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif
"Always show current position
set ruler
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" Makes search act like search in modern browsers
set incsearch 
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set visualbell t_vb=
" Relative line numbers
set relativenumber
" Make current line different color
set cursorline
" Yank to system clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
" Disable background color clearing (helps with tmux)
set t_ut=
"set background=light
set background=dark
try
    colorscheme solarized
catch
    colorscheme desert
endtry
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

let python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on `textwidth`-number of characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Window related stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More natural commands for opening new split windows
set splitbelow
set splitright

" Easier window navigation (just CTRL + direction)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap - <C-W><C-_>
nnoremap + <C-W><C-=>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" buffer switching like a pro
nmap <leader>bb  :enew<cr>      " new blank buffer
nmap <leader>bp  :bprevious<CR> " previous buffer
nmap <leader>bn  :bnext<CR>     " next buffer
nmap <leader>bl  :bl<CR>        " Last viewed bufer
nmap <leader>bq  :Bclose<CR> 


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

 " " Format the status line
 " set statusline=%{HasPaste()}%t%m%r%h%w\ %l,%c,%p%%
 " nmap <leader>bl  :ls<CR> " list buffers list buffers


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LaTeX Compling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " map <F7> : call CompileRunPDFLatex()<CR>
 " func! CompileRunPDFLatex()
 " exec "w"
 " " call latex on the current file then run dvips on the file
 " " generated by latex. The %< variable corresponds to the
 " " current file name stripped of its extension.
 " "    exec "!pdflatex --shell-escape -synctex=1 Report.tex"
 " "    exec "!pdflatex --shell-escape -synctex=1 main.tex"
 "     exec "!pdflatex --shell-escape -synctex=1 %<.tex"
 " "    exec "!pdflatex --shell-escape -synctex=1 NRTA_Chp3Part9_PMRNetworks.tex"
 " "    exec "!pdflatex --shell-escape -synctex=1 final_tech.tex"
 " endfunc



map <F7> : call CompileRunPDF()<CR>
func! CompileRunPDF()
exec "w"
" exec "!latex -synctex=1 --shell-escape dissertation.tex && dvips dissertation.dvi && ps2pdf dissertation.ps"
exec "!latex -synctex=1 --shell-escape %<.tex && dvips %<.dvi && ps2pdf %<.ps"
endfunc
