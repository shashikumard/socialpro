class HomeController < ApplicationController
	require 'twitter'
	before_filter :authenticate_user!, :except => ['index']
  def index
  end

	def display_tweets
	
@tweets = $client.search("#timesofindia", :lang => "en", :result_type => "recent").take(3)
#raise @tweets.inspect

	end
end
