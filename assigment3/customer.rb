
require_relative 'product'

class Customer


    def tasks
      puts ""
      puts "enter 1 to view all the products"
      puts "enter 2 to Search a product"
      puts "enter 3 to Buy  a product"

      task_input = gets.strip.to_i

      case task_input
        when 1
          list = Product.new
          list.list_product
          c = Customer.new
          c.tasks
        when 2
          search =  Product.new
          search.search_product
          c = Customer.new
          c.tasks
        when 3
          search =  Product.new
          search.buy_product
          c = Customer.new
          c.tasks
        else
          puts "please enter correct value"
      end

     end




end