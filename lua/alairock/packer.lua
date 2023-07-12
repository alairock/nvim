-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope context menus and modals
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- vim movements
  use("folke/flash.nvim")

  -- pretty errors
  use({
    "folke/trouble.nvim", -- pretty list of errors
    config = function()
      require("trouble").setup {
        icons = false,
      }
    end
  })

  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  }

  -- notifications
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  }


  -- file manaegement
  use('nvim-tree/nvim-tree.lua')     -- file explorer
  use('nvim-tree/nvim-web-devicons') -- file explorer icons


  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end, }
  use("nvim-treesitter/playground")               -- treesitter playground
  use("nvim-treesitter/nvim-treesitter-context"); -- show context

  use("theprimeagen/harpoon")                     -- bookmarks
  use("theprimeagen/refactoring.nvim")            -- refactoring

  -- file state and history management
  use("mbbill/undotree")         -- undo tree
  use("tpope/vim-fugitive")      -- git
  use("lewis6991/gitsigns.nvim") -- git symbols in margin

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use { "ray-x/lsp_signature.nvim", }

  -- bufferline and statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  -- code completion
  use("Exafunction/codeium.vim")

  -- fun stuff
  use("folke/zen-mode.nvim")             -- zen mode
  use("eandrju/cellular-automaton.nvim") -- game of life
  use({
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup({
        screensaver = 1000,
        filetypes = {},
      })
    end,
  })

  -- terminal overlay
  use("numToStr/FTerm.nvim")

  -- debugging
  use("leoluz/nvim-dap-go")
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")

  -- get rid of buffers after a while
  use {
    "chrisgrieser/nvim-early-retirement",
    config = function() require("early-retirement").setup() end,
  }

  -- window and session management
  use("sindrets/winshift.nvim")
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  }

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- database
  use {
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion"
    },
  }
end)
