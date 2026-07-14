---@diagnostic disable: lowercase-global
plugin = "/nix/store/7x61b2vgqxpmq25clphkqmjwjrmvgqjn-hyprglass-unstable-2025/lib/hyprglass.so"
plugin = "/nix/store/0ihd9mhvf6gqclpfzn1l3llliqvncdm7-hyprbars-0.55.0/lib/libhyprbars.so"

if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

	hg.preset("shell", {
    blur_strength        = 3.0,
    blur_iterations      = 4,
    refraction_strength  = 0.8,
    chromatic_aberration = 0.15,
    fresnel_strength     = 0.6,
    specular_strength    = 0.6,
    glass_opacity        = 0.5,
    edge_thickness       = 0.04,
    lens_distortion      = 0.35,
    })

	hg.config({
    default_theme  = "dark",
    default_preset = "shell",
    layers         = { enabled = true },
})

    hg.layer("quickshell", { preset = "shell", mask_threshold = 0.04 })
    hg.layer("quickshell:cc", { preset = "shell", mask_threshold = 0.04 })
    hg.layer("quickshell:applemenu", { preset = "shell", mask_threshold = 0.04 })
    hg.layer("quickshell:dock", { preset = "shell", mask_threshold = 0.04 })
end

if hl.plugin.hyprbars then
    hl.config({
        plugin = {
            hyprbars = {
                bar_height = 26,
                bar_color = "rgb(2b2b2b)",
                ["col.text"] = "rgb(d4d4d4)",
                bar_buttons_alignment = "left",
		bar_title_enabled = false,
                bar_text_align = "center",
                bar_text_size = 10,
                bar_padding = 10,
                bar_button_padding = 6,
                bar_part_of_window = true,
                icon_on_hover = true,
                on_double_click = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = 1 })'",
            },
        },
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(ff5f57)",
        fg_color = "rgb(ff5f57)",
        size = 11,
        icon = "",
        action = "hyprctl dispatch 'hl.dsp.window.close()'",
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(ffbd2e)",
        fg_color = "rgb(ffbd2e)",
        size = 11,
        icon = "",
        action = "hyprctl dispatch 'hl.dsp.window.move({ workspace = \"special:minimized\" })'",
    })

    hl.plugin.hyprbars.add_button({
        bg_color = "rgb(28c941)",
        fg_color = "rgb(28c941)",
        size = 11,
        icon = "",
        action = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = 1 })'",
    })
end
