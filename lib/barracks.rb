class Barracks

	attr_accessor :gold, :food, :lumber, :health_points

	def initialize
		@gold = 1000
		@food = 80
    @lumber = 500
    @health_points = 500
	end

  def damage(damage_done)
    @health_points -= damage_done
  end

	def train_footman
		if can_train_footman?
			@gold -= 135
			@food -= 2
			Footman.new
		else
			nil
		end
	end
  
  def can_train_footman?
    gold >= 135 && food >= 2
  end

  def train_peasant
  	if can_train_peasant?
  		@gold -= 90
  		@food -= 5
  		Peasant.new
  	else
  		nil
  	end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def can_build_siege_engine?
  	gold >= 200 && food >= 3 && lumber >= 60
  end

    def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      Peasant.new
    else
      nil
    end
  end

  

end
