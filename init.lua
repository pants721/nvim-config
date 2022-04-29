local cmd = vim.cmd
local cmp = require'cmp'
local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
	-- PACKER
	use 'wbthomason/packer.nvim'

	-- THEMES
	use 'projekt0n/github-nvim-theme'
	use 'vim-two-firewatch'
	use 'liuchengxu/space-vim-dark'
	use 'sainnhe/sonokai'
	use	'marko-cerovac/material.nvim'
	use 'nikolvs/vim-sunbather'
	use 'joshdick/onedark.vim'
	use 'morhetz/gruvbox'

	-- LINES
	use 'nvim-lualine/lualine.nvim'
	-- use 'alvarosevilla95/luatab.nvim'
	-- use 'beauwilliams/statusline.lua'

	-- LSP / LINT / AUTOCOMPLETE
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'tpope/vim-surround'
	use 'L3MON4D3/LuaSnip'
	-- use 'Shougo/neosnippet.vim'
	use {'himkt/docstring.nvim', config = 'vim.cmd [[UpdateRemotePlugins]]'}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
    }

	-- TREE
	use 'preservim/nerdtree'

	-- TERM
	use 'akinsho/toggleterm.nvim'

	-- MISC
	use 'jiangmiao/auto-pairs'
	use 'kyazdani42/nvim-web-devicons'
	use 'edluffy/hologram.nvim'
	use 'ntpeters/vim-better-whitespace'
	use 'KabbAmine/vCoolor.vim'
	use 'luochen1990/rainbow'
	use 'alvan/vim-closetag'
	use 'tpope/vim-commentary'
	use 'RRethy/vim-illuminate'
	use 'liuchengxu/vim-clap'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'turbio/bracey.vim'

	end
)

-- COLOR SCHEME
cmd('colorscheme onedark')
-- opt.termguicolors = true

-- DEFAULT OPTIONS
local tabSize = 4
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.background = "dark"
opt.encoding = "utf-8"
opt.mouse = 'a'
opt.laststatus = 3
opt.tabstop = 4
opt.updatetime = 300
opt.cmdheight = 1
opt.signcolumn = 'yes'
cmd('syntax on')
cmd('set hidden')
cmd('set number ruler')
cmd('set visualbell')
cmd('set wrap')
cmd('set hlsearch')
cmd('set incsearch')
cmd('set nobackup')
cmd('set nowritebackup')
cmd(string.format('set tabstop=%i', tabSize))
cmd(string.format('set softtabstop=%i', tabSize))
cmd(string.format('set shiftwidth=%i', tabSize))

-- CUSTOM BINDS
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<esc>", {noremap = true, silent = true})
map("n", "<C-x>", ":ToggleTerm<CR>", {noremap = true, silent = true})
map("i", "<C-x>", ":ToggleTerm<CR>", {noremap = true, silent = true})
map("t", "<C-x>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
map("n", "<C-s>", ":StripWhitespace<CR>", {noremap = true, silent = true})
map("i", "<C-s>", ":StripWhitespace<CR>", {noremap = true, silent = true})
map("n", "<C-n>", ":NERDTreeToggle<CR>", {noremap = true, silent = true})
map("n", "<C-f>", ":NERDTreeFind<CR>", {noremap = false, silent = true})
map("n", "<C-j>", ":tabp<CR>", {noremap = true, silent = true})
map("n", "<C-k>", ":tabn<CR>", {noremap = true, silent = true})
map("n", "<C-g>", ":noh<CR>", {noremap = true, silent = true})

require('toggleterm').setup{
	direction = 'float',
	border = 'curved'
}

cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
		-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	  end,
	},
	window = {
	  completion = cmp.config.window.bordered(),
	  documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	  ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<C-e>'] = cmp.mapping.abort(),
	  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	  ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end
	}),
	sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
	  -- { name = 'vsnip' }, -- For vsnip users.
	  { name = 'luasnip' }, -- For luasnip users.
	  -- { name = 'ultisnips' }, -- For ultisnips users.
	  -- { name = 'snippy' }, -- For snippy users.
	}, {
	  { name = 'buffer' },
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
	  { name = 'buffer' },
	})
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
	  { name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	})
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("luasnip.loaders.from_vscode").lazy_load()

local servers = {
    'pyright',
    'rust_analyzer',
    'omnisharp',
    'ccls',
		'sumneko_lua',
		'html'
    }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach
    }
end
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- require('luatab').setup{
-- }

 require('lualine').setup {
   options = {
     icons_enabled = true,
     theme = 'auto',
     component_separators = { left = '', right = ''},
     section_separators = { left = '', right = ''},
     disabled_filetypes = {},
     always_divide_middle = true,
     globalstatus = true,
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

