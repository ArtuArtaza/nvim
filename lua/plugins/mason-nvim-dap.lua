return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    ensure_installed = { "node2", "chrome" },
    handlers = {
      node2 = function(source_name)
        local dap = require "dap"
        dap.adapters.node2 = {
          type = "executable",
          command = "node",
          args = { vim.fn.stdpath "data" .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
        }

        dap.configurations.javascript = {
          {
            name = "Launch current file (Node)",
            type = "node2",
            request = "launch",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
          },
          {
            name = "Attach to Node process",
            type = "node2",
            request = "attach",
            processId = require("dap.utils").pick_process,
            cwd = vim.fn.getcwd(),
          },
        }

        dap.configurations.typescript = {
          {
            name = "Launch NestJS (start:debug)",
            type = "node2",
            request = "launch",
            runtimeExecutable = "pnpm",
            runtimeArgs = { "run", "start:debug", "--", "--inspect-brk" },
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            restart = true,
            port = 9229,
            autoAttachChildProcesses = true,
          },
          {
            name = "Attach to NestJS (9229)",
            type = "node2",
            request = "attach",
            port = 9229,
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
          },
        }

        dap.configurations.typescriptreact = {
          {
            name = "Attach to Bun (Experimental)",
            type = "chrome",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            port = 6499,
            webRoot = vim.fn.getcwd(),
          },
        }

        dap.configurations.typescript = vim.list_extend(dap.configurations.typescript, dap.configurations.javascript)
        vim.keymap.set("v", "<leader>dw", function()
          local dap = require "dap"
          -- Yank visual selection to register v
          vim.cmd 'normal! "vy'
          local expr = vim.fn.getreg "v"
          dap.add_watch(expr)
        end, { desc = "DAP: Add selection to Watch", noremap = true, silent = true })
      end,
    },
  },

  -- config = function()
  --   vim.keymap.set("v", "<leader>dw", function()
  --     local dap = require "dap"
  --     -- Yank visual selection to register v
  --     vim.cmd 'normal! "vy'
  --     local expr = vim.fn.getreg "v"
  --     dap.add_watch(expr)
  --   end, { desc = "DAP: Add selection to Watch", noremap = true, silent = true })
  -- end,
}
