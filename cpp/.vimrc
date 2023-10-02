call plug#begin()

Plug 'morhetz/gruvbox' "color theme
Plug 'preservim/nerdtree' "file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy search
Plug 'junegunn/fzf.vim' "also fuzzy search
Plug 'ycm-core/YouCompleteMe' "autocomplete
Plug 'liuchengxu/vista.vim' "show tags for every point in code
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "color for icons in nerdtree
Plug 'luochen1990/rainbow' "rainbow color for paired parentheses
Plug 'ryanoasis/vim-devicons' "icons in nerdtree
Plug 'bfrg/vim-cpp-modern'

call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif

"gruvbox
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox

"nerdtree
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

"fzf
map ; :Files<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

"vista
nmap <F4> :Vista!!<CR>
let g:vista_sidebar_width = 60
let g:vista_cursor_delay = 200
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#enable_kind=1

"rainbow parentheses
let g:rainbow_active = 1

"YouCompleteMe
nmap <F5> :YcmCompleter GoToAlternateFile<CR>
nmap <F6> :YcmCompleter GoToDeclaration<CR>
nmap <F7> :YcmCompleter GoToDefinition<CR>
nmap <F8> :YcmCompleter GoToReferences<CR>
nmap <F9> :YcmCompleter GetType<CR>
nmap <F3> <plug>(YCMHover) 
let g:ycm_auto_hover = '0' 
set updatetime=100000
let g:ycm_show_diagnostics_ui = 0 "turns off errors highlighting



"general
set number relativenumber
filetype plugin indent on
set encoding=UTF-8
set updatetime=250
set expandtab
set tabstop=4
set shiftwidth=4
set syntax=on
