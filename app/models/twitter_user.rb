class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.handle)
    tweets.each do |tweet|
      self.tweets << Tweet.find_or_create_by_tweet(tweet.text)
    end
  end

  def tweets_stale?
    user_tweets = self.tweets.order("created_at DESC").limit(10)
    user_tweets.each do |tweet|
      return true if (Time.now - tweet.created_at) > (5*60)
    end
  end

  # def tweets_stale?
  #   tweets = Twitter.user_timeline(self.handle)
  #   tweeted_at = []
  #   tweets.each do |tweet|
  #     tweeted_at << tweet.created_at
  #   end
  #   average = tweeted_at.reduce(:+)/tweeted_at.length #tabled for now...
  # end

end
