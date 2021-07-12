#! /usr/bin/env ruby
#Gravity Flip (3D version)
# https://www.codewars.com/kata/5f849ab530b05d00145b9495

def flip(dir, box)
  case dir 
    when 'R'
      box.map{|line| line.sort}
    when 'L'
      box.map{|line| line.sort.reverse}
    when 'U'
      box.transpose.map{|col| col.sort.reverse}.transpose
    when 'D'
      box.transpose.map{|col| col.sort}.transpose
   end
end