#' SPHSU light theme
#'
#' Based on theme_light
#'
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Sepal.Length)) +
#' geom_point(size = 4) +
#' scale_colour_sphsu("hot", discrete = FALSE) +
#' theme_sphsu_light() +
#' facet_wrap(~Species)
#'
#' @export

theme_sphsu_light <-
function() {
  # windowsFonts("Arial" =  windowsFont("Arial"))
  theme_light(base_size = 12, base_family = "sans") %+replace%
  theme(
    panel.border     = element_rect(fill = NA, colour = NA),
    axis.line        = element_line(colour = "grey70", linewidth = rel(1), lineend = "square"),
    axis.ticks       = element_line(colour = "grey70", linewidth = rel(1)),
    strip.background = element_rect(fill = "grey90", colour = NA),
    strip.text       = element_text(
                            colour = "grey20",size = rel(0.8),
                            margin = margin(0.8 * 6, 0.8 * 6, 0.8 * 6, 0.8 * 6)
                       )
        )
}

theme_sphsu_minimal <-
  function() {
  # windowsFonts("Arial" =  windowsFont("Arial"))
  theme_light(base_size = 12, base_family = "sans") %+replace%
  theme(
    panel.border     = element_rect(fill = NA, colour = NA),
    axis.line        = element_blank(),
    strip.background = element_rect(fill = "grey90", colour = NA),
    strip.text = element_text(colour = "grey20",size = rel(0.8),
                              margin = margin(0.8 * 6, 0.8 * 6, 0.8 * 6, 0.8 * 6))
        )

  }
