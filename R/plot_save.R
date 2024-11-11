plot_save <- function(file = "plot.png", plot = ggplot2::last_plot(),
                      aspect_ratio = c(1,2), marker = FALSE, bg_color = "#f0f2e9", win = TRUE) {

    if (!str_ends(file, "\\.png")) {
        file <- str_c(file, ".png")
    }

    add_marker <- function(windows = TRUE){

        just_set <- "left"
        y_set <- 340
      
        if (!windows) {
            just_set <- "right"
            y_set <- 33
        }
      
        vp = grid::viewport(x = .1, y = y_set, width = 0.25, height = 0.25, just = just_set, default.units = "native")
        h <- sqrt(3)/2
        a <- 0.35
        s <- 0.55

        grid::grid.polygon(
            x = unit(c(0, 0, a*h), "inch"),
            y = unit(c(a, 0, a/2), "inch"),
            gp = grid::gpar(fill = "#DA3735", col = NA),
            vp = vp
        )

        grid::grid.polygon(
            x = unit(c(0, s*a*h/2, a*h), "inch"),
            y = unit(c(a, s*a*h*h, a/2), "inch"),
            gp = grid::gpar(fill = "#DA3735", col = NA),
            vp = vp
        )

        grid::grid.polygon(
            x = unit(c(0, 0, s*a*h/2), "inch"),
            y = unit(c(0, a, s*a*h*h), "inch"),
            gp = grid::gpar(fill = "#A02B2C", col = NA),
            vp = vp
        )

        grid::grid.polygon(
            x = unit(c(0, s*a*h/2, a*h), "inch"),
            y = unit(c(0, s*a*h*h, a/2), "inch"),
            gp = grid::gpar(fill = "#52171A", col = NA),
            vp = vp
        )

    }

    pixel <- case_when(
        all(aspect_ratio == c(1,1)) ~ c(5500, 5500),
        all(aspect_ratio == c(1,2)) ~ c(7800, 3900),
        all(aspect_ratio == c(2,3)) ~ c(6750, 4500),
        all(aspect_ratio == c(3,4)) ~ c(6400, 4800),
        all(aspect_ratio == c(2,1)) ~ c(3900, 7800),
        all(aspect_ratio == c(3,2)) ~ c(4500, 6750),
        all(aspect_ratio == c(4,3)) ~ c(4800, 6400),
        .default = 0
    )

    if (any(pixel == 0)) {
        message("Unrecognized aspect ratio. Defaulting to 1:2.")
        pixel <- c(6750, 4500)
    }

    png(file, width = pixel[1], height = pixel[2], res = 720)

    print(plot)

    if (marker) {
        print(plot + theme(
            plot.background = element_rect(fill = bg_color),
            panel.background = element_rect(fill = bg_color),
        ))
        add_marker(win)
    }

    dev.off()
}
