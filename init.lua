-- Install Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'morhetz/gruvbox'
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true }}
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Telescope
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}


--Add leader shortcuts
vim.api.nvim_set_keymap('n',
	 '<leader><space>',
	 [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>sf',
	 [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>sb',
	 [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>sh',
	 [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>st',
	 [[<cmd>lua require('telescope.builtin').tags()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>sd',
	 [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>sp',
	 [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>so',
	 [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	 { noremap = true,
	 silent = true })
vim.api.nvim_set_keymap('n',
	 '<leader>?',
	 [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	 { noremap = true,
	 silent = true })

-- default settings

vim.cmd [[colorscheme gruvbox]]
vim.o.background = 'light'
vim.g.gruvbox_contrast_light = 'hard'
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_light'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

vim.wo.colorcolumn = '80'
vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.hidden = true

local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smartindent = true
set.scrolloff = 8
set.autoread = true
set.smarttab = true
set.number = true
set.autoindent = true
set.cursorline = true
set.undofile = true
set.splitright = true
set.splitbelow = true
