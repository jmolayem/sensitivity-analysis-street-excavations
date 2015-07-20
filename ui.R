library(shiny)

shinyUI(navbarPage("Utility Helper Toolbox",
                   tabPanel("Big Picture",
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Adjust the length and width for sensitivity analysis"),
                                sliderInput("l",
                                            "Max Length (ft)",
                                            min=1,
                                            max=120,
                                            value=120),
                                sliderInput("w",
                                            "Max Width (ft)",
                                            min=1,
                                            max=120,
                                            value=120),
                                sliderInput("m",
                                            "max number of utilities willing to relocate per site",
                                            min=0,
                                            max=7,
                                            value=7),
                                radioButtons("iType", "Choose plot type:",
                                             list("BigSites","BigUtil","Sites","Utilities"))),
                              mainPanel(
                                h4("Overview Map"),
                                plotOutput("random"))
)),
tabPanel("Individual",
         sidebarLayout(
           sidebarPanel(
             helpText("Adjust the length and width for sensitivity analysis"),
             sliderInput("o",
                         "Max Length (ft)",
                         min=1,
                         max=120,
                         value=120),
             sliderInput("p",
                         "Max Width (ft)",
                         min=1,
                         max=120,
                         value=120),
             radioButtons("mType", "Choose plot type:",
                          list("s19650","s179720","s204250","s60400","s37430","s157040","s46850","s193050","s227200"))),
           mainPanel(
             h4("Site Map"),
             plotOutput("nextt"))))))