local function printAbsPath()
    print(vim.fn.expand('%:p'))
end

vim.api.nvim_create_user_command("AbsPath", printAbsPath, {
    nargs = 0,
    desc = "Print the current absolute file path",
})
