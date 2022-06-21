require'nvim-treesitter.configs'.setup {
	ensure_installed = {"typescript", "go", "javascript", "lua"},
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}
