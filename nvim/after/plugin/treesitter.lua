local Trevor_Treesitter = vim.api.nvim_create_augroup("Trevor_Treesitter", {})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = Trevor_Treesitter,
    pattern = "*",
    callback = function ()
        vim.cmd("TSBufEnable highlight")
    end,
})
