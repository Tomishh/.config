return {
 {
  "folke/flash.nvim",
  keys = {
   { "s", mode = { "n", "x", "o" }, false },
   {
    "dfl;jkdflgj",
    mode = { "n", "x", "o" },
    function()
     require("flash").jump()
    end,
    desc = "Flash",
   },
  },
 },
}
