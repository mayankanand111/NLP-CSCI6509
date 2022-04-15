import tweepy, time, csv

consumer_key = "kiI1yZr5WF6CXPiuHx7ZRKdY0"
consumer_secret = "V4GzzRH1XI2NfYtLUNw1TOhmId6D30fJgFOkvFZN51OrWMGZlH"
access_key = "631975571-WJz2kAK9lOmo4gMzLuBmD9LVZHAfNwA5S1jjrHOv"
access_secret = "QHE1YDWR2bA3DlmGK2rwbboCTQv8ZTu8HpKCfGcqzpRbp"

def get_profile(screen_name):
    auth = tweepy.OAuthHandler(consumer_key,consumer_secret)
    auth.set_access_token(access_key, access_secret)
    api = tweepy.API(auth)
    try:
        user_profile = api.get_user(screen_name = screen_name)
    except:
        user_profile = "broken"

    return user_profile

def get_tweets(screen_name):
    auth = tweepy.OAuthHandler(consumer_key,consumer_secret)
    auth.set_access_token(access_key,access_secret)
    api = tweepy.API(auth)
    try:
        tweets = api.user_timeline(screen_name = screen_name, count = 20)
    except:
        tweets = "broken"

    return tweets

profiles = ["DalhousieU", "google", "msdev", "CBCNS"]

with open ('lab7-tweets.csv','w') as outfile:
    writer = csv.writer(outfile)
    writer.writerow(["id","screen_name","created_at","text"])
    for profile in profiles:
        t = get_tweets(profile)
        for tweet in t:
            writer.writerow([tweet.id,tweet.user.screen_name,tweet.created_at,tweet.text.encode("utf-8")])