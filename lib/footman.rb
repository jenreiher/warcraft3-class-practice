# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit

	attr_accessor :health_points 
	attr_reader :attack_power
	
	def initialize
  	@health_points = 60
  	@attack_power = 10
  end

  def damage(damage_done)
  	@health_points -= damage_done
  end

  def attack!(enemy)
  	enemy.damage(@attack_power)
  end


end
