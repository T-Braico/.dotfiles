local builtins = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtins.find_files, {})
vim.keymap.set("n", "<leader>gf", builtins.git_files, {})
vim.keymap.set("n", "<leader>ps", builtins.grep_string, {})
