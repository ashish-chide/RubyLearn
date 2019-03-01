
require_relative 'product'

class Customer
    def tasks
      puts ""
      puts "Enter 1 to view all the products"
      puts "Enter 2 to Search a product"
      puts "Enter 3 to Buy  a product"
      puts "Enter 4 to Switch to Vendor(Shopkeeper)"

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
        when 4
          vendor = Vendor.new
          vendor.tasks
        else
          puts "please enter correct value"
      end
     end
end