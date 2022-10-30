local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lspconfig not found!")
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local servers = {
  "pyright",
  "gopls",
  "sumneko_lua",
  "yamlls",
  "clangd",
  "cssls",
  "html",
  "jsonls",
  "tsserver"
  "rust_analyzer"
}
local cfg = {
  ensure_installed = servers, -- ensure these servers are always installed
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

lsp_installer.settings(cfg)

for _, server_name in pairs(servers) do
  local opts = {
    on_attach = require("lsp.config").on_attach,
    capabilities = require("lsp.config").capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
  local server_available, server = lsp_installer.get_server(server_name)
  if server_available then
    server:on_ready(
      function()
        if server.name == "sumneko_lua" then
          local sumneko_opts = require("lsp.lsp.sumneko_lua")
          opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        end
        server:setup(opts)
      end
    )
    if not server:is_installed() then
      vim.notify("install language server: " .. server_name, vim.log.levels.WARN, {title = "Language Server"})
      server:install()
    end
  end
end
