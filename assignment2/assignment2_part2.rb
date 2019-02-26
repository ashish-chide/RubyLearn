puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "1. Write a method which takes 3 arguments number1, number2, block and return the output Create 4 blocks which can be passed as 3rd arguments: operations can be add, substract, multiply, divide"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"


def operation (a, b , block)
  return block.call(a,b)
end
addition =  Proc.new { |x,y| x + y }
substract =  Proc.new { |x,y| x - y }
multiply =  Proc.new { |x,y| x * y }
divide =  Proc.new { |x,y| x / y }

p operation(12,23,addition)
p operation(12,23,substract)
p operation(12,23,multiply)
p operation(12,23,divide)


puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "2. write a method: 'compose' which takes two procs and returns a new proc which, when called, calls the first proc and passes its result into the second proc. both of the proc arguments takes a number argument"
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

def compose(block1 , block2)
  Proc.new{ |a,b| a.call() }
  res = block1.call(5)
  block2.call(res)
end

block1 = Proc.new{ |x|  x * 2 }
block2 = Proc.new{ |y|  y * y }

p compose(block1,block2)

puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "3. Write a lambda which takes first_name and last_name and returns full_name."
puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

my_lambda =lambda {|first_name,last_name| puts "#{first_name} #{last_name}"}
my_lambda.call("Ashish", "chide")