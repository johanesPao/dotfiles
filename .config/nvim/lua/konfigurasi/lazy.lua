local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Otomatis install lazy.nvim jika tidak ada
if not vim.loop.fs_stat(lazypath) then
	print("Menginstal lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	print('Selesai.')
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins")

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
