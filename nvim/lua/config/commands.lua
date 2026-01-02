local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm", "s" },
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.csv",
    callback = function()
        vim.cmd("CsvViewEnable")
    end,
})

function smart_write()
    local current_file = vim.fn.expand('%:p')
    local basename     = vim.fn.expand('%:t:r')
    local extension    = vim.fn.expand('%:e')
    local cwd          = vim.fn.getcwd()
    local build_dir    = cwd .. "/build"

    vim.cmd("w")

    if extension ~= "tex" then return end

    if vim.fn.isdirectory(build_dir) == 0 then
        vim.fn.mkdir(build_dir, "p")
    end

    vim.cmd('echo "Compiling LaTeX document into build/"')

    local bib_files = vim.fn.glob("*.bib", false, true)
    local has_bib = #bib_files > 0

    -- helper to run pdflatex
    local function run_pdflatex(callback)
        vim.fn.jobstart({ "pdflatex", "-interaction=nonstopmode", "-output-directory="..build_dir, current_file }, {
            on_exit = function(_, code)
                if code ~= 0 then
                    print("pdflatex failed")
                elseif callback then
                    callback()
                end
            end,
        })
    end

    -- helper to run biber
    local function run_biber(callback)
        vim.fn.jobstart({ "biber", "--input-directory="..build_dir, "--output-directory="..build_dir, basename }, {
            on_exit = function(_, code)
                if code ~= 0 then
                    print("biber failed")
                elseif callback then
                    callback()
                end
            end,
        })
    end

    if has_bib then
        run_pdflatex(function() run_biber(function() run_pdflatex(function() run_pdflatex() end) end) end)
    else
        run_pdflatex()
    end
end
