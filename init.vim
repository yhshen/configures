set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mklabs/split-term.vim'
"Plug 'kassio/neoterm'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'roxma/nvim-completion-manager'
"Plug 'roxma/ncm-clang'
Plug 'neomake/neomake'
"Plug 'Chiel92/vim-autoformat'
Plug '~/.fzf'
Plug 'aperezdc/vim-template'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-signify'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

filetype plugin on

set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch

set autochdir

syntax enable
syntax on

filetype indent on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

colorscheme gruvbox
set background=dark
set guicursor=

let g:mapleader = ";"
let mapleader = ";"

" Ultisnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <silent> <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=32
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1

""Neoterm
""let g:neoterm_position = 'vertical'
"let g:neoterm_size = 80
"let g:neoterm_automap = 1
"let g:neoterm_autojump = 1
"let g:neoterm_autoinsert = 1
""let g:neoterm_automap_keys = ',tt'

tnoremap <Esc> <C-\><C-n>
"tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
"nnoremap <silent> <f10> :TREPLSendFile<cr>
"nnoremap <silent> <f9> :TREPLSendLine<cr>
"vnoremap <silent> <f9> :TREPLSendSelection<cr>
"
"" Useful maps
"nnoremap <silent> <leader>to :call neoterm#open()<cr>
"" hide/close terminal
"nnoremap <silent> <leader>th :call neoterm#close()<cr>
"" clear terminal
"nnoremap <silent> <leader>tc :call neoterm#clear()<cr>
"" kills the current job (send a <c-c>)
"nnoremap <silent> <leader>tk :call neoterm#kill()<cr>


nnoremap <silent> <leader>to :VTerm<cr>

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" YouCompleteMe
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_echo_current_diagnostic = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 0

" CtrlSF
let g:ctrlsf_search_mode = 'sync'
"let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_auto_close = 1
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '40%'
let g:ctrlsf_default_root = 'project'


nmap     <C-F>f <Plug>CtrlSFPrompt<CR>
vmap     <C-F>f <Plug>CtrlSFVwordPath<CR>
vmap     <C-F>F <Plug>CtrlSFVwordExec<CR>
nmap     <C-F>n <Plug>CtrlSFCwordPath<CR>
nmap     <C-F>p <Plug>CtrlSFPwordPath<CR>
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Vim-formatter
"au BufWrite * :Autoformat
