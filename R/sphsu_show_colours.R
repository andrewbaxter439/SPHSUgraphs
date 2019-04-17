#' See colours and colour names
#'
#' Displays all colours in a pie chart
#' @return A pie chart ggplot graph object
#' @export
#' @examples
#' sphsu_show_colours()

sphsu_show_colours <-
function() {
df <- data.frame(Colour = factor(sphsu_cols(), levels = sphsu_cols()),
       names = names(sphsu_cols()),
       vals = 1,
       hjust = c(rep(0.5,12), 0.3))

  ggplot(df, aes(x = 1, y= vals, fill = Colour, label = names))+
  geom_bar(stat = "identity", position = "fill") +
  coord_polar(theta = "y") +
  theme(text = element_blank(),
        rect = element_blank(),
        line = element_blank(),
        legend.position = "none") +
  scale_fill_identity(aesthetics = c("fill","colour")) +
  geom_text(aes(x=1.7, col=Colour, hjust = hjust),
            position=position_fill(vjust=0.5), fontface = "bold", family = "sans")
}
