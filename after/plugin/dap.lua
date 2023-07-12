require("dapui").setup()
require('dap-go').setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
vim.fn.sign_define('DapBreakpoint', { text = '•', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', '<leader>bv', require 'dap'.continue)
vim.keymap.set('n', '<leader>bo', require 'dap'.step_over)
vim.keymap.set('n', '<leaber>bn', require 'dap'.step_into)
vim.keymap.set('n', '<leader>bt', require 'dap'.step_out)
vim.keymap.set('n', '<leader>bb', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>bu', require 'dapui'.toggle)


dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  vim.defer_fn(function()
    callback({ type = "server", host = "127.0.0.1", port = port })
  end, 100)
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug main",
    request = "launch",
    -- root of the project
    program = "${workspaceFolder}",
  },
  -- convert this to configuration:
  -- Starting: /Users/alairock/go/bin/dlv dap --listen=127.0.0.1:54079 --log-dest=3 from /Users/alairock/h2/backend/tests
  {
    type = "go",
    name = "Debug test",     -- configuration name
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}/tests",     -- this configuration will start main.go program in debug mode
    dapMode = "dap",
  },
}
