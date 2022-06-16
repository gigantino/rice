local options = {
	-- Some language servers have problems with backups
	backup = false,	
	writebackup = false,
	-- Clipboard
	clipboard = "unnamedplus",
	-- Faster completion (defaults to 4000ms)
	updatetime = 300,
	-- Splits
	splitbelow = true,
	splitright = true,
	-- Allow the mouse to be used
	mouse = "a",
	-- Line numbers
	number = true,
	relativenumber = true,
	-- Indentation
	smartindent = true,
	expandtab = false,
	tabstop = 3,
	shiftwidth = 3,
	-- GUI settings
	guifont = "JetBrainsMono Nerd Font Mono:h17",
	-- Give more space for displaying messages
	cmdheight = 2,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
