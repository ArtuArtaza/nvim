-- -- if true return {}
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    -- opts = {
    --   provider = "openai",
    --   auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
    --   openai = {
    --     endpoint = "http://localhost:1234/v1",
    --     model = "qwen2.5-coder-14b-instruct",
    --     timeout = 30000, -- Timeout in milliseconds
    --     temperature = 0,
    --     max_tokens = 4096,
    --     -- -- optional
    --     -- api_key_name = "elpepe", -- default OPENAI_API_KEY if not set
    --   },
    -- },
    opts = {
      provider = "openai",
      gemini = {},

      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "o3-mini",
      },

      vendors = {
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1",
          model = "meta-llama/llama-4-scout-17b-16e-instruct",
        },

        geminiflash = {
          __inherited_from = "openai",
          endpoint = "https://generativelanguage.googleapis.com/v1beta/openai",
          api_key_name = "GEMINI_API_KEY",
          model = "gemini-2.5-pro-exp-03-25",
        },
      },
      -- gemini-2.5-pro-exp-03-25
      -- openai = "https"
      -- openai = {
      --   endpoint = "http://127.0.0.1:1234/v1",
      --   model = "qwen2.5-coder-14b-instruct",
      -- },
      -- sidebar = {
      --   apply_all = "A",
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
