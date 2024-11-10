theme_col_basic <- function() {
    theme(
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid.major.x = element_line(),
        panel.grid.major.y = element_blank(),
        axis.text.y = element_text(hjust = 0)
    )
}
