library(shinydashboard)
library(shiny)

dashboardPage(
  
  dashboardHeader(title = "T20 Cricket Players "),
  dashboardSidebar(
    h3("Choose the Player"),
    selectInput("selection", "",
                choices = players),
    actionButton("update", "Change"),
    hr(),
    
    sidebarMenu(
      menuItem("Wordcloud",tabName = "wordcloud",icon = icon("cloud")),
      menuItem("Top Words",tabName = "barchart",icon = icon("bar-chart")),
      menuItem("Emotions",tabName = "emotions",icon = icon("smile-o"))
      
      
    )
  ),
  
  dashboardBody(
    
    tabItems(
      
      tabItem(tabName ="wordcloud",
              
              
              
              fluidRow(
                
                tabBox(title = "",width = 12,
                       
                       tabPanel(title = tagList(shiny::icon("comments"),"Tweets"),
                                
                                
                                box(plotOutput("wordcloud1",height=500,width = 300)),
                                
                                box(title = "Controls",
                                    sliderInput("freq","Minimum Frequency:",
                                                min = 1,  max = 50, value = 15),
                                    sliderInput("max","Maximum Number of Words:",
                                                min = 1,  max = 300,  value = 100)
                                )
                       )
                       
                      
                       
                       
                       
                      
                )
                
                
                
              )
      ),
      
      tabItem(tabName = "barchart",
              
              fluidRow(
                
                tabBox(title = "",width = 12,
                       
                       tabPanel(title = tagList(shiny::icon("heart"),"Reviews"),
                                
                                plotOutput("bar1")
                       )
                       
                       
                       
                )
                
                
              )
              
              
      ),
      
      tabItem(tabName = "emotions",
              
              fluidRow(
                
                tabBox(title = "",width = 12,
                       
                       tabPanel(title = tagList(shiny::icon("smile-o"),"Polarity"),
                                
                                htmlOutput("pie2")
                       ),
                       
                       tabPanel(title = tagList(shiny::icon("pie-chart"),"Emotions"),
                                
                                htmlOutput("pie1")
                       ),
                       
                      
                       tabPanel(title = tagList(shiny::icon("thumbs-o-up"),"Emotion Score"),
                                
                                plotOutput("score1")
                                
                       )
                       
                       
                )
                
                
              )
              
              
      )
      
      
      
      
      
      
      
      
    )
    
    
  )
)




