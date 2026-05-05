-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_create_autocmd("FileType", {
 pattern = "yaml.ansible",
 callback = function()
  vim.keymap.set("n", "<leader>vd", ":VaultDecrypt<CR>", { buffer = true, desc = "Vault Decrypt" })
  vim.keymap.set("n", "<leader>ve", ":VaultEncrypt<CR>", { buffer = true, desc = "Vault Encrypt" })
 end,
})
