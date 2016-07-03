library(shiny)

# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("1231"),
    
    sidebarLayout(
      position = "right",
      sidebarPanel(
        fileInput('file1', 'Choose CSV File',
                  accept=c('text/csv', 
                           'text/comma-separated-values,text/plain', 
                           '.csv'))
      ),
      mainPanel()
    ),
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(3, wellPanel(
        # This outputs the dynamic UI component
        uiOutput("ui")
      ))
    ),
    
    # Create a new row for the table.
    tabsetPanel(
      tabPanel("零售数据",DT::dataTableOutput("table1")),
      tabPanel("整合数据",DT::dataTableOutput("table2"))
    )
  )
)