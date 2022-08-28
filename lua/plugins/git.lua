require("gitsigns").setup(
  {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      map({"n", "v"}, "<leader>gs", ":Gitsigns stage_hunk<CR>")
      map({"n", "v"}, "<leader>gr", ":Gitsigns reset_hunk<CR>")
      map({"n", "v"}, "<leader>gk", ":Gitsigns prev_hunk<CR>")
      map({"n", "v"}, "<leader>gj", ":Gitsigns next_hunk<CR>")
      map("n", "<leader>gS", gs.stage_buffer)
      map("n", "<leader>gu", gs.undo_stage_hunk)
      map("n", "<leader>gR", gs.reset_buffer)
      map("n", "<leader>gp", gs.preview_hunk)
      map(
        "n",
        "<leader>gb",
        function()
          gs.blame_line {full = true}
        end
      )
      map("n", "<leader>gd", gs.diffthis)
    end
  }
)

