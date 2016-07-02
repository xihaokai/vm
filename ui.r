library(shiny)

shinyUI(fluidPage(
  titlePanel(title = "Test Page1测试"),
  sidebarPanel("sideBar"),
  mainPanel("mainPanel")
  )
)