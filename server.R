library(shiny)
library(ggplot2)
library(tidyr)
library(plyr)
start<-read.csv("overview")
shinyServer(function(input, output) {
  foots<-reactive({
    subset(start, issue=="Total" & Property=="length" & feet < input$l | Property=="width" & feet < input$w | issue=="Total" & everything < input$m)
  })
  one<-reactive({
    subset(start, Site=="196+50" & Property=="length" & feet < input$o | Site=="196+50" & Property=="width" & feet < input$p)
  })
  two<-reactive({
    subset(start, Site=="1797+20" & Property=="length" & feet < input$o | Site=="1797+20" & Property=="width" & feet < input$p)
  })
  three<-reactive({
    subset(start, Site=="2042+50" & Property=="length" & feet < input$o | Site=="2042+50" & Property=="width" & feet < input$p)
  })
  four<-reactive({
    subset(start, Site=="604+00" & Property=="length" & feet < input$o | Site=="604+00" & Property=="width" & feet < input$p)
  })
  five<-reactive({
    subset(start, Site=="374+30" & Property=="length" & feet < input$o | Site=="374+30" & Property=="width" & feet < input$p)
  })
  six<-reactive({
    subset(start, Site=="1570+40" & Property=="length" & feet < input$o | Site=="1570+40" & Property=="width" & feet < input$p)
  })
  seven<-reactive({
    subset(start, Site=="468+50" & Property=="length" & feet < input$o | Site=="468+50" & Property=="width" & feet < input$p)
  })
  eight<-reactive({
    subset(start, Site=="1930+50" & Property=="length" & feet < input$o | Site=="1930+50" & Property=="width" & feet < input$p)
  })
  nine<-reactive({
    subset(start, Site=="2272+00" & Property=="length" & feet < input$o | Site=="2272+00" & Property=="width" & feet < input$p)
  })
iplot <- reactive({
  switch(input$iType,
         Sites = ggplot(foots(), aes(x = Site, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         Utilities = ggplot(foots(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         BigUtil = ggplot(foots(), aes(x = Site, y = everything)) + theme_bw() + geom_bar(stat = "identity")+facet_wrap(~issue),
         BigSites = ggplot(foots(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity")+facet_wrap(~Site)
)
})
zplot <- reactive({
  switch(input$mType,
         s19650 = ggplot(one(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s179720 = ggplot(two(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s204250 = ggplot(three(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s60400 = ggplot(four(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s37430 = ggplot(five(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s157040 = ggplot(six(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s46850 = ggplot(seven(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s193050 = ggplot(eight(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity"),
         s227200 = ggplot(nine(), aes(x = issue, y = everything)) + theme_bw() + geom_bar(stat = "identity")
         )
})
output$random <- renderPlot({
  print(iplot())
})
output$nextt <- renderPlot({
  print(zplot())
})
})