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
  x<-read_html(paste0("https://ignaciomsarmiento.github.io/GEIH2018_sample/pages/geih_page_",page_numb,".html")) %>% html_table()
  x<-x[[1]]            
}

db_list<-lapply(1:10,readHTML)  #itera sobre las páginas y retorna una lista con 10 elementos
db<-do.call(rbind,db_list) #une todo en un data.frame


