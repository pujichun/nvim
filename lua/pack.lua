local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}) --默认地址
end
vim.cmd [[packadd packer.nvim]]
return require("packer").startup(
  {
    function()
      use "wbthomason/packer.nvim" -- Packer can manage itself

      use "pujichun/nvim-deus" -- colorscheme

      use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

      -- lsp
      use "neovim/nvim-lspconfig" -- enable LSP
      use "williamboman/nvim-lsp-installer" -- simple to use language server installer
      use "kkharji/lspsaga.nvim"
      use {
        "j-hui/fidget.nvim",
        config = function()
          require("fidget").setup {}
        end
      }
      use "ray-x/lsp_signature.nvim"

      -- cmp
      use "hrsh7th/nvim-cmp"
      use "hrsh7th/cmp-buffer" -- buffer completions
      use "hrsh7th/cmp-path" -- path completions
      use "hrsh7th/cmp-cmdline" -- cmdline completions
      use "saadparwaiz1/cmp_luasnip" -- snippet completions
      use "L3MON4D3/LuaSnip"
      use "hrsh7th/cmp-nvim-lsp"
      use "hrsh7th/cmp-nvim-lua"
      use "f3fora/cmp-spell" -- spell check
      use "rafamadriz/friendly-snippets"

      use "lukas-reineke/indent-blankline.nvim"
      use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
      }

      use {
        "kyazdani42/nvim-tree.lua",
        requires = {
          "kyazdani42/nvim-web-devicons" -- optional, for file icon
        }
      }
      use "lewis6991/gitsigns.nvim"

      use "feline-nvim/feline.nvim"

      use {
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "kyazdani42/nvim-web-devicons"
      }

      -- use {
      --   'romgrk/barbar.nvim',
      --   requires = {'kyazdani42/nvim-web-devicons'}
      -- }

      use {
        "numToStr/Comment.nvim",
        config = function()
          require("Comment").setup()
        end
      }
      use "glepnir/dashboard-nvim"
      use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
      }
      use "nvim-telescope/telescope-ui-select.nvim"

      use "yamatsum/nvim-cursorline"

      use "norcalli/nvim-colorizer.lua"
      use {
        "lewis6991/spellsitter.nvim",
        config = function()
          require("spellsitter").setup()
        end
      }

      use "tpope/vim-surround"
      use "gcmt/wildfire.vim"
      use "mg979/vim-visual-multi"

      use "mhartington/formatter.nvim"

      use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
      }
      use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {}
        end
      }
      use 'folke/lsp-colors.nvim'
      use "Iron-E/nvim-highlite"
    end,
    config = {
      max_jobs = 16,
      git = {
        default_url_format = "https://github.com/%s"
      },
      display = {
        open_fn = function()
          return require("packer.util").float({border = "single"})
        end
      }
    }
  }
)
