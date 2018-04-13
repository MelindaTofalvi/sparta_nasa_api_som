require "json"
require 'httparty'

class FeedNasa
	include HTTParty

	base_uri 'https://api.nasa.gov'

	def get_asteroids_by_feed(start_date, end_date, api_key)
		@start_date = start_date
		@end_date = end_date
		@api_key = api_key
		@feed_data = JSON.parse(self.class.get("/neo/rest/v1/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{api_key}").body)
	end

	def get_a_hash_returned
		@feed_data.class
	end

end

