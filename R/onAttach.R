.onAttach <- function(...) {
    library(tidyverse)
    library(patchwork)
    library(grid)
    library(ggthemes)

    update_geom_defaults("point", list(size = 1.6, color = ggmol::mol_colors(1)))
    update_geom_defaults("line", list(size = 1.2, color = ggmol::mol_colors(1)))
    update_geom_defaults("tile", list(color = "black"))
    update_geom_defaults("col", list(fill = ggmol::mol_colors(2)))
    update_geom_defaults("label", list(family = "Tahoma"))
    update_geom_defaults("text", list(family = "Tahoma"))

    options(ggplot2.discrete.colour = ggmol::mol_colors())
    options(ggplot2.discrete.fill = ggmol::mol_colors())

    theme_set(
        ggmol::theme_mol()
    )
    packageStartupMessage("Theme updated")
}



