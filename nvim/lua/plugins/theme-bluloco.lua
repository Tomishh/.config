return {
 -- On ajoute le plugin bluloco
 {
  "uloco/bluloco.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
   require("bluloco").setup({
    style = "dark",
    transparent = false,
    italics = false,
    terminal = vim.fn.has("gui_running") == 1,
    guicursor = true,
    rainbow_headings = true,
    float_window = "default",
   })

   -- On applique le colorscheme après le setup
   vim.opt.termguicolors = true
   vim.cmd("colorscheme bluloco-dark")
  end,
 },

 -- Optionnel : On force LazyVim à utiliser bluloco par défaut
 -- (utile si d'autres plugins essaient de charger un autre thème)
 {
  "LazyVim/LazyVim",
  opts = {
   colorscheme = "bluloco-dark",
  },
 },
}
