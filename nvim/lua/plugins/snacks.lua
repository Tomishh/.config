return {
 "folke/snacks.nvim",
 opts = {
  bigfile = {
   enabled = true,
   setup = function(ctx)
    -- defaults
    if vim.fn.exists(":NoMatchParen") ~= 0 then
     vim.cmd([[NoMatchParen]])
    end
    Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
    vim.b.minianimate_disable = true
    vim.b.minihipatterns_disable = true
    vim.schedule(function()
     if vim.api.nvim_buf_is_valid(ctx.buf) then
      vim.bo[ctx.buf].syntax = ctx.ft
     end
    end)

    -- mine
    vim.b.completion = false
    vim.b.minidiff_disable = true
    if vim.fn.exists(":UfoDetach") ~= 0 then
     vim.cmd("UfoDetach")
    end
   end,
  },
  dashboard = {
   enabled = true,
   preset = {
    keys = {
     { icon = " ", key = "n", desc = "New File", action = ":ene" },
     {
      icon = "󰥨 ",
      key = "f",
      desc = "Find File",
      action = function()
       Snacks.dashboard.pick("files", { cwd = "." })
      end,
     },
     {
      icon = "󰈞 ",
      key = "g",
      desc = "Find Text",
      action = function()
       Snacks.dashboard.pick("live_grep")
      end,
     },
     {
      icon = " ",
      key = "r",
      desc = "Recent Files",
      action = function()
       Snacks.dashboard.pick("oldfiles")
      end,
     },
     {
      icon = " ",
      key = "c",
      desc = "Config",
      action = function()
       require("utils.general").in_yadm_env(function(yadm_repo)
        Snacks.dashboard.pick("git_files", { cwd = yadm_repo })
       end)
      end,
     },
     {
      icon = " ",
      key = "p",
      desc = "Plugins",
      action = function()
       Snacks.picker.lazy()
      end,
     },
     { icon = " ", key = "s", desc = "Restore Session", section = "session" },
     { icon = " ", key = "q", desc = "Quit", action = ":quit" },
    },
   },
   sections = {
    function()
     return {
      header = require("modules.dashboard").header,
      padding = 1,
      pane = 1,
     }
    end,
    {
     pane = 1,
     section = "terminal",
     cmd = "curl -s 'https://wttr.in/?0FQ' | sed 's/^/               /' || echo -n",
     height = 6,
    },
    { pane = 1, section = "startup" },
    { pane = 2, section = "keys", padding = 1 },
    {
     pane = 2,
     icon = " ",
     title = "RECENT FILES",
     section = "recent_files",
     indent = 2,
     padding = 1,
    },
    { pane = 2, icon = "󰙅 ", title = "PROJECTS", section = "projects", indent = 2, padding = 1 },
    {
     pane = 2,
     section = "terminal",
     enabled = function()
      return Snacks.git.get_root() == nil
     end,
     cmd = "cmatrix -br",
     height = 6,
     indent = 2,
     padding = 1,
    },
   },
  },
  dim = {
   enabled = true,
  },
  indent = { enabled = true },
  input = { enabled = true },
  lazygit = {
   enabled = true,
  },
  notifier = { enabled = false, style = "fancy" },
  picker = {
   enabled = true,
   sources = {
    explorer = {
     auto_close = true,
     hidden = true,
    },
    files = {
     hidden = true,
    },
   },
   matcher = {
    frecency = true,
   },
   on_show = function()
    require("nvim-treesitter")
   end,
  },
  quickfile = { enabled = true },
  statuscolumn = {
   left = { "git" }, -- priority of signs on the left (high to low)
   right = { "sign", "mark", "fold" }, -- priority of signs on the right (high to low)
   folds = {
    open = true, -- show open fold icons
    git_hl = false, -- use Git Signs hl for fold icons
   },
   git = {
    -- patterns to match Git signs
    patterns = { "GitSign", "MiniDiffSign" },
   },
   refresh = 50, -- refresh at most every 50ms
  },
  styles = {
   dashboard = {
    height = 0.8,
    width = 0.8,
    border = "rounded",
   },
   lazygit = {
    border = "rounded",
   },
   terminal = {
    border = "rounded",
   },
  },
  words = { enabled = false },
 },
 init = function()
  vim.api.nvim_create_autocmd("User", {
   pattern = "VeryLazy",
   callback = function()
    Snacks.toggle.dim():map("<leader>uDt")
   end,
  })
 end,
}
