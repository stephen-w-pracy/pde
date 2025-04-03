-- modtime.lua
--
-- Provides the `:Modtime` command to display the last modified time of the current file.
--
-- Usage:
--   :Modtime       -- Print formatted file modification time
--   :Modtime rel   -- Print relative time since file was last modified
--
-- Automatically loads when required via: `require('config.modtime')`

local function get_modtime(filepath)
  local stat = vim.loop.fs_stat(filepath)
  if not stat then return nil end
  return stat.mtime.sec
end

local function format_modtime(timestamp)
  return os.date("%A, %B %d, %Y, %I:%M:%S %p %Z", timestamp)
end

local function relative_time(timestamp)
  local delta = os.time() - timestamp
  local abs_delta = math.abs(delta)

  local units = {
    { name = "month", secs = 2592000 },
    { name = "week", secs = 604800 },
    { name = "day", secs = 86400 },
    { name = "hour", secs = 3600 },
    { name = "minute", secs = 60 },
    { name = "second", secs = 1 },
  }

  for _, unit in ipairs(units) do
    if abs_delta >= unit.secs then
      local value = math.floor(abs_delta / unit.secs)
      local label = value == 1 and unit.name or unit.name .. "s"
      return string.format("%d %s %s", value, label, delta >= 0 and "ago" or "from now")
    end
  end

  return "just now"
end

vim.api.nvim_create_user_command("Modtime", function(opts)
  local filepath = vim.api.nvim_buf_get_name(0)
  local timestamp = get_modtime(filepath)
  if not timestamp then
    print("Could not get file mod time")
    return
  end

  if opts.args == "rel" then
    print(relative_time(timestamp))
  else
    print(format_modtime(timestamp))
  end
end, {
  nargs = "?",
  complete = function() return { "rel" } end,
})

