class Barracks

	attr_accessor :gold, :food

	def initialize
		@gold = 1000
		@food = 80

	end

	def train_footman
		@gold -= 135
		@food -= 2
		Footman.new
	end
  
  def can_train_footman?
    if enough_gold? && enough_food?
    	true
    else
    	false
    end
  end

  def enough_gold?
  	(@gold/135) > 1
  end

  def enough_food?
  	(@food/2) > 1
  end


end
