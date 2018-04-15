require_relative 'services/browse_nasa'
require_relative 'services/feed_nasa'
require_relative 'services/lookup_nasa'

class Nasa

	def feed_nasa_service
		FeedNasa.new
	end

	def browse_nasa_Service
		BrowseNasa.new
	end

	def lookup_nasa_service
		LookupNasa.new
	end

end