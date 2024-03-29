#' Select SPHSU colours
#'
#' This function allows you to select a colour or a vector of colours by name, or to specify a 'main' or 'more' subset.
#'
#' The names of the standard Social and Public Health Sciences Unit colours can be passed as arguments to return a named vector of corresponding hex strings.
#'
#' @param ... Character. Colour names separated by commas. Left blank this will return all colours in subset.
#' @param subset Character. "all", "main" or "more" can be called (this only needs used in place of colour names above).
#' @param names Logical. If passing directly to \link[ggplot2]{scale_manual} then set this as \code{TRUE} to remove names and allow assignment to plotted variables.
#'
#' @author Andy Baxter andy@andybaxter.me
#'
#' @returns A named vector containing the hex codes of all requested colours.
#'
#' @export
#'
#' @examples
#' sphsu_cols()
#' sphsu_cols("University Blue", "Leaf", "Moss")
#' sphsu_cols(subset = "main")

sphsu_cols <-
function(..., subset = "all", names = TRUE) {
  main_cols <- c('University Blue' = "#003865",
                 Cobalt = "#0075B0",
                 Thistle = "#951272",
                 Burgundy = "#7D2239",
                 Lavender = "#5B4D94",
                 Rose = "#B06C96")
  more_cols <- c('Sky blue' = "#005398",
                 Turquoise = "#00B5D1",
                 Leaf = "#00843D",
                 Moss = "#385A4F",
                 Rust = "#BE4D00",
                 Pumpkin = "#FFB948",
                 Sunshine = "#FFDC36")
  planet_cols <- c(Policy = "#5B4E94",
                   Neighbourhoods = "#82BB26",
                   Settings = "#0079B3",
                   Relationships = "#163961",
                   Complexity = "#951D73",
                   Inequalities = "#1F687E")
  all_cols <- c(main_cols, more_cols, planet_cols)
  standard_cols <- c(main_cols, more_cols)
  cols <- c(...)
  if (is.null(cols)) {
    if (names) {
      if (subset == "all") {
        return(standard_cols)
      } else if (subset == "main") {
        return(main_cols)
      } else if (subset == "more") {
        return(more_cols)
      } else if (subset == "planet"){
        return(planet_cols)
      } else {
        stop("Please specify whether 'main', 'more', 'planet' or 'all' colours are required",
             call. = FALSE)
      }
    } else {
      if (subset == "all") {
        names(all_cols) <- NULL
        return(all_cols)
      } else if (subset == "main") {
        names(main_cols) <- NULL
        return(main_cols)
      } else if (subset == "more") {
        names(more_cols) <- NULL
        return(more_cols)
      } else if (subset == "planets"){
        names(planet_cols) <- NULL
        return(planet_cols)
      } else {
        stop("Please specify whether 'main', 'more', 'planet' or 'all' colours are required",
             call. = FALSE)
      }

    }
  } else {
    if (all(sapply(cols, tolower) %in% tolower(names(all_cols)))){
      colreturn <- all_cols[match(sapply(cols, tolower), tolower(names(all_cols)))]
      if (names) {
        colreturn
      } else {
        names(colreturn) <- NULL
        return(colreturn)
      }
    }  else {
      stop(paste0("Colour not recognised, try: '",
                  paste0(names(all_cols),
                         collapse = "', '"),
                  "'"),
           call. = FALSE)
    }
  }
}

#' SPHSU palettes (for passing to other functions)
#'
#' @param palette Name of pallete to use. `"main"`, `"mixed"`, `"planet"` or `"all"`
#' @param reverse Reverse order. defaults to `FALSE`
#' @param ... Additional arguments passed to colorRampPalette
#'
#' @importFrom grDevices colorRampPalette

sphsu_pal <-
function(palette = "mixed", reverse = FALSE, ...){
  pal <- SPHSUgraphs::sphsu_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal,...)
}
