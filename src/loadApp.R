makeUI <- function(ui, tag){
  
  html <- htmltools::renderTags(ui)
  html$html <- gsub("id=\"", paste0("id=\"", tag, "-"), html$html)
  return(html)
}

makeServer <- function(server, tag){
  
  formals(server) <- alist(input =, output =, session =)
  moduleServer(tag, server)
}

loadUI <- function(ui_file, tag){
  
  ui_src <- source(ui_file)
  ui <- ui_src$value
  makeUI(ui, tag = tag)
}

loadServer <- function(server_file, tag){
  
  server_src <- source(server_file)
  server <- server_src$value
  makeServer(server, tag = tag)
}

loadApp <- function(app_file, tag, load_what = c("ui", "server")){
  
  source(app_file)
  
  load_what <- load_what[1]
  if(load_what == "ui"){
    
    makeUI(ui, tag = tag)
    
  }else if(load_what == "server"){
    
    makeServer(server, tag = tag)
  }
}
