local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp-installer")
-- require("lsp.lsp-saga")
require("lsp.config").setup()

vim.cmd([[ autocmd CursorHold,CursorHoldI * lua require('lsp.code_action').code_action_listener()]])
