#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    mainPanel(
    h1("Main Panel Text"),
    p("Welcome to my shiny application! It's a very simple one, so you should have no problems to use it. In the following web page you can introduce your car's Cylinders using the slider below, and receive in the graph an expected mpg consumption!")
    ),
   
   # Application title
   h3("Histogram of mpg depending on car Cylinders"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("cyl",
                     "Cylinders:",
                     min = 4,
                     max = 8,
                     value = 5)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- mtcars[, 2] 
      bins <- seq(min(x), max(x), length.out = input$cyl + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'blue', border = 'white')
   })
})

# Run the application 
shinyApp(ui = ui, server = server)

