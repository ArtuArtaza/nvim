return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "codellama",
    init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  },
  requires = {
    "MunifTanjim/nui.nvim", -- Añadir nui.nvim como dependencia
  },
}
