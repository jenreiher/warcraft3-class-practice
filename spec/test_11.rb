require_relative 'spec_helper'

# In most strategy games, like Warcraft III, buildings can also be attacked by Units. 
# Since a Barracks is a building, it has substantially more HP (500). 
# Additionally, a Footman does only half of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

# The damage amount should be an integer (Fixnum), 
# but the ceiling (ceil) of the division should be used as the resulting amount.


describe Footman do

	before :each do
		@footman = Footman.new
		@under_seige = Barracks.new
	end

	describe "#attack!" do

		it "should do half the number of attack_points when attacking class of Barracks" do
			expect(@under_seige).to receive(:damage).with(5)
			@footman.attack!(@under_seige)
		end

		it 'should round up the health points if the number is not even' do
			expect(@footman).to receive(:attack_power) { 5 }
			expect(@under_seige).to receive(:damage).with(3)
			@footman.attack!(@under_seige)
		end

	end

end

describe Barracks do

	before :each do
		@barracks = Barracks.new
	end

	it 'should create a new Barracks with the health of 500HP' do
		expect(@barracks.health_points).to eq(500)
	end

end