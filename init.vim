call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-markdown'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-gitgutter'
  Plug 'mhartington/oceanic-next'
  Plug 'alvan/vim-closetag'
  Plug 'chemzqm/vim-jsx-improve'
  Plug 'neomake/neomake'
call plug#end()

filetype on
filetype plugin on
filetype indent on
syntax on

" ========== Swap File Options ==========
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" ========== Theme Options ==========
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

syntax enable
colorscheme OceanicNext
"set background=dark

highlight Comment gui=italic
highlight Comment cterm=italic

" ========== Standard Vim Interaction Options ==========
set title
set nowrap
set ruler
set showcmd
set number
set noshowmode
set autoread
set numberwidth=2
set ch=1
set mouse=a "Allow mouse interaction
set shiftwidth=2
set softtabstop=2
set expandtab
set smartcase
set hlsearch
set incsearch  " Search while typing
set cursorline
set splitright " Always do virtual splits right
set timeoutlen=1000 ttimeoutlen=200           "Reduce Command timeout for faster escape and O
set fileencoding=utf-8 encoding=utf-8         "Set utf-8 encoding on write

" Highlight all trailing white space
" ========== White space handling ==========
match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/

" ========== GUI Options =====
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=l
set linespace=8
set guifont=Menlo\ for\ Powerline:h14

hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END

" ========= Airline Theme =========
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

let g:used_javascript_libs = 'angularjs,d3,react,angularuirouter'

" ======= Mapping ===============
let mapleader=" "
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Leader>c :bp<bar>sp<bar>bn<bar>bd<CR> " This kills the current buffer without destroying split
"nnoremap <Leader>c :bp\|bd #<CR> " This kills the current buffer without destroying split
nnoremap <CR> :noh<CR><CR>  " This unsets highlighting when enter is hit again
nnoremap <C-p> :FZF -m<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
nnoremap <C-k> :bnext<CR>
nnoremap <C-j> :bprev<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
map ; :
com! FormatJSON %!python -m json.tool

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" ======= Scrolling ========
set scrolloff=8
set sidescroll=5

" ========== NERDTree ============
" Open nerdree automatically when vim starts up if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle NerdTree
map <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.git$', '\.sass-cache$']
" Close vim when only NERD tree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========== HTML CloseTag ==========
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" ========== Sytastic ==========
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

augroup filetype_ruby
  autocmd!
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal expandtab
augroup END

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal expandtab
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal expandtab
augroup END
