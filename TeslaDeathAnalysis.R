library(ggplot2)

#This line of code reads the .csv file
tesla_data <- read.csv("Tesla Deaths - Deaths (3).csv")

#This is the scatterplot that shows deaths worldwide in each country.
ggplot((data = tesla_data), aes(alpha = 0.3, x= Country, y= Deaths)) + geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#This is a another plot that shows deaths in the country as well as the count
#of deaths so that I could see where majority of the deaths were concentrated.
ggplot((data = tesla_data), aes(x= Country, y= Deaths)) + geom_bin_2d() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#This is a heatmap of the worldwide accidents which also depicts if AUto Pilot was engaged or not.
heatmap <- ggplot(tesla_data, aes(Country, Deaths)) +                          
  geom_tile(aes(fill = AutoPilot.claimed))
heatmap +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#This is a scatterplot that shows the deaths in the United States and shows if Auto Pilot was engaged or not.
ggplot((data = tesla_data), aes(color = AutoPilot.claimed, x= State, y= Deaths)) + geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#This is another plot of the United States' deaths while also showing how many accidents occured
# in each state.
ggplot((data = tesla_data), aes(x= State, y= Deaths)) + geom_bin_2d() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
