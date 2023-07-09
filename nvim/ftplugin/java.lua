-- local jdtls = require('jdtls')
-- 
-- local config = {
--     cmd = {'path'},
--     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- }
-- jdtls.start_or_attach(config)

-- ----------------------------------------------------------------------------

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/path/to/workspace-root/' .. project_name

local config = {
    cmd = {
        'java',
        '-Declipse.epplication=org.eclipse.jdt.ls.core.id1',
        '-Dsogi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', '/home/exdia/git-clones/jdtls/src/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/home/exdia/git-clones/jdtls/src/config_linux',
        '-data', workspace_dir,

    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-20",
                        path = "/usr/lib/jvm/java-20-openjdk/",
                    },
                }
            }
        }
    },

    init_options = {
        bundles = {}
    },
}

require('jdtls').start_or_attach(config)
