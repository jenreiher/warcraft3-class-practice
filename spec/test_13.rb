require_relative 'spec_helper'


#Introduce a SiegeEngine Unit.

########
#Part 1#
########

#SiegeEngine will require lumber when built by a Barracks. 
#Besides food and gold, Barracks therefore also need to have a lumber resource.

#A Barracks starts off with 500 lumber.

########
#Part 2#
########

#The SiegeEngine is very effective against buildings such as the Barracks. 
#However, it is ineffective against other Units. (It can't attack them, as if they were dead.)

#So unlike with Footman (whose attacks do a fraction of the damage they normally would), 
#a SiegeEngine does 2× damage against a Barracks.

#Also, SiegeEngine can attack other SiegeEngine even though they cannot attack any other Units 
#(such as Peasants or Footmans.)

#SiegeEngine are initialized with the following stats.
#AP: 50
#HP: 400
#Cost: 200 gold, 60 lumber, 3 food
#Make note, you will need to require the siege_engine.rb file in spec_helper.rb.



describe SiegeEngine do

	before :each do
		@siege_engine = SiegeEngine.new
	end

	it "starts off with AP of 50" do
		expect(@siege_engine.attack_power).to eq(50)
	end

	it "starts off with HP of 400" do
		expect(@siege_engine.health_points).to eq(400)
	end

	describe '#attack!' do
		it "should not attack other types of units" do
			@testObj_footman = Footman.new
			@testObj_peasant = Peasant.new
      expect(@siege_engine.attack!(@testObj_footman)).to be_falsey
      expect(@siege_engine.attack!(@testObj_peasant)).to be_falsey
		end

		it "should do two times as much damage against Barracks" do
			barracks = Barracks.new

      expect(@siege_engine.attack!(barracks)).to eq(400)
		end

		it "should do normal damage when attacking other SiegeEngine" do
			under_seige = SiegeEngine.new
			barracks = Barracks.new
			
      expect(@siege_engine.attack!(under_seige)).to eq(350)
		end
	end


end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 600 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

  describe '#can_build_siege_engine?' do
		it "returns true if there are enough resources to build a siege_engine" do
			expect(@barracks.can_build_siege_engine?).to be_truthy
		end
	end

end