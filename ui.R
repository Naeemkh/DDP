#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram


shinyUI(
  
  navbarPage("Earthquake Catalog Observation",
                   tabPanel("Data Visualization",
                            
titlePanel("Seismicity of Eastern United States"),
titlePanel("Naeem Khoshnevis"),
sidebarLayout(sidebarPanel(
 
  sliderInput("year","Catalog Period:", min=1974, max=2016, value=c(1990,2000), sep=""),
  sliderInput("mag", "Magnitude Range:", min = 1, max = 8, value = c(1,3), sep="", step=0.1),

  checkboxInput("CBV","Compute b-value"),
  fluidRow(
    column(8, verbatimTextOutput("bvalue")),
    hr(" "),
    hr(),
    p("b-value is a paremeter from the Gutenberg-Richter equation which is an indication of seismicity of the study region.")
  )
),
# Show a plot of the generated distribution
mainPanel(
  leafletOutput("mymap"),
  p("Data reference: http://www.memphis.edu/ceri/seismic/catalog.php")
)
)
),
             
                   tabPanel("About", 
                            
                          "This application is written for visualization of earthquake catalog in Eastern and Central United states. The Catalog Period
                           defines the interested time period. The Magnitude Range defines the interested earthquake magnitude. Use the slide bar to filter
                           the data for specific period of time and magnitude. The b-value is a paremeter from the Gutenberg-Richter equation which is an
                           indication of seismicity of the study region. Higher b-value suggests that the number of earthquke with higher magnitude was fairly
                           low in the study region. The b-value is calculated using the following equation: log(e)/(mean(M) - min(M)), where e is the mathematical
                           constant (e=2.718281), and M is all earthquakes of the filtered catalog. Popup icon represents the Cneter for Earthquake Reseach and
                           Information. Github repo: https://github.com/Naeemkh/DDP"
                                                        )
))




