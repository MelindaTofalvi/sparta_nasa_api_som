require 'json'
require 'httparty'

class BrowseNasa
	include HTTParty

	base_uri 'https://api.nasa.gov'

	def browse_asteroids(api_key)
		@browse_data = JSON.parse(self.class.get("/neo/rest/v1/neo/browse?api_key=#{api_key}").body)
	end

	def get_a_hash_returned
		@browse_data.class
	end

	def get_class_of_size
		@browse_data["page"]["size"].class
	end

	def is_size_positive?
		@browse_data["page"]["size"] > 0 ? true : false
	end

	def get_class_of_total_elements
		@browse_data["page"]["total_elements"].class
	end

	def get_class_of_total_pages
		@browse_data["page"]["total_pages"].class
	end

	def get_class_of_number
		@browse_data["page"]["number"].class
	end

	def get_class_of_nrid
		@browse_data["near_earth_objects"][0]["neo_reference_id"].class
	end

	def length_of_of_nrid
		@browse_data["near_earth_objects"][0]["neo_reference_id"].length
	end

	def get_class_of_name
		@browse_data["near_earth_objects"][0]["name"].class
	end

	def get_class_of_amh
		@browse_data["near_earth_objects"][0]["absolute_magnitude_h"].class
	end

	def get_value_of_amh
		@browse_data["near_earth_objects"][0]["absolute_magnitude_h"]
	end

	def is_estimated_diameter_max_higher?(unit)
		max = @browse_data["near_earth_objects"][0]["estimated_diameter"][unit]["estimated_diameter_max"]
		min = @browse_data["near_earth_objects"][0]["estimated_diameter"][unit]["estimated_diameter_min"]
		max > min ? true : false
	end

	def get_class_of_is_potentially_hazardous_asteroid
		@browse_data["near_earth_objects"][0]["is_potentially_hazardous_asteroid"].class
	end

	def get_class_of_close_approach_data
		@browse_data["near_earth_objects"][0]["close_approach_data"].class
	end

	def get_class_of_close_approach_date
		@browse_data["near_earth_objects"][0]["close_approach_data"][0]["close_approach_date"].class
	end

	def get_class_of_epoch_date_close_approach
		@browse_data["near_earth_objects"][0]["close_approach_data"][0]["epoch_date_close_approach"].class
	end

	def get_class_of_relative_velocity
		@browse_data["near_earth_objects"][0]["close_approach_data"][0]["relative_velocity"].class
	end

	def is_kilometers_per_hour_correct?
		km_per_second = @browse_data["near_earth_objects"][0]["close_approach_data"][0]["relative_velocity"]["kilometers_per_second"].to_f
		km_per_hour = @browse_data["near_earth_objects"][0]["close_approach_data"][0]["relative_velocity"]["kilometers_per_hour"].to_f.round(5)
		calculation = (km_per_second * 3600).round(5)
		calculation === km_per_hour ? true : false
	end

	def get_class_of_miss_distance
		@browse_data["near_earth_objects"][0]["close_approach_data"][0]["miss_distance"].class
	end

	def get_class_of_lunar
		@browse_data["near_earth_objects"][0]["close_approach_data"][0]["miss_distance"]["lunar"].class
	end

end