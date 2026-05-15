vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg="#41c9eb", bold=true })
    vim.api.nvim_set_hl(0, "LineNr", { fg="white", bold=true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg="#ff5555", bold=true })
  end,
})
