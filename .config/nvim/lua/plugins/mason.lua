require("mason").setup()

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver", -- TypeScript/JavaScript
		"html",   -- HTML
		"cssls",  -- CSS
		"scssls", -- SCSS
		"intelephense", -- PHP
		"lua_ls", -- Lua
		"omnisharp", -- C# (OmniSharp)
		"vuels",  -- Vue3
	},
})

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup {}
	end,
})
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- Nếu bạn sử dụng luasnip
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(), -- Phím mũi tên lên
		['<Down>'] = cmp.mapping.select_next_item(), -- Phím mũi tên xuống
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
			},
		}),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
})

