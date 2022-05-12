require("formatter").setup(
  {
    filetype = {
      json = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote"},
            stdin = true
          }
        end
      },
      sh = {
        -- Shell Script Formatter https://github.com/mvdan/sh
        -- install go install mvdan.cc/sh/v3/cmd/shfmt@latest
        function()
          return {
            exe = "shfmt",
            args = {"-i", 4},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt https://github.com/trixnz/lua-fmt
        -- install npm install -g lua-fmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      go = {
        function()
          return {
            exe = "gofmt",
            stdin = true
          }
        end,
        function()
          return {
            exe = "goimports",
            args = {"-w", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
            stdin = false
          }
        end
      },
      python = {
        function()
          return {
            exe = "python3 -m autopep8",
            args = {
              "--in-place --aggressive --aggressive",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
            },
            stdin = false
          }
        end
      },
      proto = {
        function()
          return {
            exe = "clang-format",
            args = {"--style","file", "-i"},
            stdin = false
          }
        end
      }
    }
  }
)
