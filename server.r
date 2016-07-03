library(shiny)
library(ggplot2)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  data <- reactive({
    inFile <- input$file1
    if (~is.null(inFile))
    data <- read.csv(inFile$datapath)
    data
  })
  
  
  output$ui <- renderUI({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    data <- read.csv(inFile$datapath)
    selectInput("vmId",
                "VM编号:",
                c("All", unique(data$VM编号))
    )
  })
  # Filter data based on selections
  output$table1 <- DT::renderDataTable(DT::datatable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    data <- read.csv(inFile$datapath)
    if (input$vmId != "All") {
      data <- data[data$VM编号 == input$vmId,]
    }
    data
  }))
  
  output$table2 <- DT::renderDataTable(DT::datatable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    data <- read.csv(inFile$datapath)
    names <- unique(data$名称)
    
    summ <- data.frame(names)
    
    num_sold <- 1:length(names)
    profit <- 1:length(names)
    
    i <- 1
    for (prod in names) {
      num_sold[i] <- length(data[data$名称 == prod, 1])
      profit[i] = num_sold[i] * data[data$名称 == prod, "毛利"][1]
      i = i+1
    }
    
    summ <- cbind(summ, num_sold)
    summ <- cbind(summ, profit)
    
    data <- summ
    
    if (input$vmId != "All") {
      data <- data[data$VM编号 == input$vmId,]
    }
    data
  }))
  
})