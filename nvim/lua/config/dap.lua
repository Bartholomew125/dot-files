-- local dap = require('dap')
-- dap.adapters.debugpy = {
--     type = 'executable';
--     command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
--     args = { '-m', 'debugpy.adapter' };
-- }

-- require("dap-python").setup("python3")

local dap = require('dap')
dap.configurations.python = {
    {
        type = 'debugpy';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return '/usr/bin/python'
        end;
    },
}

require("dap-python").setup("python3")
