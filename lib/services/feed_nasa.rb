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

	def get_class_of_element_count
		@feed_data["element_count"].class
	end

	def is_element_count_positive?
		@feed_data["element_count"] > 0 ? true : false
	end

	def get_the_class_of_neo
		@feed_data["near_earth_objects"].class
	end

	def get_class_of_nrid
		@feed_data["near_earth_objects"]["2015-09-08"][0]["neo_reference_id"].class
	end

	def length_of_of_nrid
		@feed_data["near_earth_objects"]["2015-09-08"][0]["neo_reference_id"].length
	end

	def get_class_of_name
		@feed_data["near_earth_objects"]["2015-09-08"][0]["name"].class
	end

	def get_class_of_amh
		@feed_data["near_earth_objects"]["2015-09-08"][0]["absolute_magnitude_h"].class
	end

	def get_value_of_amh
		@feed_data["near_earth_objects"]["2015-09-08"][0]["absolute_magnitude_h"]
	end

	def is_estimated_diameter_max_higher?(unit)
		max = @feed_data["near_earth_objects"]["2015-09-08"][0]["estimated_diameter"][unit]["estimated_diameter_max"]
		min = @feed_data["near_earth_objects"]["2015-09-08"][0]["estimated_diameter"][unit]["estimated_diameter_min"]
		max > min ? true : false
	end

	def get_class_of_is_potentially_hazardous_asteroid
		@feed_data["near_earth_objects"]["2015-09-08"][0]["is_potentially_hazardous_asteroid"].class
	end

	def get_class_of_close_approach_data
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"].class
	end

	def get_class_of_close_approach_date
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["close_approach_date"].class
	end

	def get_class_of_epoch_date_close_approach
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["epoch_date_close_approach"].class
	end

	def get_class_of_relative_velocity
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["relative_velocity"].class
	end

	def is_kilometers_per_hour_correct?
		km_per_second = @feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["relative_velocity"]["kilometers_per_second"].to_f
		km_per_hour = @feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["relative_velocity"]["kilometers_per_hour"].to_f.round(5)
		calculation = (km_per_second * 3600).round(5)
		calculation === km_per_hour ? true : false
	end

	def get_class_of_miss_distance
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["miss_distance"].class
	end

	def get_class_of_lunar
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["miss_distance"]["lunar"].class
	end

	def get_class_of_astronomical
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["miss_distance"]["astronomical"].class
	end

	def get_class_of_kilometers_in_miss_distance
		@feed_data["near_earth_objects"]["2015-09-08"][0]["close_approach_data"][0]["miss_distance"]["kilometers"].class
	end
end