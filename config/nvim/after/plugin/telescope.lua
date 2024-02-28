local builtins = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtins.find_files, {})
vim.keymap.set("n", "<leader>gf", builtins.git_files, {})
vim.keymap.set("n", "<leader>ps", builtins.live_grep, {})
vim.keymap.set("n", "<leader>cm", builtins.commands, {})
vim.keymap.set("n", "<leader>co", builtins.colorscheme, {})
vim.keymap.set("n", "<leader>sh", builtins.keymaps, {})
