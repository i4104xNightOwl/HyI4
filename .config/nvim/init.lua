require("configs.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("configs.plugins")
vim.cmd [[colorscheme tokyonight-night]]

require("plugins.auto-session")
require("plugins.alpha")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.mason")
require("plugins.searchbox")
require("plugins.autotags")
require("plugins.telescope")
require("plugins.notify")

vim.schedule(function()
	require("configs.keybindings")

	vim.notify = require("notify")
	vim.notify("Have a nice day, i4104!", "info", { title = "Welcome Back" })
end)
