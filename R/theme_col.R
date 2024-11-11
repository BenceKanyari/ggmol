theme_col <- function(xbreaks = waiver(), xlimits = c(NA,NA), expand_top = .5, left = FALSE) {

    xexpand = c(0,.05)

    if (left) {
        xexpand = c(.05,0)
    }

    list(
        geom_vline(xintercept = 0, linewidth = 1),
        scale_x_continuous(breaks = xbreaks, limits = xlimits, position = "top",
                           expand = expansion(mult = xexpand)),
        scale_y_discrete(expand = expansion(add = c(0, expand_top))),
        ggmol::theme_col_basic(),
        theme(strip.placement = "outside")
    )
}
