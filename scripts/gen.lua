local cp = require("catppuccin")

local themes = {
    latte = io.open("themes/catppuccin_latte/xmake.lua", "w+"),
    frappe = io.open("themes/catppuccin_frappe/xmake.lua", "w+"),
    macchiato = io.open("themes/catppuccin_macchiato/xmake.lua", "w+"),
    mocha = io.open("themes/catppuccin_mocha/xmake.lua", "w+"),
}

for fl, f in pairs(themes) do
    local palette = {}
    for k, v in pairs(cp[fl]()) do
        if type(v) ~= "string" then
            palette[k] = table.concat(v.rgb, ";")
        end
    end

    f:write('theme("catppuccin_'..fl..'")\n')

    f:write(([[
    set_text("success", "$ok")
    set_color("success", "%s")
]]):format(palette.green))

    f:write(([[
    set_text("failure", "$failed")
    set_color("failure", "%s")
]]):format(palette.red))

    f:write(([[
    set_text("nothing", "$no")
    set_color("nothing", "%s")
]]):format(palette.red))

    f:write(([[
    set_text("error", "$error")
    set_color("error", "%s")
]]):format(palette.red))

    f:write(([[
    set_text("warning", "$warning")
    set_color("warning", "%s")
]]):format(palette.yellow))

    f:write(([[
    set_text("build.progress_format", "[%%3d%%%%]")
    set_text("build.progress_style", "scroll")
    set_color("build.progress", "%s")
]]):format(palette.green))

    f:write(([[
    set_color("build.object", "")
]]):format(""))

    f:write(([[
    set_color("build.target", "%s")
]]):format(palette.mauve))

    f:write(([[
    set_text("spinner.chars", '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏')
]]):format('⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'))


    f:write(([[
    set_text("dump.default_format", "%%s")
    set_text("dump.udata_format", "%%s")
    set_text("dump.table_format", "%%s")
    set_text("dump.anchor", "&%%s")
    set_text("dump.reference", "*%%s")
    set_color("dump.anchor", "%s")
]]):format(palette.yellow))
    f:write(([[
    set_color("dump.reference", "%s")
]]):format(palette.yellow))
    f:write(([[
    set_color("dump.default", "%s")
]]):format(palette.red))
    f:write(([[
    set_color("dump.udata", "%s")
]]):format(palette.yellow))
    f:write(([[
    set_color("dump.table", "%s")
]]):format(palette.overlay2))
    f:write(([[
    set_color("dump.string", "%s")
]]):format(palette.green))
    f:write(([[
    set_color("dump.string_quote", "%s")
]]):format(palette.green))
    f:write(([[
    set_color("dump.keyword", "%s")
]]):format(palette.mauve))
    f:write(([[
    set_color("dump.number", "%s")
]]):format(palette.peach))
    f:write(([[
    set_color("dump.function", "%s")
]]):format(palette.blue))

    f:write(([[
    set_color("menu.main.task.name", "%s")
]]):format(palette.mauve))
    f:write(([[
    set_color("menu.option.name", "%s")
]]):format(palette.green))

    f:write(([[
    set_color("menu.usage", "%s")
]]):format(palette.sky))

    f:write(([[
    set_text("interactive.prompt", "xmake>")
    set_text("interactive.prompt2", "xmake>>")
    set_color("interactive.prompt", "%s")
]]):format(palette.green))
    f:write(([[
    set_color("interactive.prompt2", "%s")
]]):format(palette.green))

    f:close()
end
