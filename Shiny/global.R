library(tm)
library(wordcloud)
library(memoise)
library(googleVis)
library(ggplot2)



players<-list("Virat Kohli"="kohli",
              "MS Dhoni"= "dhoni",
              "Jasprit Bumrah" ="bumrah",
              "Joe Root"="root",
              "Jos Buttler"="butler",
              "Ben Stokes"="Ben Stokes",
              "Chris Gayle"="gayle",
              "Dwayne Bravo"="bravo",
              "Carlos Brathwaite"="brathwaite",
              "David Warner"="warner",
              "Shane Watson"="watson",
              "Glenn Maxwell"="maxwell",
              "Mushfiqur Rahim"="mushfiqur",
              "Tamim Iqbal"="tamim",
              "Mustafizur Rahman"="mustafizur",
              "Shahid Afridi"="afridi",
              "Mohammad Amir"="amir",
              "Quinton de Kock"="dekock",
              "AB de Villiers"="devillers",
              "Hashim Amla"="amla",
              "Martin Guptill"="guptill",
              "Mitchell Santner"="santner",
              "Ross Taylor"="taylor",
              "Angelo Mathews"="mathews",
              "Tillakaratne Dilshan"="dilshan",
              "Lasith Malinga"="malinga",
              "Mohammad Shahzad"="shahzad"
              
              )

catch.error = function(x)
{
  # Create a missing value for test purpose
  y = NA
  
  # Try to catch that error (NA) we just created
  
  catch_error = tryCatch(tolower(x), error=function(e) e)
  
  # if not an error, convert y to lowercase
  if (!inherits(catch_error, "error"))
  
    y = tolower(x)
  
  # check result if error exists, otherwise the function works fine.
  return(y)
}

cleanTweets<- function(tweet){
  
  # Clean the tweet for sentiment analysis
  # remove html links, which are not required for sentiment analysis
  
  tweet = gsub("(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", tweet)
  
  # First we will remove retweet entities from
  
  tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ", tweet)
  
  # Then remove all "#Hashtag"
  
  tweet = gsub("#\\w+", " ", tweet)
  
  # Then remove all "@people"
  
  tweet = gsub("@\\w+", " ", tweet)
  
  # Then remove all the punctuation
  
  tweet = gsub("[[:punct:]]", " ", tweet)
  
  # Then remove numbers, we need only text for analytics
  
  tweet = gsub("[[:digit:]]", " ", tweet)
  
  # finally, we remove unnecessary spaces (white spaces, tabs etc)
  
  tweet = gsub("[ \t]{2,}", " ", tweet)
  tweet = gsub("^\\s+|\\s+$", "", tweet)
  
  tweet = catch.error(tweet)
  
  tweet
}

cleanTweetsAndRemoveNAs<- function(Tweets) {
  
  TweetsCleaned = sapply(Tweets, cleanTweets)
  
  # Remove the "NA" tweets from this tweet list
  
  TweetsCleaned = TweetsCleaned[!is.na(TweetsCleaned)]
  
  names(TweetsCleaned) = NULL
 
  # Remove the repetitive tweets from this tweet list
  
  TweetsCleaned = unique(TweetsCleaned)
  
  TweetsCleaned
}

getCleanTweets <- memoise(function(player) {
  
  
  if (!(player %in% players))
    stop("Unknown player")
  
  tweets <-readLines(sprintf("./Data/%s.txt",player)) 
  
  tweetsCleaned<-cleanTweetsAndRemoveNAs(tweets)
  
  tweetsCleaned
  
})

getTermMatrix <- memoise(function(player) {
  
  
  if (!(player %in% players))
    stop("Unknown Player")
  
  text <- readLines(sprintf("./Data/%s.txt", player),
                    encoding="latin1",warn=FALSE)
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  
  # remove URLs
  removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
  myCorpus <- tm_map(myCorpus, content_transformer(removeURL))
  
  # remove anything other than English letters or space
  removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
  myCorpus <- tm_map(myCorpus, content_transformer(removeNumPunct))
  
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,stopwords("en"))
  
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but","hotel","Hotel"))
  # remove extra whitespace
  myCorpus <- tm_map(myCorpus, stripWhitespace)
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  
  
  m<-as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})

getEmotions <- memoise(function(player) {
  
  
  if (!(player %in% players))
    stop("Unknown player")
  
  data <-read.csv(sprintf("./Emotions/%s.csv",player)) 
  
  data
})

