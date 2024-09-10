if true then return {} end
return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      -- Importa utilidades de heirline y otras necesarias
      local utils = require "heirline.utils"
      local conditions = require "heirline.conditions"

      -- Definir la función para personalizar el nombre del archivo
      local FileName = {
        init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
        provider = function(self)
          local filename = self.filename
          -- Patrón que matchea cualquier archivo dentro de "app" que contenga "page.tsx"
          -- vim.notify("Filename: " .. filename)
          print("FIlename:", filename)
          if filename then
            local page_pattern = ".*/app/.*/page%.tsx$"
            local layout_pattern = ".*/app/.*/layout%.tsx$"

            -- Verificar si el nombre del archivo coincide con el patrón

            local page_match = string.match(filename, page_pattern)
            local layout_match = string.match(filename, layout_pattern)

            if page_match then
              local name = vim.fn.fnamemodify(page_match, ":p:h:t")
              return string.format("%s - page", name)
            elseif layout_match then
              local name = vim.fn.fnamemodify(layout_match, ":p:h:t")
              return string.format("%s - layout", name)
            else
              filename = vim.fn.fnamemodify(filename, ":.")
              if filename == "" then return "[No Name]" end
              if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
              return filename
            end
          end
          return "[No Name]"
        end,
        hl = { fg = utils.get_highlight("Directory").fg },
      }

      local FileNameBlock = {
        init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
      }

      local FileIcon = {
        init = function(self)
          local filename = vim.api.nvim_buf_get_name(0)
          local extension = vim.fn.fnamemodify(filename, ":e")
          self.icon, self.icon_color =
              require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        end,
        provider = function(self) return self.icon and (self.icon .. " ") end,
        hl = function(self) return { fg = self.icon_color } end,
      }

      local FileNameModifier = {
        hl = function()
          if vim.bo.modified then return { fg = "cyan", bold = true, force = true } end
        end,
      }

      local CloseButton = {
        provider = "x",
        hl = { fg = "red" },
        on_click = {
          callback = function() vim.cmd "bdelete!" end,
          name = "heirline_close_buffer",
        },
      }

      FileNameBlock = utils.insert(
        { provider = " " },
        FileNameBlock,
        FileIcon,
        utils.insert(FileNameModifier, FileName),
        { provider = " " },
        CloseButton,
        { provider = "%<" }
      )

      opts.tabline = {
        FileNameBlock,
      }
    end,
  },
}
