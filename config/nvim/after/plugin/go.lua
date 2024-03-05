local format_sync_group = vim.api.nvim_create_augroup('GoFormat', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    group = format_sync_group,
    pattern = '*.go',
    callback = function()
        require('go.format').goimport()
    end,
})



vim.keymap.set("n", "<leader>gst", vim.cmd.GoFillStruct)
vim.keymap.set("n", "<leader>gsw", vim.cmd.GoFillSwitch)
vim.keymap.set("n", "<leader>gie", vim.cmd.GoIfErr)
vim.keymap.set("n", "<leader>gfp", vim.cmd.GoFixPlurals)

vim.keymap.set("n", "<leader>gr", vim.cmd.GoRun)

vim.keymap.set("n", "<leader>gi", ":GoImpl ")
vim.keymap.set("n", "<leader>gd", ":GoDoc ")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup {
    lsp_cfg = {
        capabilities = capabilities
    }
}
