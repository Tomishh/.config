return {
 {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = function(_, opts)
   return {}
  end,
 },
 {
  "tzachar/highlight-undo.nvim",
  opts = {
   hlgroup = "HighlightUndo",
   duration = 300,
   pattern = { "*" },
   ignored_filetypes = { "neo-tree", "fugitive", "TelescopePrompt", "mason", "lazy" },
   -- ignore_cb is in comma as there is a default implementation. Setting
   -- to nil will mean no default os called.
   -- ignore_cb = nil,
  },
 },
 {
  "tadaa/vimade",
  opts = {
   recipe = { "default", { animate = true } },
   fadelevel = 0.2,
  },
 },
 {
  "cappyzawa/trim.nvim",
  opts = {},
 },
}
