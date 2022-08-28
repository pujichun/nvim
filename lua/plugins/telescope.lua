local status_ok, actions = pcall(require, "telescope.actions")
if not status_ok then
  vim.notify("telescope not found!")
  return
end

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("telescope not found!")
  return
end

local keybind = {
  i = {
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-c>"] = actions.close,
    ["<Down>"] = actions.move_selection_next,
    ["<Up>"] = actions.move_selection_previous,
    ["<CR>"] = actions.select_default,
    ["<C-x>"] = actions.select_horizontal,
    ["<C-v>"] = actions.select_vertical,
    ["<C-t>"] = actions.select_tab,
    ["<C-u>"] = actions.preview_scrolling_up,
    ["<C-d>"] = actions.preview_scrolling_down,
    ["<PageUp>"] = actions.results_scrolling_up,
    ["<PageDown>"] = actions.results_scrolling_down,
    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    ["<C-l>"] = actions.complete_tag
  },
  n = {
    ["<esc>"] = actions.close,
    ["<CR>"] = actions.select_default,
    ["<C-x>"] = actions.select_horizontal,
    ["<C-v>"] = actions.select_vertical,
    ["<C-t>"] = actions.select_tab,
    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    ["j"] = actions.move_selection_next,
    ["k"] = actions.move_selection_previous,
    ["M"] = actions.move_to_middle,
    ["L"] = actions.move_to_bottom,
    ["<Down>"] = actions.move_selection_next,
    ["<Up>"] = actions.move_selection_previous,
    ["gg"] = actions.move_to_top,
    ["G"] = actions.move_to_bottom,
    ["<C-u>"] = actions.preview_scrolling_up,
    ["<C-d>"] = actions.preview_scrolling_down,
    ["<PageUp>"] = actions.results_scrolling_up,
    ["<PageDown>"] = actions.results_scrolling_down
  }
}

telescope.setup {
  defaults = {
    mappings = keybind,
    file_ignore_patterns = {
      "package-lock.json",
      "node_modules",
      "target",
      ".idea",
      ".vscode",
      "venv",
      "yarn.lock",
      "go.mod"
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      find_command = {"fd"}
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown{}

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}

require("telescope").load_extension("ui-select")
