" Turn on line numbering. Turn it off with "set nonu 
set nu 

" Set syntax on
syntax on

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Case insensitive search
set ic

set history=1000

" SEARCHING
nnoremap / /\v
vnoremap / /\v
set ignorecase 
set smartcase
set showmatch 
set gdefault
set hlsearch
" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
" Don't jump when using * for search 
nnoremap * *<c-o>
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" more natural movement with wrap on
" Easy buffer navigation
noremap <C-Left>  <C-w>h
noremap <C-Down>  <C-w>j
noremap <C-Up>  <C-w>k
noremap <C-Right>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Wrap text instead of being on one line
set lbr

" Change colorspace
set t_Co=256

"set backspace=indent,eol,start
nnoremap <BS> X
set backspace=2
set pastetoggle=<F2>
set mouse=a

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_regexp = 1
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :TagbarToggle<CR>
"nnoremap <F4> :MBEFocus<CR>
nnoremap <Leader><Left> :bprev<CR>
nnoremap <Leader><Right> :bnext<CR>
"nnoremap <Leader><Up> :MBEbb<CR>
"nnoremap <Leader><Down> :MBEbf<CR>
"nnoremap <Leader>u :MBEbu<CR>
"nnoremap <Leader>d :MBEbd<CR>



" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" Move to the next buffer
nmap <M-Right> :bnext<CR>
" Move to the previous buffer
nmap <M-Left> :bprev<CR>


set wildmode=full

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
set foldmethod=syntax
set foldlevel=99


if has('cscope')
	set cscopetag cscopeverbose

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif
	
	cnoreabbrev csa cs add
	cnoreabbrev csf cs find
	cnoreabbrev csk cs kill
	cnoreabbrev csr cs reset
	cnoreabbrev css cs show
	cnoreabbrev csh cs help
	
	"command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif


set tags=/data/Development/linuxSource/myTest/myTags/tags


" Status Line update
set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file


" --------------- Vundle ---------------------
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
" git repos on your local machine (ie. when working on your own plugin)
"  Bundle 'file:///Users/gmarik/path/to/plugin'
Plugin 'flazz/vim-colorschemes'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
"Plugin 'vim-scripts/cscope.vim'
" ----------------------------------------


" Syntastic seetings
let g:syntastic_mode_map = { 'mode': 'active',
				\ 'active_filetypes': ['ruby', 'php'],
				\ 'passive_filetypes': ['puppet','c','c++'] }
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1


filetype plugin indent on 


" Vim-airline tabs
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Change colorscheme from default to mustang
color mustang


