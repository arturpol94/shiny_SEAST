

library(shiny)
library(dplyr)
library(lubridate)

##-----------------------------------------------------------------------------

shinyServer(function(input, output) {
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Rellenar para que tweets_frame sea reactivo
    
    ##-------------------------------------------------------------------------
    
    ## Tabla de tweets
    
    ##---------------------------------------------------------------------
    
    ##TAREA2: Modificar para que trabaje con expresión reactiva
    
    ##---------------------------------------------------------------------
    
    output$tweets <- renderTable({
        
        in_file <- input$in_file  # Accedemos al input
        
        if (is.null(in_file))
            return(NULL)
        
        file_path <- in_file$datapath  # in_file es una lista. El path esta en datapath.
        
        tweets_frame <- read.table(file_path, header = TRUE,
                                   sep = "\t", stringsAsFactors = FALSE) %>%
            mutate(.,
                   anno = year(fecha),
                   mes = month(fecha),
                   dia = day(fecha),
                   hora = hour(fecha),
                   minuto = minute(fecha),
                   hora0 = (dia - min(dia)) * 24 + hora + minuto/60
            )
        
        ##---------------------------------------------------------------------
        
        ##TAREA1: Cambiar para que el numero de filas lo elija el usuario.
        
        ##---------------------------------------------------------------------
        
        return(head(tweets_frame, 5))

    })
    
    ##-------------------------------------------------------------------------
    
    ##TAREA2: Implementar grafico de evolucion de tweets
    
    ##-------------------------------------------------------------------------
    
})















