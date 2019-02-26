class Calculator
  def tasks
    puts "Press 1 for Addition"
    puts "Press 2 for substraction"
    puts "Press 3 for Multiplication"
    puts "Press 4 for Division"
    option = gets.strip.to_i

    case option
      when 1
        puts "enter any two numbers"
        a = gets.strip.to_i
        b = gets.strip.to_i
        puts "sum  = #{a + b}"
        c = Calculator.new
        c.tasks
      when 2
        puts "enter any two numbers"
        a = gets.strip.to_i
        b = gets.strip.to_i
        puts "difference = #{a - b}"
        c = Calculator.new
        c.tasks
      when 3
        puts "enter any two numbers"
        a = gets.strip.to_i
        b = gets.strip.to_i
        puts "product = #{a * b}"
        c = Calculator.new
        c.tasks
      when 4
        puts "enter any two numbers"
        a = gets.strip.to_i
        b = gets.strip.to_i
        puts "div  = #{a / b}"
        c = Calculator.new
        c.tasks
      else
        puts "please enter valid number "
        c.tasks
    end
  end
end

c = Calculator.new
c.tasks