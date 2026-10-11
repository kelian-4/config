
hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet -indicator &")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("quickshell -p \"/home/kelian/code/macos shell/shell/shell.qml\"")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
