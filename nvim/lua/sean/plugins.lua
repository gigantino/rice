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
		install_path,
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
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install all the required plugins
return packer.startup(function(use)
	-- Used by packer to manage itself
	use "wbthomason/packer.nvim"
	-- VIM Popup API for NVIM
	use "nvim-lua/popup.nvim"
	-- Lua functions required by some plugins
	use "nvim-lua/plenary.nvim"
	-- NVIM Tree
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	}
	-- Theme
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	-- Language server
	use {
		"neoclide/coc.nvim",
		branch = "release",
	}
	-- Bracket pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	-- Lualine
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}
	-- Git signs
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	}
	-- Tabs
	use {
		"romgrk/barbar.nvim",
		requires = {"kyazdani42/nvim-web-devicons"}
	}
	-- Automatically setup the configuration
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

