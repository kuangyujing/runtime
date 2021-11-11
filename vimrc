set nocompatible
set ambiwidth=single "listchars, fillchars
set backspace=indent
set ttyfast
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set expandtab
set autoindent
set smartindent
set breakindent
set cindent
set cinoptions=+2,t0,l1,j1,J1 "(s,L0
set formatoptions=tcroqnblmM1j "'
set autoread
set cmdheight=1
set scrolloff=2
set laststatus=2
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,sjis,default,latin1
set fileformat=unix
set fileformats=unix,dos,mac
set matchpairs=(:),{:},[:],<:>,=:;
set listchars=trail:.,extends:»,precedes:«,tab:ǀ\  "'
set fillchars=vert:\  "'
set list
set hlsearch
set incsearch
set smartcase
set noswapfile
set nobackup
set noshowmode
set clipboard=unnamedplus
set conceallevel=0
set wildmenu
set number
set wrap
set nofoldenable
set mouse=nv
set timeoutlen=10
set nocursorline "fix for slow scrolling
set background=dark
noremap <silent> q <nop>
noremap <silent> <s-q> <nop>
nnoremap <silent> <tab> <c-w>w
nnoremap <silent> <s-tab> <c-w>W
filetype plugin indent on
autocmd BufEnter * if &filetype == '' | setlocal filetype=text | endif
autocmd InsertLeave * call system('fcitx-remote -c')
autocmd VimLeave * call system('xsel -ib', getreg('+'))
autocmd ColorScheme * call onedark#set_highlight
            \ ('normal',{'fg':{'gui':'#efefef','cterm':'255','cterm16':'15'}})
autocmd ColorScheme * call onedark#set_highlight
            \ ('linenr',{'fg':{'gui':'#e5c07b','cterm':'180','cterm16':'3'}})
autocmd ColorScheme * call onedark#set_highlight
            \ ('visual',{'fg':{'gui':'#ffffff','cterm':'15','cterm16':'15'},
            \  'bg':{'gui':'#ff5f5f','cterm':'203','cterm16':'9'}})
let g:skip_defaults_vim=1 "disable defaults.vim
let g:html_indent_style1='inc' "fix style tag indent
let g:html_indent_script1='inc' "fix script tag indent
let g:indentLine_char='│' "│
let g:python_highlight_all=1
let g:rainbow_active=1
let g:lightline={'colorscheme':'16color'}
let g:vim_json_syntax_conceal=0
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:highlightedyank_highlight_duration=200
call plug#begin("/usr/share/vim/plug")
 " basics
 Plug 'itchyny/lightline.vim'
 Plug 'yggdroot/indentline'
 Plug 'jiangmiao/auto-pairs'
 Plug 'luochen1990/rainbow'
 Plug 'machakann/vim-highlightedyank'
 " web
 Plug 'kuangyujing/html5.vim',{'for':['html','javascript','css']}
 " javascript
 Plug 'pangloss/vim-javascript',{'for':['html','javascript']}
 Plug 'othree/yajs.vim',{'for':['html','javascript']}
 Plug 'othree/es.next.syntax.vim',{'for':['html','javascript']}
 Plug 'othree/javascript-libraries-syntax.vim',{'for':['html','javascript']}
 Plug 'maxmellon/vim-jsx-pretty',{'for':['html','javascript']}
 " node.js
 Plug 'moll/vim-node',{'for':'javascript'}
 " python
 Plug 'hdima/python-syntax',{'for':'python'}
 Plug 'Vimjas/vim-python-pep8-indent',{'for':'python'}
 " git
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 " typescript
 Plug 'pangloss/vim-javascript'
 Plug 'leafgarland/typescript-vim'
 " jsx, tsx
 Plug 'maxmellon/vim-jsx-pretty'
 " graphql
 Plug 'jparise/vim-graphql'
 " ejs, jst
 Plug 'briancollins/vim-jst',{'for':['ejs','jst']}
 " colorscheme
 Plug 'joshdick/onedark.vim'
call plug#end() " + syntax enable
colorscheme onedark
highlight HighlightedyankRegion ctermfg=15 ctermbg=203
