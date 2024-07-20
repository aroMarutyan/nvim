local vim = vim;

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

return require('lazy').setup({
  -- Simple plugins can be specified as strings
  'rstacruz/vim-closer',

  -- Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',

    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        "isak102/telescope-git-file-history.nvim",
        dependencies = { "tpope/vim-fugitive" }
      }
    }
  },

  -- Comments 
  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  },

  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  "sindrets/diffview.nvim",
  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'f-person/git-blame.nvim',


  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  -- Theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- config = function()
    --   local vimLocal = vim;
    -- end
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },

  -- Icons diffview(?)
  'nvim-tree/nvim-web-devicons',

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  {
    "williamboman/mason.nvim"
  },

  -- scope lines nad etc.
 --  {
 --    'lukas-reineke/indent-blankline.nvim',
 --    main = 'ibl',
 --    opts = {}
 -- }
})
