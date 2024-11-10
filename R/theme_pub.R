theme_pub <- function() {
    ggmol::theme_mol() +
    theme(
        line = element_line(linetype = 1, colour = "black"),
        rect = element_rect(fill = "white", linetype = 0, colour = NA),
        text = element_text(colour = "black"),
        title = element_text(size = rel(2)),
        axis.title = element_blank(),
        axis.text = element_text(face = "bold", size = rel(1.1)),
        axis.text.x = element_text(colour = NULL),
        axis.text.y = element_text(colour = NULL),
        axis.ticks = element_line(colour = NULL),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_line(colour = NULL),
        axis.line = element_line(),
        axis.line.y = element_blank(),
        legend.background = element_rect(),
        legend.position = "top",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.box.margin = unit(c(0, 1,-.5, 1), "lines"),
        legend.justification = "left",
        panel.grid = element_line(colour = NULL, linetype = 1),
        panel.grid.major = element_line(colour = "grey80"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0, face = "bold"),
        plot.margin = unit(c(1, 1, 1, 1), "lines"),
        strip.background = element_rect(fill = "grey95")
    )
}
