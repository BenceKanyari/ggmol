small_multiples_data <- function(data, column) {
    data |>
        distinct({{column}}) |>
        pull() |>
        map_df(~mutate(data, highlighted = .))
}
