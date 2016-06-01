#Introduce a SiegeEngine Unit.

########
#Part 1#
########

#SiegeEngines will require lumber when built by a Barracks. 
#Besides food and gold, Barracks therefore also need to have a lumber resource.

#A Barracks starts off with 500 lumber.

########
#Part 2#
########

#The SiegeEngine is very effective against buildings such as the Barracks. 
#However, it is ineffective against other Units. (It can't attack them, as if they were dead.)

#So unlike with Footman (whose attacks do a fraction of the damage they normally would), 
#a SiegeEngine does 2× damage against a Barracks.

#Also, SiegeEngines can attack other SiegeEngines even though they cannot attack any other Units 
#(such as Peasants or Footmans.)

#SiegeEngines are initialized with the following stats.
#AP: 50
#HP: 400
#Cost: 200 gold, 60 lumber, 3 food
#Make note, you will need to require the siege_engine.rb file in spec_helper.rb.

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 600 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

end

describe SiegeEngines do

	before :each do
		@siege_engines = SiegeEngines.new
	end

	it "starts off with AP of 50"
		expect(@siege_engines.attack_points).to eq.(50)
	end

	it "starts off with HP of 400"
		expect(@siege_engines.health_points).to eq.(500)
	end

	describe '#can_build_siege_engine?' do
		it "returns true if there are enough resources to build a siege_engine"
			expect(@barracks.can_build_siege_engine?).to be_truthy
		end
	end

	describe '#attack!' do
		it "should not attack other types of units"
			@testObj_footman = Footman.new
			@testObj_peasant = Peasants.new
      expect(@siege_engines.attack!(@testObj_footman)).to be false
      expect(@siege_engines.attack!(@testObj_peasant)).to be false
		end

		it "should do two times as much damage against Barracks"
		  expect(attacker.attack!).to receive(:Barracks)
      expect(attacker.attack_power). to eq(100)
		end

		it "should do normal damage when attacking other SiegeEngines"
			expect(attacker.attack!).to receive(:SiegeEngines)
      expect(attacker.attack_power). to eq(50)
		end
	end


end