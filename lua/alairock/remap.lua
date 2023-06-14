
vim.g.mapleader = " " -- set leader key to space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open ex mode
vim.keymap.set("n", "<leader>pt", ":NvimTreeToggle<CR>") -- toggle nvim tree

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up and down in visual mode

vim.keymap.set("n", "J", "mzJ`z") -- join lines without spaces
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half a page
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up half a page
vim.keymap.set("n", "n", "nzzzv") -- center search results
vim.keymap.set("n", "N", "Nzzzv") -- center search results


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over selection

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy to clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete without yanking

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>") -- escape with ctrl-c

vim.keymap.set("n", "Q", "<nop>") -- disable ex mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- open tmux sessionizer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- reformat current file

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- quickfix list navigation
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") -- quickfix list navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- location list navigation
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- location list navigation

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word under cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make file executable

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>"); -- open packer config
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"); -- make it rain

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

