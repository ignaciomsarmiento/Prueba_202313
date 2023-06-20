##########################################################
# author: Ignacio Sarmiento-Barbieri
#
##########################################################

#Clean the workspace
rm(list=ls())
cat("\014")
local({r <- getOption("repos"); r["CRAN"] <- "http://cran.r-project.org"; options(repos=r)}) #set repo



#Load Packages
pkg<-list("tidyverse","ggplot2")
lapply(pkg, require, character.only=T)
rm(pkg)



setwd("~/Desktop/Prueba_202313/")


readHTML<-function(page_numb){
  x<-read_html(paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_",page_numb,".html")) 
  #Faltan Pasos para obtener la tabla (completar ustedes)
}

db_list<-lapply(1:10,readHTML)  #itera sobre las páginas y retorna una lista con 10 elementos
db<-do.call(rbind,db_list) #une todo en un data.frame

# Seguimos con el codigo _ DR

modelo2caret_loocv <- train(lnw_2016~educ, 
                           data = nlsy, 
                            method = 'lm',
                             trControl= ctrl_loocv )