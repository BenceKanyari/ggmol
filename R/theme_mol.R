theme_mol <- function() {
    ggthemes::theme_calc() +
        theme(
            line = element_line(colour = "gray80"),
            panel.border = element_blank(),
            panel.background = element_rect(fill = "white", colour = NA),
            plot.background = element_rect(fill = "white", colour = NA),
            plot.margin = unit(c(1, 2, 1, 1), "lines"),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.background = element_rect(fill = NA, colour = NA),
            legend.box.margin = margin(.5,1,0,1),
            legend.box = "horizontal",
            plot.caption.position = "panel",
            plot.title = element_text(size = 18, face = "bold"),
            plot.subtitle = element_text(size = 14, margin = margin(3,3,4,3)),
            plot.caption = element_text(size = 10),
            axis.title = element_text(size = 12),
            axis.text = element_text(size = 12),
            strip.text = element_text(size = 12),
            strip.background = element_rect(color = "grey60", fill = "grey95"),
            legend.title = element_text(size = 12),
            legend.text = element_text(size = 12),
        )
}
