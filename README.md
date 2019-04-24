# SPHSU graphics for graphs
For applying Unit colour scales and other theme aesthetics to ggplot2 plots

## The Unit Palette

Use `show_sphsu_colours()` to show the range of named colours you can use:

![SPHSU colour scheme](sphsu_palette.png)

## Adding a palette

Colour and fill functions have four pre-installed palettes: "main", "hot", "cool" and "mixed". You can add a custom palette like so:

```
sphsu_palettes$newname <- sphsu_cols("Cobalt", "Thistle", "Leaf")
```

You can then use this new palette name in calls of `scale_fill_sphsu` and `scale_colour_sphsu` (see below).

## Using in ggplot

Right now the main output of these functions is to apply colour and fill scales to your `ggplot2` graphics, by adding a `scale_` function at the end of your call.

Examples:

```
ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Species)) +
  geom_point(size = 4) +
  scale_color_sphsu()
```

!['mixed' colour scale, discrete](graph1.png)

```
ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Sepal.Length)) +
  geom_point(size = 4) +
  scale_color_sphsu("hot", discrete = FALSE)
```

!['hot' colour scale, continuous](graph2.png)

```
ggplot(iris, aes(Sepal.Width, Sepal.Length, col = Sepal.Length)) +
  geom_point(size = 4) +
  scale_color_sphsu("cool", discrete = FALSE)
```

!['cool' colour scale, continuous](graph3.png)

```
ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_sphsu(palette = "mixed", guide = "none")
```

!['mixed' colour scale, discrete](graph4.png)
