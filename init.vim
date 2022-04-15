call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'nikolvs/vim-sunbather'
Plug 'axvr/photon.vim'
Plug 'chriskempson/base16-vim'
Plug 'stefanvanburen/rams.vim'
Plug 'morhetz/gruvbox'
Plug 'kadekillary/skull-vim'
Plug 'doums/darcula'
Plug 'romgrk/doom-one.vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'axvr/photon.vim'
Plug 'kadekillary/skull-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'AlessandroYorba/Sierra'
Plug 'sts10/vim-pink-moon'
Plug 'cormacrelf/vim-colors-github'
Plug 'sainnhe/gruvbox-material'
Plug 'shaunsingh/nord.nvim'
Plug 'fcpg/vim-orbital'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'liuchengxu/space-vim-dark'
Plug 'nanotech/jellybeans.vim'

" Syntax / Lint
Plug 'Shirk/vim-gas'
Plug 'dense-analysis/ale'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'romgrk/barbar.nvim'
Plug 'universal-ctags/ctags'
Plug 'preservim/tagbar'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Tree
Plug 'preservim/nerdtree'

" Terminal
Plug 'akinsho/toggleterm.nvim'
" HTML
Plug 'mattn/emmet-vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'

" Web Dev
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" Misc
Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'edluffy/hologram.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'KabbAmine/vCoolor.vim'
Plug 'luochen1990/rainbow'
Plug 'alvan/vim-closetag'
Plug 'glepnir/dashboard-nvim'
Plug 'tpope/vim-commentary'
Plug 'RRethy/vim-illuminate'

" Random-Deps
Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Color Scheme
colorscheme gruvbox-material 
set termguicolors
set background=dark


" JK maps
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>

" Bind ctrl-a to remove search highlights
nnoremap nh :noh <CR>

" Vanilla settings
syntax on

set number ruler

set visualbell

set encoding=utf-8

set wrap

" Function to set tab width to n spaces
function! SetTab(n)
    let &l:tabstop=a:n
    let &l:softtabstop=a:n
    let &l:shiftwidth=a:n
    set expandtab
endfunction

set laststatus=2

set hlsearch
set incsearch

set t_Co=256

set tabstop=4

set hidden

set mouse=a

" Map F8 to Tagbar
nmap <F8> :TagbarToggle<CR>

set nobackup
set nowritebackup

set updatetime=300

set cmdheight=1
set shortmess+=c

set signcolumn=yes

" COQ auto-start
let g:coq_settings = { 'auto_start': 'shut-up' }

" doom-one termguicolors
let g:doom_one_terminal_colors = v:true

lua << EOF
require("toggleterm").setup{
    direction = 'float',
    border = 'curved'
}
EOF

" Term binds
nnoremap <C-x> <cmd>ToggleTerm<cr>
tnoremap <C-x> <cmd>ToggleTerm<cr>

" Whitespace bind
nnoremap <C-s> <cmd>StripWhitespace<cr>
inoremap <C-s> <cmd>StripWhitespace<cr>


" lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }




" NERDtree binds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Lualine Setup
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    --component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    --section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

" barbar binds
nnoremap <silent>    <C-j> :BufferPrevious<CR>
nnoremap <silent>    <C-k> :BufferNext<CR>

nnoremap <silent>    <C-u> :BufferMovePrevious<CR>
nnoremap <silent>    <C-i> :BufferMoveNext<CR>

nnoremap <silent>    <C-1> :BufferGoto 1<CR>
nnoremap <silent>    <C-2> :BufferGoto 2<CR>
nnoremap <silent>    <C-3> :BufferGoto 3<CR>
nnoremap <silent>    <C-4> :BufferGoto 4<CR>
nnoremap <silent>    <C-5> :BufferGoto 5<CR>
nnoremap <silent>    <C-6> :BufferGoto 6<CR>
nnoremap <silent>    <C-7> :BufferGoto 7<CR>
nnoremap <silent>    <C-8> :BufferGoto 8<CR>
nnoremap <silent>    <C-9> :BufferLast<CR>

" barbar options
" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

