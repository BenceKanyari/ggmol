theme_col <- function() {
    theme(
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid.major.x = element_line(),
        panel.grid.major.y = element_blank(),
    ) +
        geom_vline(xintercept = 0)
}
