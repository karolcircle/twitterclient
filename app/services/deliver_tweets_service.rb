class DeliverTweetsService

  def self.deliver_tweets(id)
    twitter_account = TwitterAccount.find(id)
    id = twitter_account.id
    tag = twitter_account.name

    begin
    if twitter_account.tweets.empty?
      find_tweets(tag, id)
    else
      refresh_tweets(tag, id, twitter_account)
    end
    rescue Twitter::Error::NotFound
    end
  end

  def self.find_tweets(tag, id)
    result = TwitterApi.client.user_timeline(tag).take(10).map(&:text)
    build_tweets(result, id)
  end

  def self.refresh_tweets(tag, id, twitter_account)
    search_new = TwitterApi.client.user_timeline(tag).take(10).map(&:text)
    search_old = twitter_account.tweets.pluck(:text)
    result = search_new + search_old
    result = result.uniq
    result = result.first(10)
    twitter_account.tweets.destroy_all
    build_tweets(result, id)
  end

  def self.build_tweets(result, id)
    result.each do |content|
      tweet = Tweet.new
      tweet.text = content
      tweet.twitter_account_id = id
      tweet.save
    end
  end
end
