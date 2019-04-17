#' SPHSU colour scales
#'
#' Unit colours for \link[ggplot2]{ggplot2} graphs
#'
#' These functions call colour palettes based on Unit colourschemes
#'
#' @param palette Character. Calls a palette from \link{sphsu_cols}. Current schemes are "main", "cool", "hot" and "mixed".
#' @param discrete Logical. Toggle to represent discrete or continuous data.
#' @param reverse Logical. Reverse order of colours at assignment.
#' @param ... other arguments passed on to \link[ggplot2]{discrete_scale} (for discrete data) or \link[ggplot2]{scale_gradientn} (for continuous).
#'
#' @author Andy Baxter
#'
#' @import ggplot2
#'
#' @export
#'
#' @examples
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_sphsu()
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Sepal.Length)) +
#'   geom_point(size = 4) +
#'   scale_color_sphsu("hot", discrete = FALSE)
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Sepal.Length)) +
#'   geom_point(size = 4) +
#'   scale_color_sphsu("cool", discrete = FALSE)
#'
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'   scale_fill_sphsu(palette = "mixed", guide = "none")
#'
#'

scale_colour_sphsu <-
function (palette = "mixed", discrete = TRUE, reverse = FALSE, ...){
  pal <- sphsu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("sphsu_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}
#' @rdname scale_colour_sphsu
scale_fill_sphsu <-
function(palette = "mixed", discrete = TRUE, reverse = FALSE, ...){
  pal <- sphsu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("sphsu_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
