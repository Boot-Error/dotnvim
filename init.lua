--[[

Neovim init file, inspired by brainfucksec/neovim-lua

This file loads all the modules

--]]

require('packer_init')
require('core/settings')
require('core/keymaps')
require('core/colors')
require('plugins/lualine')
require('plugins/telescope')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')
require('plugins/hop-nvim')
require('plugins/indent-blanklines')
require('plugins/nvim-lspconfig')
require('plugins/nvim-cmp')
