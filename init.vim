noremap <Up> :echo "I think you mean k!"<CR>
noremap <Down> :echo "I think you mean j!"<CR>
noremap <Left> :echo "I think you mean h!"<CR>
noremap <Right> :echo "I think you mean l!"<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-f> gg=G<C-o><C-o>

call plug#begin(stdpath('data').'/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'vim-syntastic/syntastic'
"Plug 'airblade/vim-gitgutter'
"Plug 'pangloss/vim-javascript'
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'skanehira/docker-compose.vim'
"Plug 'lyuts/vim-rtags'
"Plug 'vim-utils/vim-man'
"Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'vim-airline/vim-airline'

call plug#end()

let g:airline_powerline_fonts = 1
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set relativenumber

" search down into subfolders. provides tab completion for file-related tasks. 
set path +=**

" disable vi behaviours
set nocompatible
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set nu
" set nowrap
set smartcase
set autoindent
set smartindent
set noswapfile
set incsearch
set hlsearch
set cursorline
set nobackup
" set undodir=~/.vim/undodir
set undofile
set incsearch
set foldmethod=syntax
set foldcolumn=4

syntax enable
let g:gruvbox_contrast_dark = 'hard'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if $TERM_PROGRAM =~ "iTerm"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_invert_selection = '0'

colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" lua << EOF
" require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" require('telescope').load_extension('fzy_native')
" EOF
