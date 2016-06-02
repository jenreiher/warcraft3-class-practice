require_relative 'spec_helper'

#Units start off alive but they die if their HP reaches 0 or lower. 
#This is usually a result of receiving damage from combat.

########
#Part 1#
########

#Define a method #dead? on the Unit class. 
#We add it to Unit instead of Footman because all Units can die, 
#not just Footmans or Peasants.

########
#Part 2#
########

#A dead Unit cannot attack another Unit. 
#Conversely, a living Unit will also not attack another Unit that is already dead.

describe Unit do

	before :each do
		@unit = Unit.new(10, 10)
	end

	describe '#dead?' do
		it "should return true if unit's life points are at 0" do
			expect(@unit).to receive(:health_points) {0}
			expect(@unit.dead?).to be_truthy
		end

		it "should return false if unit's life points are at 1" do
			expect(@unit).to receive(:health_points) {1}
			expect(@unit.dead?).to be_falsy
		end

		it "should return true if unit's life points are at -1" do
			expect(@unit).to receive(:health_points) {-1}
			expect(@unit.dead?).to be_truthy
		end

		it "should return false if unit's life points are above 0" do
			expect(@unit.dead?).to be_falsy
		end
	end

	describe '#attack!' do

		it 'should not attack another unit if it is dead' do
			@fately_wounded = Unit.new(0,0)
			expect(@unit.attack!(@fately_wounded)).to be_falsy

		end

		it 'a dead unit should not attack' do
			expect(@unit).to receive(:dead?) { true }
			expect(@unit.attack!(Unit.new(1,1))).to be_falsy
		end

	end

end
