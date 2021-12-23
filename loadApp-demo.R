library(shiny)
source("src/loadApp.R")

# # Define server logic required to draw a histogram
# server_a <- function(input, output, session) {
#   
#   output$distPlot <- renderPlot({
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2] 
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#     
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
#   })
# }

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  loadUI("example-1/ui.R", tag = "ex1")
)

server <- function(input, output) {
  
  loadServer("example-1/server.R", tag = "ex1")
  
  # moduleServer(
  #   "ex1",
  #   server_a
  # )
}

shinyApp(ui, server)
