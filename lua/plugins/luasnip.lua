return {
  "L3MON4D3/LuaSnip",

  build = "make install_jsregexp",
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)

    -- load snippets paths using package.json
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }

    -- load snippets path using lua
    require("luasnip.loaders.from_lua").load { paths = { vim.fn.stdpath "config" .. "/snippets" } }
  end,
}
