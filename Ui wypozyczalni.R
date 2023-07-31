library(shiny)
source(file='funkcje_pomocnicze.r')

shinyUI(fluidPage(
  titlePanel("Sieć wypożyczalni < Damian > "),
  fluidRow(
    column(4,
           selectInput(inputId ="tytul", 
                       label = "Nazwa filmu:" ,
                       choices =c("-",load.tytul()),
                        selected = "-")),
    column(4,
           selectInput(inputId = "aktor", 
                       label = "Główny aktor:",
                       choices = c("-",load.aktorzy()))),
    column(4,
           selectInput(inputId = "rezyser", 
                       label = "Reżyser:",
                       choices = c("-",load.rezyserzy())
           ))
  ),
  fluidRow(
    column(4,
           selectInput(inputId= "nazwy_gatunkow", 
                       label = "Gatunek:", 
                       choices = c("-", load.gatunki()))
    ),
    column(4,
           selectInput(inputId= "narodowosci", 
                       label ="Narodowość głównego aktora:", 
                       choices = c("-", load.kraje()))),
    column(4,
           selectInput(inputId= "wypozyczalnie", 
                       label = "Wypożyczalnia:", 
                       choices = c("-",load.wypozyczalnie()))),
    fluidRow(
      column(4,
      ),

      column(4,
             submitButton("Szukaj")
      ))
    
  ),
  mainPanel(
    textOutput("wybrany_gatunek"),
    dataTableOutput("wybrany_film")
  )
))
