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
    if !dead? 

      if self.is_a?(SiegeEngine) 
        if enemy.is_a?(Barracks)
          doubled_damage = (attack_power * 2).ceil
          return enemy.damage(doubled_damage)
        end

        if enemy.is_a?(SiegeEngine)
          return enemy.damage(attack_power)
        end
        return false
      end
    

      if self.is_a?(Unit)
        if self.is_a?(Footman) || self.is_a?(Unit)
          if enemy.is_a?(Barracks)
            rounded_half_damage = (attack_power / 2.0).ceil
            return enemy.damage(rounded_half_damage)
          end
        end

        if enemy.is_a?(Unit) && !enemy.dead?
          return enemy.damage(attack_power)
        end
      end
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