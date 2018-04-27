class Ranking < ApplicationRecord
  def randomAttack
    RandomGenerator.randomAttack()
  end
  def pointsCalculator(victory)
    victory ? 3 : 1
  end

end

class RandomGenerator   
    def randomAttack()
        rand(5) + chance()
    end
    
    def chance() 
        posibility = rand(100)
        case posibility 
          when 51...75
             5
          when 76...96
             10
          when 96...100
             20
          else
             0
        end
    end
    
end


