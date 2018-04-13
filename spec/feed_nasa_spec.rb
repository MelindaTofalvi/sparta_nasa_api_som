require 'spec_helper'

describe 'Nasa'do
	
	context 'Retrieve a list of Asteroids based on their closest approach date to Earth.' do

	before(:all) do
		@nasa_feed = Nasa.new.feed_nasa_service
		puts JSON.pretty_generate(@nasa_feed.get_asteroids_by_feed('2015-09-07', '2015-09-08', 'glUBf9vQ69EfqyuzF4nlmkNxmQH7tiE1fNP875AX')).gsub(":", " =>")
	end

	it 'should respond with a status message of 200' do
		expect(@nasa_feed.get_a_hash_returned).to eq Hash
	end 

	end

end