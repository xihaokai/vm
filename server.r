library(shiny)

shinyServer(function(input, output) {
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
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
  })
})