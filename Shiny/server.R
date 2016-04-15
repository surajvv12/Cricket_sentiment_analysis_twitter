function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
      })
    })
  })
  
  data_emotion<-reactive({
    
    getEmotions(input$selection)
    
  })
  
  
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  
  output$wordcloud1 <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(5,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
  
  output$bar1<-renderPlot({
    
    plot1<-head(data.frame(Freq=terms()),n=20)
    plot1$word<-row.names(plot1)
    ggplot(plot1,aes(x=reorder(word,Freq),y=Freq))+geom_bar(stat="identity",fill="steelblue")+theme_minimal()+coord_flip()+geom_text(aes(label=Freq),vjust=0.5,color="black",size=4.0)+ylab("Frequency of words")+xlab("Top Words")+ggtitle("Top frequency words")
  }) 
 
  output$pie1<-renderGvis({
    
    data<-data_emotion()
    emotion1<-as.data.frame(table(data$emotion))
    Pie1<-gvisPieChart(emotion1,options = list(width=1200,height=600))
    return(Pie1)
    
  })
  
  output$pie2<-renderGvis({
    
    data<-data_emotion()
    emotion2<-as.data.frame(table(data$polarity))
    Pie2<-gvisPieChart(emotion2,options = list(width=1200,height=600))
    return(Pie2)
    
  })
  output$score1<-renderPlot({
    
    data<-data_emotion()
    ggplot(data,aes(x=score))+geom_histogram(bins=50,color="black",fill="lightgreen")+theme_minimal()+xlab("Sentiment Score")+ylab("count")+ggtitle("Sentiment Scores of reviews")
  })
}