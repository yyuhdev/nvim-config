vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_buf_conf", { clear = true }),
  callback = function(event_context)
    local client = vim.lsp.get_client_by_id(event_context.data.client_id)

    if not client then
      return
    end

    local bufnr = event_context.buf

    local map = function(mode, l, r, opts)
      opts = opts or {}
      opts.silent = true
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "gd", function()
      vim.lsp.buf.definition {
        on_list = function(options)
          local unique_defs = {}
          local def_loc_hash = {}

          for _, def_location in pairs(options.items) do
            local hash_key = def_location.filename .. def_location.lnum

            if not def_loc_hash[hash_key] then
              def_loc_hash[hash_key] = true
              table.insert(unique_defs, def_location)
            end
          end

          options.items = unique_defs

          ---@diagnostic disable-next-line: param-type-mismatch
          vim.fn.setloclist(0, {}, " ", options)

          if #options.items > 1 then
            vim.cmd.lopen()
          else
            vim.cmd([[silent! lfirst]])
          end
        end,
      }
    end, { desc = "go to definition" })
    map("n", "<C-]>", vim.lsp.buf.definition)
    map("n", "K", function()
      vim.lsp.buf.hover {
        border = "single",
        max_height = 20,
        max_width = 130,
        close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
      }
    end)
    map("n", "<C-k>", vim.lsp.buf.signature_help)
    map("n", "<space>rn", vim.lsp.buf.rename, { desc = "variable rename" })
    map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "add workspace folder" })
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "remove workspace folder" })
    map("n", "<space>wl", function()
      vim.print(vim.lsp.buf.list_workspace_folders())
    end, { desc = "list workspace folder" })

    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
  nested = true,
  desc = "Configure buffer keymap and behavior based on LSP",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 500,
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = (function()
        local ok, schemastore = pcall(require, "schemastore")
        if ok then
          return schemastore.json.schemas()
        end
        return {}
      end)(),
      validate = { enable = true },
    },
  },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = (function()
        local ok, schemastore = pcall(require, "schemastore")
        if ok then
          return schemastore.yaml.schemas()
        end
        return {}
      end)(),
      validate = true,
      hover = true,
      completion = true,
    },
  },
})

vim.lsp.config("intelephense", {
  settings = {
    intelephense = {
      stubs = {
        "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype",
        "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo",
        "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv",
        "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta",
        "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO",
        "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
        "Phar", "posix", "pspell", "readline", "Reflection", "session",
        "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL",
        "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem",
        "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
        "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
})

vim.lsp.config("jdtls", {
  init_options = {
    workspace = vim.fn.expand("~/.cache/jdtls/workspaces/") .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
  },
  settings = {
    java = {
      configuration = {},
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      format = { enabled = true },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
  },
})

vim.lsp.config("kotlin_language_server", {
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({ "build.gradle", "settings.gradle", "pom.xml" }, { upward = true, path = fname })[1] or fname)
  end,
  settings = {
    kotlin = {
      compiler = {
        jvm = "25", 
      },
    },
  },
})

local enabled_lsp_servers = {
  lua_ls = "lua-language-server",
  jsonls = "vscode-json-language-server",
  jdtls  = "jdtls",
}

for server_name, lsp_executable in pairs(enabled_lsp_servers) do
  if vim.fn.executable(lsp_executable) == 1 then
    vim.lsp.enable(server_name)
  else
    local msg = string.format(
      "Executable '%s' for server '%s' not found! Server will not be enabled",
      lsp_executable,
      server_name
    )
    vim.notify(msg, vim.log.levels.WARN, { title = "Nvim-config" })
  end
end
