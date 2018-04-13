require_relative 'services/browse_nasa'
require_relative 'services/feed_nasa'
require_relative 'services/lookup_nasa'

class Nasa

	def feed_nasa_service
		FeedNasa.new
	end

end