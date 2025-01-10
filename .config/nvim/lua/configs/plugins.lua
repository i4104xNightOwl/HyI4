require("lazy").setup({
	spec = {
		{
			'norcalli/nvim-colorizer.lua',
			config = function()
				require'colorizer'.setup()
			end
		},
		{
			"MunifTanjim/nui.nvim",
			"VonHeikemen/searchbox.nvim",
		},
		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup {}
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter"
		},
		{
			'goolord/alpha-nvim',
			lazy = false,
			priority = 1000,
			event = "VimEnter",
		},
		{
			"rmagatti/auto-session",
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' }
		},
		-- {
		-- 	'romgrk/barbar.nvim',
		-- 	dependencies = {
		-- 		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		-- 		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		-- 	},
		-- 	version = '^1.0.0',
		-- 	config = function()
		-- 		require 'barbar'.setup()
		-- 	end
		-- },
		{
			'williamboman/mason.nvim',
			dependencies = {
				'williamboman/mason-lspconfig.nvim',
				'neovim/nvim-lspconfig',
				'hrsh7th/nvim-cmp',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',
				'onsails/lspkind-nvim',
			},
			build = ':MasonUpdate',
		},
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {},
		},
		{
			'windwp/nvim-autopairs',
			'windwp/nvim-ts-autotag',
			event = "InsertEnter",
			config = true
		},
		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.8',
		},
		{
			"rcarriga/nvim-notify",
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			config = function()
				require("ibl").setup({
					indent = {
						char = "│"
					},
					whitespace = {
						remove_blankline_trail = false,
					},
					scope = { enabled = false },
				})
			end
		}
	},
	checker = { enabled = true },
})
