local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr) ---@diagnostic disable-line
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
end

local kotlin_root_markers = {
  'settings.gradle',
  'settings.gradle.kts',
  'pom.xml',
  'gradlew',
  'gradlew.bat',
  'build.gradle',
  'build.gradle.kts',
  'workspace.json',
}

local function path_join(...)
  return table.concat({ ... }, '/')
end

local function path_exists(path)
  return vim.uv.fs_stat(path) ~= nil
end

local function read_file(path)
  local fd = vim.uv.fs_open(path, 'r', 438)
  if not fd then
    return nil
  end

  local stat = vim.uv.fs_fstat(fd)
  if not stat then
    vim.uv.fs_close(fd)
    return nil
  end

  local data = vim.uv.fs_read(fd, stat.size, 0)
  vim.uv.fs_close(fd)
  return data
end

local function escape_lua_pattern(text)
  return text:gsub('([^%w])', '%%%1')
end

local function settings_mentions_module(settings_path, module_dir)
  local data = read_file(settings_path)
  if not data then
    return false
  end

  local module_name = vim.fs.basename(module_dir)
  local escaped_name = escape_lua_pattern(module_name)
  local module_path = vim.fs.normalize(module_dir)

  if data:find("['\"]:" .. escaped_name .. "['\"]") then
    return true
  end

  local settings_dir = vim.fs.dirname(settings_path)
  local module_from_settings = vim.fs.normalize(vim.fs.joinpath(settings_dir, module_name))
  if module_from_settings == module_path then
    return true
  end

  if data:find(module_name, 1, true) then
    return true
  end

  return false
end

local function find_umbrella_settings(module_dir)
  local parent_dir = vim.fs.dirname(module_dir)
  if not parent_dir or parent_dir == module_dir then
    return nil
  end

  local handle = vim.uv.fs_scandir(parent_dir)
  if not handle then
    return nil
  end

  local candidates = {}
  while true do
    local name, kind = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if kind == 'directory' then
      for _, marker in ipairs({ 'settings.gradle', 'settings.gradle.kts' }) do
        local settings_path = path_join(parent_dir, name, marker)
        if path_exists(settings_path) and settings_mentions_module(settings_path, module_dir) then
          table.insert(candidates, path_join(parent_dir, name))
        end
      end
    end
  end

  table.sort(candidates, function(a, b)
    return #a < #b
  end)

  return candidates[1]
end

local function kotlin_project_root(fname)
  local file_dir = vim.fs.dirname(vim.fs.normalize(fname))
  if not file_dir then
    return nil
  end

  local direct_root = vim.fs.root(file_dir, kotlin_root_markers)
  if not direct_root then
    return nil
  end

  if path_exists(vim.fs.joinpath(direct_root, 'settings.gradle'))
    or path_exists(vim.fs.joinpath(direct_root, 'settings.gradle.kts'))
    or path_exists(vim.fs.joinpath(direct_root, 'pom.xml'))
    or path_exists(vim.fs.joinpath(direct_root, 'workspace.json'))
  then
    return direct_root
  end

  local umbrella_root = find_umbrella_settings(direct_root)
  if umbrella_root then
    return umbrella_root
  end

  return direct_root
end

function M.setup()
  require('mason').setup()

  vim.lsp.config('clangd', {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable('clangd')

  vim.lsp.config('ts_ls', {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable('ts_ls')

  vim.lsp.config('kotlin_lsp', {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = function(bufnr, on_dir)
      local fname = vim.api.nvim_buf_get_name(bufnr)
      local root = kotlin_project_root(fname)
      if root then
        on_dir(root)
      end
    end,
  })
  vim.lsp.enable('kotlin_lsp')

  vim.lsp.config('jdtls', {
    capabilities = capabilities,
    on_attach = on_attach,
  })
  vim.lsp.enable('jdtls')


  local snippy = require('snippy')
  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        snippy.expand_snippet(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippy.can_expand_or_advance() then
          snippy.expand_or_advance()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippy.can_jump(-1) then
          snippy.previous()
        else
          fallback()
        end
      end,
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'snippy' },
      { name = 'buffer' },
    },
  })
end

return M
