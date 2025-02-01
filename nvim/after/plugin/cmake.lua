vim.keymap.set("n", "<leader>cg", vim.cmd.CMakeGenerate)
vim.keymap.set("n", "<leader>cb", vim.cmd.CMakeBuild)

vim.keymap.set("n", "<leader>gc", vim.cmd.GTestRunUnderCursor)

vim.g.cmake_link_compile_commands = 1
