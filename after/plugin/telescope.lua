require('telescope').setup {
    defaults = {},
    pickers = {
        find_files = {
            theme = "dropdown",
            layout_config = {
                width = 0.25,
                height = 0.25,
            },
        }
    },
    extensions = {}
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})

-- show usages of the word under the cursor
vim.keymap.set('n', '<leader>gu', builtin.lsp_references, {}) -- this uses `gu` like the goto keymap since this makes more sense like that

-- global grep search
vim.keymap.set('n', '<leader>pf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- looking to do another keymap like the above grep one, this time we are going to use the currently highlighted word as the search term
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)

-- get a list of function definitions in the current file
vim.keymap.set('n', '<leader>pd', builtin.lsp_document_symbols, {})

vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>cos', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})
