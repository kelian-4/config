hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,
        
        col = {
        active_border = "rgba(33ccffee)" ,"rgba(00ff99ee)", "45deg",
        inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})
