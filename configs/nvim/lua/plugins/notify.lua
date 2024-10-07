local notify = require("notify")

notify.setup({
	stages = "fade",         -- Các hiệu ứng hiển thị thông báo
	timeout = 3000,          -- Thời gian tồn tại của thông báo (ms)
	max_width = 50,          -- Chiều rộng tối đa của thông báo
	max_height = 20,         -- Chiều cao tối đa của thông báo
	render = "wrapped-compact", -- Cách hiển thị thông báo
})

vim.cmd([[highlight NotifyINFOIcon guifg=#7dc4e4]])
vim.cmd([[highlight NotifyINFOTitle guifg=#7dc4e8]])
vim.cmd([[highlight NotifyINFOBorder guifg=#7dc4e0]])

vim.cmd([[highlight NotifySUCCESSIcon guifg=#A9FF68]])
vim.cmd([[highlight NotifySUCCESSTitle guifg=#4CAF50]])
vim.cmd([[highlight NotifySUCCESSBorder guifg=#3C763D]])

vim.cmd([[highlight NotifyERRORIcon guifg=#FF6F61]])
vim.cmd([[highlight NotifyERRORTitle guifg=#F44336]])
vim.cmd([[highlight NotifyERRORBorder guifg=#C62828]])

vim.cmd([[highlight NotifyDANGERIcon guifg=#FF6F61]])
vim.cmd([[highlight NotifyDANGERTitle guifg=#FF5722]])
vim.cmd([[highlight NotifyDANGERBorder guifg=#D32F2F]])

vim.cmd([[highlight NotifyWARNIcon guifg=#FFC107]])
vim.cmd([[highlight NotifyWARNTITLE guifg=#FF9800]])
vim.cmd([[highlight NotifyWARNBorder guifg=#FFA000]])

vim.cmd([[highlight NotifyDEBUGIcon guifg=#673AB7]])
vim.cmd([[highlight NotifyDEBUGTitle guifg=#9C27B0]])
vim.cmd([[highlight NotifyDEBUGBorder guifg=#6A1B9A]])

require("telescope").load_extension("notify")
