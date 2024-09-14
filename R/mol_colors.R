mol_colors <- function(x = 1:12) {

    mycolors <- c("#fc0505", "#820000", "#3d5481","lightblue", "#daac92", "#8f8f8f",  "green3", "lightgreen", "lightgrey", "blue4", "darkorange2", "grey10")

    if (is.null(x)) {
        p <- mycolors %>%
            enframe() %>%
            mutate(
                c = (row_number() -1) %% 6,
                r = (row_number() - 1) %/% 6
            ) %>%
            ggplot(aes(c, -r, fill = name, label = str_c(name, "\n", value))) +
            geom_tile(color = "black", show.legend = FALSE) +
            scale_fill_manual(values = mycolors) +
            geom_text(color = "white", fontface = "bold") +
            theme_void()

        return(p)
    }

    if (length(x) == 1) {
        if (x == "low") return("#D22211") # for gradient values
        if (x == "high") return("#469240")
    }

    as.character(mycolors[x])

}
