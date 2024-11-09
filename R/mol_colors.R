mol_colors <- function(x = 1:12, palette = "mol") {

    if (palette == "mol") {
        mycolors <- c(
            "#E22222", "#3D3D3D", "#A20000", "#9B9B9B", "#F28E8E","#D5D5D5",
            "#228B22", "#A3C1E1", "#90EE90", "#3D5481", "#6B8E23", "#1113E1"
        )
    } else if (palette == "distinct") {
        mycolors <- c(
            "#EE0011FF", "#0C1BB9FF", "#A1C720FF", "#FFD320FF", "#AA1AE8", "#FF950EFF",
            "#149BEDFF","#EC579AFF","#16A08CFF","#9A703EFF","#7E0021FF","#B5B5B5"
        )
    } else if (palette == "mol_old") {
        mycolors <- c(
            "#fc0505", "#820000", "#3d5481","lightblue", "#daac92", "#8f8f8f",
            "green3", "lightgreen", "lightgrey", "blue4", "darkorange2", "grey10"
        )
    } else if (palette == "red_green") {
        mycolors <- c(
            "#BA2F2AFF",
            "#088158FF"
        )
    } else {
        message("Unrecognized palette. Defaulting to 'mol'.")
        mycolors <- c(
            "#E22222", "#3D3D3D", "#A20000", "#9B9B9B", "#F28E8E","#D5D5D5",
            "#228B22", "#A3C1E1", "#90EE90", "#3D5481", "#6B8E23", "#1113E1"
        )
    }

    if (is.null(x)) {
        p <- mycolors  |>
            enframe()  |>
            mutate(
                c = (row_number() -1) %% 6,
                r = (row_number() - 1) %/% 6,
                name = factor(name, levels = 1:12)
            ) |>
            ggplot(aes(c, -r, fill = name, label = value)) +
            geom_tile(color = "black", show.legend = FALSE) +
            scale_fill_manual(values = mycolors) +
            geom_text(color = "white", fontface = "bold") +
            theme_void()

        return(p)
    }

    as.character(mycolors[x])

}
