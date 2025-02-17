vim.keymap.set("x", "gaa", function() require("align").align_to_string({
    preview = true,
    regex = false
    })
end)

vim.keymap.set("x", "gac", function() require("align").align_to_char({
    preview = true,
    regex = false
    })
end)

vim.keymap.set("x", "gar", function() require("align").align_to_string({
    preview = true,
    regex = true
    })
end)

