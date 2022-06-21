local fn = vim.fn

-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Automatically reloads VIM once this file gets edited
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call to avoid erroring
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Use a popup window for packer
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end
	}
}

-- Install all the required plugins
return packer.startup(function(use)
	-- Used by packer to manage itself
	use "wbthomason/packer.nvim"
	-- VIM Popup API for NVIM
	use "nvim-lua/popup.nvim"
	-- Lua functions required by some plugins
	use "nvim-lua/plenary.nvim"
	-- Theme(s)
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})
	use({
		"navarasu/onedark.nvim",
		as = "onedark"
	})
	-- Bracket pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	-- Lualine
	use {
		"nvim-lualine/lualine.nvim",
		requires = {"kyazdani42/nvim-web-devicons", opt = true}
	}
	-- Git signs
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	}
	-- Wildmenu autocomplete
	use "gelguy/wilder.nvim"
	-- Tree sitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	-- Language server protocol, autocompletion and snippets 
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "hrsh7th/nvim-cmp" -- Autocompletion plugin
	use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
	use "L3MON4D3/LuaSnip" -- Snippets plugin
	use "saadparwaiz1/cmp_luasnip"
	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {}
		end
	}
	-- Automatically setup the configuration
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
