class ReviewsController < ApplicationController

	def filter
	end
	
	def display_tweets
		text_for_reviews_search = params[:make]+' '+params[:model]+' '+params[:version]
		p text_for_reviews_search.inspect
		session['text_for_reviews_search'] = text_for_reviews_search
		since_date = params[:date][:year]+'-'+params[:date][:month]+'-'+params[:date][:day]
		p since_date
		
		@tweets = $client.search("#{text_for_reviews_search}", :lang => "en", :result_type => "recent", :since=> since_date).take(20)	
	end

	def display_fb_posts
		graph = Koala::Facebook::API.new('CAACEdEose0cBAASUzMf2G7KASb7Jp2VdDZASaGYvGRUtzqysGHkZC0dRkyT32Ix3oOVxStysG5oJWLv9XhPacLQMVRiZBHjIYCi3rvQuxHvQ0XZCXsnOZApr6khUCCVrN4gmJd6f7AEWZCH2fMOpZB3IdP6FnLcwQcZC2iI7GmsOlHxvvtHOZBOtcDLamRCACZA2pqd1KSYrZAZBn77IPOrzOhZAD')
		model = session['text_for_reviews_search'].split(' ')[0]	
		@fb_posts = graph.search(model,:type=>'post')
		#raise @fb_posts.inspect
	end
end
