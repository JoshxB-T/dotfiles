local apps = require("core.apps")

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar & hyprpaper & hypridle & swaync &")
    hl.exec_cmd("[workspace 1 silent]" .. apps.terminal)
    hl.exec_cmd("[workspace 2 silent]" .. apps.terminal)
    hl.exec_cmd("[workspace 3 silent]" .. apps.browser)
end)


