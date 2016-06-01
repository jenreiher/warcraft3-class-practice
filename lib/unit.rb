class Unit

	attr_reader :health_points, :attack_power 

	def initialize(health_points,attack_power)
  	@health_points = health_points
  	@attack_power = attack_power
  end

  def damage(damage_done)
  	@health_points -= damage_done
  end

  def attack!(enemy)
  	if enemy.is_a?(Unit)
  		enemy.damage(attack_power)

    elsif enemy.is_a?(Barracks)
      rounded_half_damage = (attack_power / 2.0).ceil
      enemy.damage(rounded_half_damage)

    end
      
  end

  def dead?

  end

end