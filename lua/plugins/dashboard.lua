local home = os.getenv('HOME')
vim.g.dashboard_footer_icon = '🐬🐧🦈 '
vim.g.dashboard_preview_command = 'cat'
vim.g.dashboard_preview_pipeline = 'lolcat'
vim.g.dashboard_preview_file = home .. '/neovim.cat'
vim.g.dashboard_preview_file_height = 11
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_default_executive = 'telescope'

