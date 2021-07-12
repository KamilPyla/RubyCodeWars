#! /usr/bin/env ruby
#Which are in?
# https://www.codewars.com/kata/550554fd08b86f84fe000a58

def in_array(array1, array2)
  array1.select{|word| array2.any? {|s| s.include? word } }.sort
end