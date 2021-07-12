#! /usr/bin/env ruby
#GravityFlip
#https://www.codewars.com/kata/5f70c883e10f9e0001c89673

def flip(dir, box)
  if dir == 'R'
    box.map{|line| line.sort}
  elsif dir == 'L'
    box.map{|line| line.sort.reverse}
  elsif dir == 'U'
    box.transpose.map{|col| col.sort.reverse}.transpose
  elsif dir == 'D'
    box.transpose.map{|col| col.sort}.transpose
  end
end
