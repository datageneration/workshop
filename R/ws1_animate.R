## R Workshop: Replicate Hans Rosling's presentation

my_packages <- c("magick","gapminder","png","gifski", "ggplot2","gganimate")
install.packages(my_packages, repos = "http://cran.rstudio.com")
library(gapminder)
library(ggplot2)
library(magick)
library(gganimate)

# Basic scatter plot object

mapping <- aes(x =gdpPercap, y = lifeExp, 
               size = pop, color = continent,
               frame = year) 

# Note: manual color choices.

ggplot(gapminder, mapping = mapping) +
  geom_point() +
  theme_linedraw() + 
  scale_x_log10()+
  scale_color_manual(values=c("purple","green","red","light blue","cyan"))+
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  geom_text(aes(label=ifelse((gapminder$country == "China"), "China", ifelse(gapminder$country=="Taiwan", "Taiwan", ""))),vjust=0,nudge_y = 1,size=6) +
  transition_time(year) +
  ease_aes('linear')

anim_save("p.gif")

## Exercise
# 1. Check the variables in gapminder
# 2. Change the variable gdpPercap to size and pop to x