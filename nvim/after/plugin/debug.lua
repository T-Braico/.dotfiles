local cfg = {
    codelldb_path = '/home/trevor/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
    configurations = {
        cpp = {
            {
                name = "Launch debugger",
                type = "lldb",
                request = "launch",
                cwd = "${workspaceFolder}",
                program = function()
                    -- Build with debug symbols
                    -- local out = vim.fn.system({"make", "debug"})
                    -- Check for errors
                    -- if vim.v.shell_error ~= 0 then
                    --    vim.notify(out, vim.log.levels.ERROR)
                    --    return nil
                    -- end
                    -- Return path to the debuggable program
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
            },
        },
    },
}

require("dap-lldb").setup(cfg)

vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>dr", vim.cmd.DapContinue)
vim.keymap.set("n", "<leader>do", vim.cmd.DapStepOver)
vim.keymap.set("n", "<leader>di", vim.cmd.DapStepInto)

