vim.cmd "highlight clear"
vim.o.background = "light"
vim.g.colors_name = "ghibli"

local set = vim.api.nvim_set_hl

-- Base
set(0, "Normal", { fg = "#2f2f2f", bg = "#f6f1e9" })
set(0, "Cursor", { fg = "#f6f1e9", bg = "#5e5e5e" })
set(0, "Visual", { bg = "#d1c089" })
set(0, "LineNr", { fg = "#a4a69d" })
set(0, "CursorLineNr", { fg = "#607d8b", bold = true })
set(0, "Comment", { fg = "#a4a69d", italic = true })

-- Syntax
set(0, "Identifier", { fg = "#4c9a2a" })
set(0, "Function", { fg = "#4c9a2a" })
set(0, "Keyword", { fg = "#607d8b", bold = true })
set(0, "String", { fg = "#b38a58" })
set(0, "Number", { fg = "#7f6a93" })
set(0, "Constant", { fg = "#d57a66" })
set(0, "Type", { fg = "#9dbebb" })
set(0, "Statement", { fg = "#607d8b" })

-- UI
set(0, "StatusLine", { fg = "#2f2f2f", bg = "#d1c089" })
set(0, "Pmenu", { fg = "#2f2f2f", bg = "#eae2d8" })
set(0, "PmenuSel", { fg = "#f6f1e9", bg = "#9dbebb" })

-- Diagnostics
set(0, "DiagnosticError", { fg = "#c14646" })
set(0, "DiagnosticWarn", { fg = "#e3a857" })
set(0, "DiagnosticInfo", { fg = "#659dbd" })
set(0, "DiagnosticHint", { fg = "#a4a69d" })
