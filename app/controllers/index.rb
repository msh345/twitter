get '/' do
  @user = "Mark Horowitz"

  erb :index
end

# get '/:username' do
#   @tweets = Twitter.user_timeline(params[:username])
#   erb :recent_tweets
# end

# get '/:username' do
#   @user = TwitterUser.find_by_handle(params[:username])
  
#   if @user.tweets.empty?
#     @user.fetch_tweets!
#   end

#   @tweets = @user.tweets.limit(10)

#   erb :recent_tweets
# end


# get '/:username' do
#   @user = TwitterUser.find_by_handle(params[:username])
  
#   if @user.tweets_stale?
#     @user.fetch_tweets!
#   end

#   @tweets = @user.tweets.limit(10)

#   if request.xhr?
#     erb :_recent_tweets, layout: false
#   else
#     erb :recent_tweets
#   end
# end


get '/:tweet' do
  @tweet = params[:tweet]
  if request.xhr?
    erb :_recent_tweets, layout: false
  else
    erb :recent_tweets
  end
end



# POST =======================================================================

post '/' do
  Twitter.update(params[:tweet])
  redirect to "/#{params[:tweet]}"
end
