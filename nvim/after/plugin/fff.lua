vim.g.floaterm_position = 'bottom'
vim.g.floaterm_width = .99
vim.g.floaterm_height = 0.4

vim.keymap.set("n", "<leader>tf", ":FloatermNew fff<CR>")
vim.keymap.set("n", "<leader>tt", vim.cmd.FloatermNew)

