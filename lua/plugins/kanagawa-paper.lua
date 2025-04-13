return {
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false, -- Queremos que se cargue inmediatamente
    priority = 1000, -- Alta prioridad para asegurar que se aplique antes que otros temas
    config = function()
      require("kanagawa-paper").setup {
        -- Opciones de configuración (opcional)
        -- Por ejemplo, puedes ajustar transparencias o estilos
        transparent = false,
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true, bold = true },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = true },
      }
    end,
  },
}
