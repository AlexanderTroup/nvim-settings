
function noremap (shortcut, command)
  vim.keymap.set({"n", "v", "s", "x"}, shortcut, command, {noremap = true})
end

function inoremap (shortcut, command)
  vim.keymap.set({"i"}, shortcut, command, {noremap = true})
end

function setAutoClose(openChar, closeChar)
  command = openChar .. closeChar .. "<left>"
  inoremap(openChar, command)
end

noremap('<Up>' ,':echo "I think you mean k!" <CR>')
noremap('<Down>', ':echo "I think you mean j!"<CR>')
noremap('<Left>', ':echo "I think you mean h!"<CR>')
noremap('<Right>', ':echo "I think you mean l!"<CR>')
noremap('<leader>ff', '<cmd>Telescope find_files<cr>')
noremap('<C-p>', '<cmd>Telescope find_files<cr>')
noremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
noremap('<leader>fb', '<cmd>Telescope buffers<cr>')
noremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
noremap('<C-n>', ':NERDTreeToggle<CR>')
noremap('<C-f>', 'gg=G<C-o><C-o>')
noremap('<space>', 'za')
setAutoClose('(', ')')
setAutoClose("'", "'")
setAutoClose("{", "}")
setAutoClose("[", "]")
setAutoClose("\"", "\"")

vim.cmd [[
call plug#begin(stdpath('data').'/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-airline/vim-airline'
Plug 'williamboman/mason.nvim'
Plug 'codota/tabnine-nvim', { 'do': 'pwsh.exe -file .\\dl_binaries.ps1' }
call plug#end()
]]

vim.g.airline_powerline_fonts = 1

vim.opt.relativenumber = true

--
-- search down into subfolders. provides tab completion for file-related tasks. 
vim.opt.path:append '**'

-- disable vi behaviours
vim.opt.compatible = false
vim.opt.errorbells = false
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true
vim.opt.nu = true
-- set nowrap
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.backup = false
-- set undodir=~/.vim/undodir
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.foldmethod="syntax"
vim.opt.foldcolumn="4"

vim.cmd 'colorscheme gruvbox'

if os.getenv("TERM_PROGRAM") == "iTerm.app" then
  -- iTerm2 cursor shape configuration
  vim.opt.guicursor = 'n-v-c:block-Cursor/i-ci-ve:ver25-Cursor-blinkon0,r-cr:hor20-Cursor-blinkon0'
end

-- Color adjustments and highlight settings
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = '0'
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'

-- Completion settings
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- Uncomment the following lines to configure LSP and Telescope extensions in Lua

--require('telescope').load_extension('fzf')
require('mason').setup{ }
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require(telescope.actions).move_selection_next,
        ["<C-k>"] = require(telescope.actions).move_selection_previous,
      }
    }
  }
}
