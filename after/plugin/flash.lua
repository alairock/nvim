require("flash").setup()
vim.keymap.set("n", "<leader>ft", ":lua require('flash').toggle()<CR>")

vim.keymap.set("n", "s", ":lua require(\"flash\").jump()<CR>")
vim.keymap.set("n", "S", ":lua require(\"flash\").treesitter()<CR>")

local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
  vim.keymap.set({ "n", "x", "o" }, motion, function()
    require("flash").jump(Config.get({
      mode = "char",
      search = {
        mode = Char.mode(motion),
        max_length = 1,
      },
    }, Char.motions[motion]))
  end)
end
