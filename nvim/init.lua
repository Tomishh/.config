-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
 extension = {
  yml = "yaml.ansible",
  yaml = "yaml.ansible",
 },
 pattern = {
  [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
  [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
  [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
 },
})
