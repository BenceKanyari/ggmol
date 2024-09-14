plot_save <- function(plot = ggplot2::last_plot(), file = "plot.png",
                      aspect_ratio = c(2,3), logo = FALSE) {

    add_logo <- function(){

        # grid.lines(
        #     x = c(0, 1),
        #     y = 1,
        #     gp = gpar(col = "#820000", lwd = 20)
        # )

        vp <- viewport(x = 0.8, y = 0.25, width = 0.25, height = 0.25, just = "right", default.units = "inch")
        h <- sqrt(3)/2
        a <- 0.25
        s <- 0.55

        grid.polygon(
            x = unit(c(0, 0, a*h), "inch"),
            y = unit(c(a, 0, a/2), "inch"),
            gp = gpar(fill = "#DA3735", col = NA),
            vp = vp
        )

        # Define the coordinates for the larger right upper triangle
        grid.polygon(
            x = unit(c(0, s*a*h/2, a*h), "inch"),
            y = unit(c(a, s*a*h*h, a/2), "inch"),
            gp = gpar(fill = "#DA3735", col = NA),
            vp = vp
        )

        # Define the coordinates for the smaller bottom left triangle
        grid.polygon(
            x = unit(c(0, 0, s*a*h/2), "inch"),
            y = unit(c(0, a, s*a*h*h), "inch"),
            gp = gpar(fill = "#A02B2C", col = NA),
            vp = vp
        )

        # Define the coordinates for the smaller top left triangle
        grid.polygon(
            x = unit(c(0, s*a*h/2, a*h), "inch"),
            y = unit(c(0, s*a*h*h, a/2), "inch"),
            gp = gpar(fill = "#52171A", col = NA),
            vp = vp
        )

        grid.text(
            "molgroup",
            x = 0.8,
            y = 0.25,
            default.units = "inch",
            just = "left",
            gp = gpar(
                col = "#DA3735",
                fontsize = 22,
                fontfamily = "Telegrafico"
            )
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
        message("Unrecognized aspect ratio. Defaulting to 2:3.")
        pixel <- c(6750, 4500)
    }

    png(file, width = pixel[1], height = pixel[2], res = 720)

    print(plot)
    if (logo) {
        print(plot + theme(plot.margin = unit(c(1, 2, 2, 1), "lines")))
        add_logo()
    }

    dev.off()
}
