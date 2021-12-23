library(shiny)
source("src/loadApp.R")

ui <- fluidPage(
  loadApp("shiny-examples-main/001-hello/app.R", tag = "ex1", load_what = "ui")
)

server <- function(input, output) {
  loadApp("shiny-examples-main/001-hello/app.R", tag = "ex1", load_what = "server")
}

shinyApp(ui, server)
