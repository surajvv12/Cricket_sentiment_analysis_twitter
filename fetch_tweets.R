library(twitteR)

api_key<-"your_api"
api_secret<-"your_api_secret"
access_token<-"your_acess_token"
acess_token_secret<-"your_acess_token_secret"

setup_twitter_oauth(api_key,api_secret,access_token,acess_token_secret)


#Indian Players

#1)Virat Kohli

kohli_tweets<-searchTwitter('Virat Kohli',since = '2016-03-08',until = '2016-04-03',n=10000,lang = "en")
kohli_tweets<-sapply(kohli_tweets,function(x) x$getText())

#2)MS Dhoni

dhoni_tweets<-searchTwitter('MS Dhoni',since = '2016-03-08',until = '2016-04-03',n=10000,lang = "en")
dhoni_tweets<-sapply(dhoni_tweets,function(x) x$getText())
#3) Jasprit Bumrah

bumrah_tweets<-searchTwitter('Jasprit Bumrah',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
bumrah_tweets<-sapply(bumrah_tweets,function(x) x$getText())
# England Players

#1) Joe Root

root_tweets<-searchTwitter('Joe Root',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
root_tweets<-sapply(root_tweets,function(x) x$getText())

#2)Jos Buttler

butler_tweets<-searchTwitter('Jos Buttler',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
butler_tweets<-sapply(butler_tweets,function(x) x$getText())

#3)Ben Stokes

stokes_tweets<-searchTwitter('Ben Stokes',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
stokes_tweets<-sapply(stokes_tweets,function(x) x$getText())

#West Indies Team

#1)Chris Gayle

gayle_tweets<-searchTwitter('Chris Gayle',since = '2016-03-08',until = '2016-04-03',n=10000,lang = "en")
gayle_tweets<-sapply(gayle_tweets,function(x) x$getText())

#2)Dwayne Bravo
bravo_tweets<-searchTwitter('Dwayne Bravo',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
bravo_tweets<-sapply(bravo_tweets,function(x) x$getText())

#3)Carlos Brathwaite

brathwaite_tweets<-searchTwitter('Carlos Brathwaite',since = '2016-03-08',until = '2016-04-05',n=5000,lang = "en")
brathwaite_tweets<-sapply(brathwaite_tweets,function(x) x$getText())

#Australia Team

#1) David Warner

warner_tweets<-searchTwitter('David Warner',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
warner_tweets<-sapply(warner_tweets,function(x) x$getText())

#2)Shane Watson

watson_tweets<-searchTwitter('Shane Watson',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
watson_tweets<-sapply(watson_tweets,function(x) x$getText())

#3)Glenn Maxwell
maxwell_tweets<-searchTwitter('Glenn Maxwell',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
maxwell_tweets<-sapply(maxwell_tweets,function(x) x$getText())

#Bangladesh Team

#1)Mushfiqur Rahim

mushfiqur_tweets<-searchTwitter('Mushfiqur Rahim',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
mushfiqur_tweets<-sapply(mushfiqur_tweets,function(x) x$getText())

#2)Tamim Iqbal

tamim_tweets<-searchTwitter('Tamim Iqbal',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
tamim_tweets<-sapply(tamim_tweets,function(x) x$getText())

#3)Mustafizur Rahman

mustafizur_tweets<-searchTwitter('Mustafizur Rahman',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
mustafizur_tweets<-sapply(mustafizur_tweets,function(x) x$getText())

#Pakistan Team

#1)Shahid Afridi

afridi_tweets<-searchTwitter('Shahid Afridi',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
afridi_tweets<-sapply(afridi_tweets,function(x) x$getText())

#2) Mohammad Amir

amir_tweets<-searchTwitter('Mohammad Amir',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
amir_tweets<-sapply(amir_tweets,function(x) x$getText())

#South Africa Team

#1)Quinton de Kock

dekock_tweets<-searchTwitter('Mohammad Amir',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
dekock_tweets<-sapply(dekock_tweets,function(x) x$getText())

#2)AB de Villiers

devillers_tweets<-searchTwitter('AB de Villiers',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
devillers_tweets<-sapply(devillers_tweets,function(x) x$getText())

#3)Hashim Amla
amla_tweets<-searchTwitter('Hashim Amla',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
amla_tweets<-sapply(amla_tweets,function(x) x$getText())

#Newzeland Team

#1)Martin Guptill
guptill_tweets<-searchTwitter('Martin Guptill',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
guptill_tweets<-sapply(guptill_tweets,function(x) x$getText())

#2)Mitchell Santner
santner_tweets<-searchTwitter('Mitchell Santner',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
santner_tweets<-sapply(santner_tweets,function(x) x$getText())

#3)Ross Taylor
taylor_tweets<-searchTwitter('Ross Taylor',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
taylor_tweets<-sapply(taylor_tweets,function(x) x$getText())

#SriLanka Team

#1)Angelo Mathews

mathews_tweets<-searchTwitter('Angelo Mathews',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
mathews_tweets<-sapply(mathews_tweets,function(x) x$getText())

#2)Tillakaratne Dilshan

dilshan_tweets<-searchTwitter('Tillakaratne Dilshan',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
dilshan_tweets<-sapply(dilshan_tweets,function(x) x$getText())

#3)Lasith Malinga

malinga_tweets<-searchTwitter('Lasith Malinga',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
malinga_tweets<-sapply(malinga_tweets,function(x) x$getText())

#Afghanisthan Team

#1)Mohammad Shahzad

shahzad_tweets<-searchTwitter('Mohammad Shahzad',since = '2016-03-08',until = '2016-04-03',n=5000,lang = "en")
shahzad_tweets<-sapply(shahzad_tweets,function(x) x$getText())
