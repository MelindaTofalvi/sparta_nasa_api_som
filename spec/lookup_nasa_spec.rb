require 'spec_helper'

describe 'Nasa'do
	
	context 'Lookup a specific Asteroid based on its ID' do

	before(:all) do
		@nasa_lookup = LookupNasa.new
		puts JSON.pretty_generate(@nasa_lookup.lookup_asteroids('3542520','glUBf9vQ69EfqyuzF4nlmkNxmQH7tiE1fNP875AX')).gsub(":", "=>")
	end

	it 'should return a hash as a result' do
		expect(@nasa_lookup.get_a_hash_returned).to eq Hash
	end 

	it 'should return a string for neo_reference_id with min 5 characters in it' do
		expect(@nasa_lookup.get_class_of_nrid).to eq String
		expect(@nasa_lookup.length_of_of_nrid).to be >= 5
	end

	it 'should return a string for name' do
		expect(@nasa_lookup.get_class_of_name).to eq String
	end

	it 'should return a float for absolute_magnitude_h thatis bigger than 0' do
		expect(@nasa_lookup.get_class_of_amh).to eq Float
		expect(@nasa_lookup.get_value_of_amh).to be > 0
	end

	it 'should return a bigger value for estimated_diameter_max than for estimated_diameter_min in kilometers' do
		expect(@nasa_lookup.is_estimated_diameter_max_higher?("kilometers")).to be true
	end

	it 'should return a bigger value for estimated_diameter_max than for estimated_diameter_min in meters' do
		expect(@nasa_lookup.is_estimated_diameter_max_higher?("meters")).to be true
	end

	it 'should return a bigger value for estimated_diameter_max than for estimated_diameter_min in miles' do
		expect(@nasa_lookup.is_estimated_diameter_max_higher?("miles")).to be true
	end

	it 'should return a bigger value for estimated_diameter_max than for estimated_diameter_min in feet' do
		expect(@nasa_lookup.is_estimated_diameter_max_higher?("feet")).to be true
	end

	it 'should return boolean for is_potentially_hazardous_asteroid' do
		expect(@nasa_lookup.get_class_of_is_potentially_hazardous_asteroid).to eq(TrueClass).or(eq(FalseClass))
	end

	it 'should return an array for close_approach_data' do 
		expect(@nasa_lookup.get_class_of_close_approach_data).to eq Array
	end

	it 'should return a string for close_approach_date' do
		expect(@nasa_lookup.get_class_of_close_approach_date). to eq String
	end

	it 'should return an integer for epoch_date_close_approach' do 
		expect(@nasa_lookup.get_class_of_epoch_date_close_approach).to eq Integer
	end

	it 'should return a hash for relative_velocity' do
		expect(@nasa_lookup.get_class_of_relative_velocity).to eq Hash
	end

	it 'should return correct value for kilometers_per_hour' do
		expect(@nasa_lookup.is_kilometers_per_hour_correct?).to be true
	end

	it 'should return hash for miss_distance' do
		expect(@nasa_lookup.get_class_of_miss_distance).to eq Hash
	end

	it 'should return string for lunar' do
		expect(@nasa_lookup.get_class_of_lunar).to eq String
	end

	it 'should return string for astronomical' do
		expect(@nasa_lookup.get_class_of_astronomical).to eq String
	end

	it 'should return a string for kilometers in miss_distance' do 
		expect(@nasa_lookup.get_class_of_kilometers_in_miss_distance).to eq String
	end

	it 'should return a hash for orbital_data' do
		expect(@nasa_lookup.get_class_of_orbital_data).to eq Hash
	end

	it 'should return a string for orbit_id' do
		expect(@nasa_lookup.get_class_of_orbit_id).to eq String
	end

	end

end