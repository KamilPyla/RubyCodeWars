#! /usr/bin/env ruby
# The Greatest Warrior
# https://www.codewars.com/kata/5941c545f5c394fef900000c

class Warrior
  attr_reader :experience, :achievements
  
  @@ranks = ["Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest"]
  
  def initialize
    @experience = 100
    @achievements = []
  end
  
  def rank
    @@ranks[level/10]
  end
  
  def level
    @experience / 100
  end
  
	
  def battle(enemy_level)
		return "Invalid level" if enemy_level > 100 or enemy_level < 1
    
		diff = enemy_level - level
    
		return "You've been defeated" if level/10 < enemy_level/10 and diff > 4
		response(diff)
  end
  
  def training(train)
    description, experience, min_level = train
    if min_level > level
      return "Not strong enough"
    end
    add_experience experience
    @achievements << description
    return description
  end
	
	private

	def response (diff)
		responses = ["A good fight", "An intense fight", "Easy fight"]
		res = 2
		case diff
		when 0
			add_experience 10
			res = 0
		when -1
			add_experience 5
			res = 0
		when (1...10)
			add_experience 20*diff**2
			res = 1
		end
		responses[res]
	end
  
	def add_experience(points)
		@experience += points
		if @experience > 10000
			@experience = 10000
		end
	end
end