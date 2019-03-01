require_relative 'vendor'
require_relative 'product'
require_relative 'customer'

class Launch
 def start
    puts "If you are a Vendor press 1 or a Customer then 2"
    user_input = gets.strip.to_i
    if (user_input == 1)
      vendor = Vendor.new
      vendor.tasks
    elsif (user_input == 2)
      customer = Customer.new
      customer.tasks
    else
      puts "Please enter a Valid Input!"
    end
 end
end
l = Launch.new
l.start