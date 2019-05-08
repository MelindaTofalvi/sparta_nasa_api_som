require 'json'
require 'httparty'

class LookupNasa
	include HTTParty

	base_uri 'https://api.nasa.gov'

	def lookup_asteroids(asteroid_id, api_key)
		@lookup_data = JSON.parse(self.class.get("/neo/rest/v1/neo/#{asteroid_id}?api_key=#{api_key}").body)
	end

	def get_a_hash_returned
		@lookup_data.class
	end

	def get_class_of_nrid
		@lookup_data["neo_reference_id"].class
	end

	def length_of_of_nrid
		@lookup_data["neo_reference_id"].length
	end

	def get_class_of_name
		@lookup_data["name"].class
	end

	def get_class_of_amh
		@lookup_data["absolute_magnitude_h"].class
	end

	def get_value_of_amh
		@lookup_data["absolute_magnitude_h"]
	end

	def is_estimated_diameter_max_higher?(unit)
		max = @lookup_data["estimated_diameter"][unit]["estimated_diameter_max"]
		min = @lookup_data["estimated_diameter"][unit]["estimated_diameter_min"]
		max > min ? true : false
	end

	def get_class_of_is_potentially_hazardous_asteroid
		@lookup_data["is_potentially_hazardous_asteroid"].class
	end

	def get_class_of_close_approach_data
		@lookup_data["close_approach_data"].class
	end

	def get_class_of_close_approach_date
		@lookup_data["close_approach_data"][0]["close_approach_date"].class
	end

	def get_class_of_epoch_date_close_approach
		@lookup_data["close_approach_data"][0]["epoch_date_close_approach"].class
	end

	def get_class_of_relative_velocity
		@lookup_data["close_approach_data"][0]["relative_velocity"].class
	end

	def is_kilometers_per_hour_correct?
		km_per_second = @lookup_data["close_approach_data"][0]["relative_velocity"]["kilometers_per_second"].to_f
		km_per_hour = @lookup_data["close_approach_data"][0]["relative_velocity"]["kilometers_per_hour"].to_f.round(5)
		calculation = (km_per_second * 3600).round(5)
		calculation === km_per_hour ? true : false
	end

	def get_class_of_miss_distance
		@lookup_data["close_approach_data"][0]["miss_distance"].class
	end

	def get_class_of_lunar
		@lookup_data["close_approach_data"][0]["miss_distance"]["lunar"].class
	end

	def get_class_of_astronomical
		@lookup_data["close_approach_data"][0]["miss_distance"]["astronomical"].class
	end

	def get_class_of_kilometers_in_miss_distance
		@lookup_data["close_approach_data"][0]["miss_distance"]["kilometers"].class
	end

	def get_class_of_orbital_data
		@lookup_data['orbital_data'].class
	end

	def get_class_of_orbit_id
		@lookup_data['orbital_data']['orbit_id'].class
	end

end