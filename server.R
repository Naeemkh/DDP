#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Load data
latlon.df <-  read.table("seismic_data.txt", header = TRUE)

CERI_web <- c("<a href='http://www.memphis.edu/ceri/'> CERI </a>")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$mymap <- renderLeaflet({
    
    data.md <- latlon.df[latlon.df$Year>input$year[1] & latlon.df$Year<input$year[2] &
                         latlon.df$Mag>input$mag[1] & latlon.df$Mag < input$mag,]
    
    
    my_map <- leaflet() %>% addTiles()
    my_map <- my_map %>% addCircleMarkers(lat = data.md$Lat, lng=data.md$Lon, popup=data.md$Name, weight=1, radius=4)
    CERI_web <- c("<a href='http://www.memphis.edu/ceri/'> CERI </a>")
    my_map <- my_map %>% addMarkers(lat = 35.123288, lng=-89.932483, popup=CERI_web)
    my_map
    
    })
  
  output$bvalue <- renderText({
    
    data.md <- latlon.df[latlon.df$Year>=input$year[1] & latlon.df$Year<input$year[2] &
                           latlon.df$Mag>=input$mag[1] & latlon.df$Mag[2] < input$mag,]
    if (input$CBV == TRUE){
      m_mean <- mean(data.md$Mag)
      m_min  <- min(data.md$Mag)

        b <- round(log10(exp(1))/(m_mean - m_min),2)
        paste("b-value: ",b)

      
      
      
    }
   
  })
  
})
