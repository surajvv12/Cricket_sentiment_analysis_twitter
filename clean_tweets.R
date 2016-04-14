catch.error = function(x)
{
  # let us create a missing value for test purpose
  y = NA
  # Try to catch that error (NA) we just created
  catch_error = tryCatch(tolower(x), error=function(e) e)
  # if not an error
  if (!inherits(catch_error, "error"))
    y = tolower(x)
  # check result if error exists, otherwise the function works fine.
  return(y)
}

cleanTweets<- function(tweet){
 
  # Clean the tweet for sentiment analysis
  
  # remove html links
  
  tweet = gsub("(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", tweet)
  
  # Remove retweet entities
  
  tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ", tweet)
  
  # Remove all "#Hashtag"
  
  tweet = gsub("#\\w+", " ", tweet)
  
  # Remove all "@people"
 
  tweet = gsub("@\\w+", " ", tweet)
  
  # Remove all the punctuation
  
  tweet = gsub("[[:punct:]]", " ", tweet)
  
  # Remove numbers, we need only text for analytics
  
  tweet = gsub("[[:digit:]]", " ", tweet)
  
  # Remove unnecessary spaces (white spaces, tabs etc)
  
  tweet = gsub("[ \t]{2,}", " ", tweet)
  tweet = gsub("^\\s+|\\s+$", "", tweet)
  
  #Convert all text to lowercase
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