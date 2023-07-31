library('shiny')
shinyServer(function(input, output) {
  
  output$wybrany_film <-renderDataTable(
    load.informacja(input$nazwy_gatunkow, input$tytul, 
                    input$aktor, input$rezyser, input$narodowosci,
                    input$wypozyczalnie)
  )

})
