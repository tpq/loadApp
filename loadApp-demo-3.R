library(shiny)
source("src/loadApp.R")

ui <- fluidPage(
  tabsetPanel(
    id = "wizard",
    type = "hidden",
    tabPanel("home", 
             h2("Welcome to the App Menu!"),
             actionButton("loadapp1", "App 1"),
             actionButton("loadapp2", "App 2")
    ),
    tabPanel("app1",
             loadApp("shiny-examples-main/001-hello/app.R", tag = "ex1", load_what = "ui")
    ),
    tabPanel("app2", 
             loadApp("shiny-examples-main/002-text/app.R", tag = "ex2", load_what = "ui")
    )
  ),
  
  h2(""),
  actionButton("home", "Home")
)

server <- function(input, output, session){
  
  switch_page <- function(page){
    updateTabsetPanel(inputId = "wizard", selected = page)
  }
  
  observeEvent(input$home, {
    session$reload()
    switch_page("home")
  })
  
  observeEvent(input$loadapp1, {
    switch_page("app1")
    loadApp("shiny-examples-main/001-hello/app.R", tag = "ex1", load_what = "server")
  })
  
  observeEvent(input$loadapp2, {
    switch_page("app2")
    loadApp("shiny-examples-main/002-text/app.R", tag = "ex2", load_what = "server")
  })
}

shinyApp(ui, server)
