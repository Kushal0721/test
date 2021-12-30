library(readxl)
library(tidyverse)
library(ggplot2)
library(plotly)


setwd("C:/Users/kurizal2101/Documents/Weekly updates Project 033")
df <- read_excel("BB_Category_ColX_UPCS.xlsx", 
                 sheet = "BB_Category", col_types = c("text", 
                                                      "text", "text", "numeric", "numeric", 
                                                      "numeric", "numeric", "numeric"))

df %>% filter(Similar > 0) %>%
  plot_ly(labels = ~dept_descr,
          values = ~upc_count,
          marker = list(colors = c("red","blue","purple","yellow", "orange"))) %>%
  add_pie(hole = 0.2) %>%
  layout(xaxis = list(zeroline = F,
                      showline = F,
                      showticklabels = F,
                      showgrid = F),
         yaxis = list(zeroline = F,
                      showline = F,
                      showticklabels=F,
                      showgrid=F),
         title = "Break down of the 230,963 UPCS that remained in the same department")


colnames(df[c(2,4)]) <- c("dept_descr","upc_count")




sum(df$Similar)

sum(df$upc_count) - sum(df$Similar)





hbf <- df %>% filter(Similar==0 & bc_dept_descr %in% c("HEALTH & BEAUTY CARE", "FROZEN"))


hbf %>% filter(Similar == 0) %>%
  plot_ly(labels = ~dept_descr,
          values = ~upc_count,
          marker = list(colors = c("red","blue","purple","yellow", "orange"))) %>%
  add_pie(hole = 0.2) %>%
  layout(xaxis = list(zeroline = F,
                      showline = F,
                      showticklabels = F,
                      showgrid = F),
         yaxis = list(zeroline = F,
                      showline = F,
                      showticklabels=F,
                      showgrid=F),
         title = "Break down of the 185,629 UPCS that changed to Health and Beauty Care or Frozen")



sum(hbf$upc_count)



nhbf <- df %>% filter(Similar==0 & !bc_dept_descr %in% c("HEALTH & BEAUTY CARE", "FROZEN"))



nhbf %>% filter(Similar == 0) %>%
  plot_ly(labels = ~dept_descr,
          values = ~upc_count,
          marker = list(colors = c("red","blue","purple","yellow", "orange"))) %>%
  add_pie(hole = 0.2) %>%
  layout(xaxis = list(zeroline = F,
                      showline = F,
                      showticklabels = F,
                      showgrid = F),
         yaxis = list(zeroline = F,
                      showline = F,
                      showticklabels=F,
                      showgrid=F),
         title = "Break down of the 24,499 UPCS that changed to existing heirachies")

sum(nhbf$upc_count)



