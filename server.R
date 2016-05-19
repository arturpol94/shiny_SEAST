
library(ggplot2)
library(shiny)
library(dplyr)
library(lubridate)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
  
  tweets_frame <- reactive({
    in_file <- input$in_file  # Accedemos al input
    
    if (is.null(in_file))
      return(NULL)
    
    file_path <- in_file$datapath 
    
    read.table(file_path, header = TRUE,sep = "\t", stringsAsFactors = FALSE) %>%
      
      mutate(.,
             anno = year(fecha),
             mes = month(fecha),
             dia = day(fecha),
             hora = hour(fecha),
             minuto = minute(fecha),
             hora0 = (dia - min(dia)) * 24 + hora + minuto/60
      )
    
  })
   
    
    
    output$tweets <- renderTable({
        
       
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame(), input$display))

    })
    
   
    
    output$plot <- renderPlot({
      
      copia <- tweets_frame()
      copia <- filter(copia, fecha>input$range[1] & fecha<input$range[2])
      
      
      tabla <- copia 
      
      tabla$hora0 <- cut(tabla$hora0, input$slider)
      
      ggplot(data=tabla, aes(x=hora0, color = animo, fill=animo)) +
        geom_bar(position = "dodge")
      
    })
})















