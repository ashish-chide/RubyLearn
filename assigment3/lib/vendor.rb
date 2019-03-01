require_relative 'product'

class Vendor

  def tasks
    puts ""
    puts "Enter 1 to add new item"
    puts "Enter 2 to Remove item"
    puts "Enter 3 to search item"
    puts "Enter 4 to edit list item"
    puts "Enter 5 to list item"
    puts "Enter 6 to Switch to Cutomer"

    tasks_input = gets.strip.to_i

    case tasks_input
      when  1
        new_item = Product.new
        new_item.new_product
        v = Vendor.new
        v.tasks
      when  2
        remove_item = Product.new
        remove_item.remove_product
        v = Vendor.new
        v.tasks
      when  3
        search_item = Product.new
        search_item.search_product
        v = Vendor.new
        v.tasks
      when  4
        edit_item = Product.new
        edit_item.edit_product
        v = Vendor.new
        v.tasks
      when  5
        list_item = Product.new
        list_item.list_product
        v = Vendor.new
        v.tasks
      when  6
        c = Customer.new
        c.tasks
      else
        puts "select correct values!"
      end
   end
end
