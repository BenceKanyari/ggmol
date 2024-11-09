.onAttach <- function(...) {

    library(tidyverse)
    library(ggthemes)

    update_geom_defaults("point", list(size = 1.6, color = ggmol::mol_colors(1)))
    update_geom_defaults("line", list(linewidth = 1.2, color = ggmol::mol_colors(1)))
    update_geom_defaults("tile", list(color = "black"))
    update_geom_defaults("col", list(fill = ggmol::mol_colors(1)))


    options(ggplot2.discrete.colour = ggmol::mol_colors())
    options(ggplot2.discrete.fill = ggmol::mol_colors())

    theme_set(
        ggmol::theme_mol()
    )
    packageStartupMessage("Theme updated")
}



