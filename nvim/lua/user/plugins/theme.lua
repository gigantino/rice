return {
  {
    "navarasu/onedark.nvim",
    name="onedark",
    config = function()
      require("onedark").setup {
        style = "darker"
      }
    end,
  },
}
