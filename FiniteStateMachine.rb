#! /usr/bin/env ruby
# Simple Finite State Machine Compiler
# https://www.codewars.com/kata/59923f1301726f5430000059

# repozytorium na github

class FSM
  def initialize(instructions)
    @states = {}
    
     instructions.split("\n").each do |line|
      temp = line.split('; ')
       @states[temp[0]] = temp[1].split(', ').append( temp[2].to_i ) 
     end
  end
  
  
  def run_fsm(start, sequence)
    path = [start]
    output = 0
    current_state = start
    
    for i in sequence
      
      rule = @states[current_state]
      current_state = rule[i]
      path.append(current_state)
      output = @states[current_state][2]
    end
    
    return [current_state, output, path]
  end
  
end