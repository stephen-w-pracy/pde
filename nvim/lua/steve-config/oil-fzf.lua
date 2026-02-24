local M = {}

local function assert_oil_buf()
  if vim.bo.filetype ~= "oil" then
    vim.notify("This mapping is Oil-only (open Oil first).", vim.log.levels.WARN)
    return false
  end
  return true
end

local function get_oil_dir()
  local ok_oil, oil = pcall(require, "oil")
  if ok_oil and oil and oil.get_current_dir then
    local dir = oil.get_current_dir()
    if dir and dir ~= "" then return dir end
  end

  -- Fallback *only for Oil buffers* if API isn't available
  local name = vim.api.nvim_buf_get_name(0)
  local dir = name:gsub("^oil://", "")
  if dir ~= "" then return dir end

  vim.notify("Could not determine Oil directory.", vim.log.levels.ERROR)
  return nil
end

function M.files()
  if not assert_oil_buf() then return end

  local ok_fzf, fzf = pcall(require, "fzf-lua")
  if not ok_fzf then
    vim.notify("fzf-lua not found", vim.log.levels.ERROR)
    return
  end

  local cwd = get_oil_dir()
  if not cwd then return end

  fzf.files({
    cwd = cwd,
    prompt = ("files> (%s) "):format(vim.fn.fnamemodify(cwd, ":~")),
  })
end

function M.live_grep()
  if not assert_oil_buf() then return end

  local ok_fzf, fzf = pcall(require, "fzf-lua")
  if not ok_fzf then
    vim.notify("fzf-lua not found", vim.log.levels.ERROR)
    return
  end

  local cwd = get_oil_dir()
  if not cwd then return end

  fzf.live_grep({
    cwd = cwd,
    prompt = ("rg> (%s) "):format(vim.fn.fnamemodify(cwd, ":~")),
  })
end

return M

