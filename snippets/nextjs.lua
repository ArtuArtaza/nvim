-- snippets/nextjs.lua

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename_to_pascal()
  local filename = vim.fn.expand "%:t:r" -- Obtener el nombre del archivo sin la extensión
  return filename
      :gsub("(%a)(%w*)", function(a, b) return a:upper() .. b:lower() end)
      :gsub("[-_](%a)", function(c) return c:upper() end)
      :gsub("[-_]", "")
end

local props_interface = {
  t "interface",
  f(function() return filename_to_pascal() .. "Props" end, {}),
  t { "{}", "" },
}

local create_client_component_snippet = s("ccmp", {
  t { "'use client';", "" },
  t "interface ",
  f(function() return filename_to_pascal() .. "Props" end, {}),
  t { " {", "  // define your props here", "}", "" },
  t "export default function ",
  f(filename_to_pascal, {}),
  t { "({}: " },
  f(function() return filename_to_pascal() .. "Props" end, {}),
  t { ") {", "  return (", "    <div> Hello world </div>", "  );", "}", "" },
})

-- Snippets para TypeScript y TypeScript con JSX
ls.add_snippets("typescript", {
  create_client_component_snippet,
})

ls.add_snippets("typescriptreact", {
  create_client_component_snippet,
})
