library("RPostgres")
open.my.connection <- function() {
  con <- dbConnect(RPostgres::Postgres(),dbname = 'wypozyczalnie_filmow', 
                   host = 'localhost',
                   port = 5432, # port ten sam co w psql 
                   user = 'projekt',
                   password = 'oaza')
  return (con)
}

close.my.connection <- function(con) {
  dbDisconnect(con)
}

load.gatunki <- function() {
  query = "SELECT nazwa FROM gatunki"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}
load.kraje <- function() {
  query = "SELECT kraj FROM panstwa"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}

load.wypozyczalnie <- function() {
  query = "SELECT nazwa FROM wypozyczalnie"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}
load.informacja <- function(gatunek,tytul,aktor_glowny,rezyser, pochodzenie,wypozyczalnia) {
  query = paste0("SELECT * FROM informacja WHERE(gatunek='",
                 gatunek,"' OR tytul='",tytul,"' OR aktor_glowny='",
                 aktor_glowny,"' OR rezyser='", rezyser,
                 "' OR pochodzenie='",pochodzenie,
                 "' OR wypozyczalnia='", wypozyczalnia, "')")
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}
load.rezyserzy <- function() {
  query = "SELECT imie_i_nazwisko FROM rezyserzy"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}
load.aktorzy <- function() {
  query = "SELECT imie_i_nazwisko FROM glowni_aktorzy"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}
load.tytul <- function() {
  query = "SELECT nazwa FROM filmy"
  con = open.my.connection()
  res = dbSendQuery(con,query)
  movies = dbFetch(res)
  dbClearResult(res)
  close.my.connection(con)
  return(movies)
}

