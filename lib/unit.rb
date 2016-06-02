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
  	if enemy.is_a?(Unit) && !dead?
  		if !enemy.dead?
        enemy.damage(attack_power)
      else
        false
      end

    elsif enemy.is_a?(Barracks)
      rounded_half_damage = (attack_power / 2.0).ceil
      enemy.damage(rounded_half_damage)

    end
      
  end

  def dead?
    if health_points <= 0
      health_points = 0
      return true
    else
      false
    end
  end

end