

library(shiny)

#------------------------------------------------------------------------------

shinyUI(
    
    ## Barra de navegacion
    
    navbarPage("#GoTSeason6",
               
               ## Panel 1
               
               tabPanel("Data Input",
                        sidebarLayout(
                            sidebarPanel(
                                fileInput("in_file", "Selecciona archivo"),
                            
                                numericInput("display","How many to display?","0") 
                            ),
                            
                            mainPanel(
                                tableOutput("tweets")
                            )
                        )
               ),
               
               ## Panel 2
               
               tabPanel("Resultados",
                        sidebarLayout(
                            sidebarPanel(
                              
                                   sliderInput("slider","Number",2,20,2),
                                  dateRangeInput("range","Range")
                                  
                            
                              
                                ),
                            mainPanel(
                              
                            
                                  plotOutput("plot")
                               
                              )
                        )
               )
               
    )  ##-- Fin navbarPage #GoTSeason6
)











