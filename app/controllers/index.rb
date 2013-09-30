get '/' do
  # Look in app/views/index.erb
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


get '/:username' do
  @user = TwitterUser.find_by_handle(params[:username])
  
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.limit(10)

  erb :recent_tweets
end

# POST =======================================================================

post '/' do
  TwitterUser.create(:handle => params[:username])

  redirect "/#{params[:username]}"
end
