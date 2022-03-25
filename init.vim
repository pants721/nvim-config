call plug#begin('~/.config/nvim/plugged')
" Themes
Plug 'morhetz/gruvbox'
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

" Autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'

" Line
Plug 'nvim-lualine/lualine.nvim'
" Plug 'NTBBloodbath/galaxyline.nvim'
" Plug 'beauwilliams/statusline.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'romgrk/barbar.nvim'

" Tags
Plug 'universal-ctags/ctags'
Plug 'preservim/tagbar'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Tree
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'

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
Plug 'edluffy/hologram.nvim'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'KabbAmine/vCoolor.vim'
" Plug 'folke/which-key.nvim'
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
colorscheme space-vim-dark 
set termguicolors
set background=dark


" JK maps
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>

" Bind ctrl-g to remove search highlights
inoremap <C-g> :noh<CR>
nnoremap <C-g> :noh<CR>

" Vanilla settings
syntax on

set number
set ruler

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

command! -nargs=1 SetTab call SetTab(<f-args>)

" Function to trim extra whitespace in whole file
" function! Trim()
    " let l:save = winsaveview()
    " keeppatterns %s/\s\+$//e
    " call winrestview(l:save)
" endfun

command! -nargs=0 Trim call Trim()

set laststatus=2

set hlsearch
set incsearch

set t_Co=256

set ts=4

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

set rnu


" COQ auto-start
let g:coq_settings = { 'auto_start': 'shut-up' }

" doom-one termguicolors
let g:doom_one_terminal_colors = v:true

" Dashboard Settings
let g:dashboard_custom_header = [
  \'               ▄▄██████████▄▄             ',
  \'               ▀▀▀   ██   ▀▀▀             ',
  \'       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
  \'     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
  \'    ████▄ ▄███▀              ▀███▄ ▄████  ',
  \'   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
  \'   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
  \'    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
  \'       ███           ▀▀           ███     ',
  \'       ██████████████████████████████     ',
  \'   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
  \'   ███  ███ ███   ██    ██   ███▄███  ███ ',
  \'   ▀██▄████████   ██    ██   ████████▄██▀ ',
  \'    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
  \'     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
  \'       ▀███    ▀▀██████████▀▀▀   ███▀     ',
  \'         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
  \'               ▀████████████▀             ',
\]



lua << EOF
require("toggleterm").setup{
    direction = 'float',
    border = 'curved'
}
EOF

" Term binds
nnoremap <C-w> <cmd>ToggleTerm<cr>
tnoremap <C-w> <cmd>ToggleTerm<cr>
tnoremap jk <C-\><C-n>

" Whitespace bind
nnoremap <C-s> <cmd>StripWhitespace<cr>
inoremap <C-s> <cmd>StripWhitespace<cr>


" lightline
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }




" NERDtree binds
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>












" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#whitespace#enabled = 0












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
" Move to previous/next
" nnoremap <silent>    <C-,> :BufferPrevious<CR>
" nnoremap <silent>    <C-.> :BufferNext<CR>

" nnoremap <silent>    <C-1> :BufferGoto 1<CR>
" nnoremap <silent>    <C-2> :BufferGoto 2<CR>
" nnoremap <silent>    <C-3> :BufferGoto 3<CR>
" nnoremap <silent>    <C-4> :BufferGoto 4<CR>
" nnoremap <silent>    <C-5> :BufferGoto 5<CR>
" nnoremap <silent>    <C-6> :BufferGoto 6<CR>
" nnoremap <silent>    <C-7> :BufferGoto 7<CR>
" nnoremap <silent>    <C-8> :BufferGoto 8<CR>
" nnoremap <silent>    <C-9> :BufferLast<CR>

" Tree setup
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
require'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup   = {},
  auto_close           = false,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  },
}
EOF

" BARBAR
" Move to previous/next
nnoremap <silent>    <C-j> :BufferPrevious<CR>
nnoremap <silent>    <C-k> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-u> :BufferMovePrevious<CR>
nnoremap <silent>    <C-i> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
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

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

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

" whitespace
