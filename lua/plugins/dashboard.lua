local db = require("dashboard")
local home = os.getenv("HOME")

db.setup(
  {
    theme = "doom",
    config = {
      header = {}, --your header
      center = {
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Find file                           ",
          desc_hl = "String",
          action = "Telescope find_files",
          key = "ff",
          key_hl = "Number"
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Recently files                      ",
          desc_hl = "String",
          action = "Telescope oldfiles",
          key = "rf",
          key_hl = "Number"
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Browser Files",
          desc_hl = "String",
          shortcut = "SPC s p",
          key = "fw",
          action = "Telescope file_browser",
          key_hl = "Number"
        },
        {
          icon = "  ",
          icon_hl = "Title",
          desc = "Quit",
          desc_hl = "String",
          key = "q",
          keymap = "",
          action = "quit",
          key_hl = "Number"
        }
      },
      footer = {"", "🎉 Have fun with neovim"} --your footer
    },
    preview = {
      command = "cat", -- preview command
      file_path = home .. "/.config/nvim/neovim.cat", -- preview file path
      file_height = 11, -- preview file height
      file_width = 80 -- preview file width
    }
  }
)
