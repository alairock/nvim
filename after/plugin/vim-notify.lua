-- Notifiactions
local notify = require 'notify'
notify.setup {
  fps = 60,
  level = 'ERROR',
}
vim.notify = notify

-- Noice
if not vim.g.neovide then
  require('noice').setup {
    cmdline = {
      format = {
        cmdline = { title = '', icon = '  ' },
        lua = { title = '', icon = ' 󰢱 ' },
        help = { title = '', icon = ' 󰋖 ' },
        input = { title = '', icon = '  ' },
        filter = { title = '', icon = '  ' },
        search_up = { icon = '    ' },
        search_down = { icon = '    ' },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = 'rounded',
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = 'NormalFloat:PopupNormal,FloatBorder:PopupBorder',
        },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      signature = {
        enabled = false,
      }
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
  }
end
