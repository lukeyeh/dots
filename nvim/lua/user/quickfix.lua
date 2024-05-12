-- Auto quits the quick fix window if quitting another window.
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
      vim.cmd("quit")
    end
  end,
})
