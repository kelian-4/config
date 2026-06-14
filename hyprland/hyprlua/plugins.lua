---@diagnostic disable: lowercase-global
plugin = "/nix/store/7x61b2vgqxpmq25clphkqmjwjrmvgqjn-hyprglass-unstable-2025/lib/hyprglass.so"

if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    hg.preset("shell", {
        inherits             = "glass",
        blur_strength        = 2.8,
        blur_iterations      = 3,
        refraction_strength  = 0.28,
        chromatic_aberration = 0.08,
        fresnel_strength     = 0.45,
        specular_strength    = 0.55,
        glass_opacity        = 0.92,
        edge_thickness       = 0.035,
        lens_distortion      = 0.12,
        dark                 = {
            brightness   = 0.86,
            contrast     = 0.90,
            saturation   = 0.83,
            adaptive_dim = 0.12,
            vibrancy     = 0.08,
            tint_color   = 0x5588bb14,
        },
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
