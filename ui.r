library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Test Page1"),
  sidebarPanel("sideBar"),
  mainPanel("mainPanel")
  )
)