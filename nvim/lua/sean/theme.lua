-- Catppuccin settings
vim.g.catppuccin_flavour = "mocha"
-- Onedark settings
require("onedark").setup {
	style = "deep"
}
-- Selected color scheme
local colorscheme = "onedark"

-- Notifies the user if the color scheme can't be found
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("The colorscheme " .. colorscheme .. " was not found!")
	return
end
