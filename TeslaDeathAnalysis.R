library(ggplot2)
library(shiny)

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

#This is another plot of the United States' deaths while also showing how many accidents ocurred
# in each state.
ggplot((data = tesla_data), aes(x= State, y= Deaths)) + geom_bin_2d() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#######################################################################
# The second dataset analysis
tesla_data2 <- read.csv("tesla-deaths.csv")

#This is a scatterplot thats hows the number of deaths worldwide.
ggplot((data = tesla_data2), aes(alpha = 0.3, x= country, y= deaths)) + geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#This is a plot showing the number of deaths in each country and easily displays where the most concentrated
#number of deaths were.
ggplot((data = tesla_data2), aes(x= country, y= deaths)) + geom_bin_2d() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#######################################################################
# Shiny App Framework
ui <- fluidPage(
  
  titlePanel("Tesla Car Deaths"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    x <- tesla_data$Country
    y <- tesla_data$Deaths
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#007bc2", border = "white",
         xlab = "Country",
         ylab = "Deaths",
         main = "Histogram of Tesla car Related Deaths in all Countries")
  })
}

shinyApp(ui = ui, server = server)

#App still has issues that need to be fixed but this is the framework for the shiny app.
