require 'json'
class Product
  def new_product
    puts "Enter the name of the product"
    name = gets.strip.to_s
    puts "Enter the price of the product"
    price =  gets.strip.to_i
    puts "Enter the Company name"
    cname = gets.strip.to_s
    puts "Enter the number of stock for the item"
    stock = gets.strip.to_i
    u = new_id
    id = u + 1
    product = {id: id, name: name ,price: price ,company_name: cname ,  stock: stock }
    File.open("data.txt", "a") { |file| file.puts JSON.dump(product) }
    puts "The Item is successfully added"
  end

  def new_id
    f = return_hash
    last_added_product = JSON.parse(f.last)
    return last_added_product["id"].to_i
  end

  def return_hash
     f = File.read("data.txt").split("\n")
     return f
  end

  def list_product
     f = return_hash
     f.each do |item|
        data = JSON.load(item)
        puts data
        end
  end

  def remove_product
    puts "Enter the id of product to be removed"
    id = gets.strip.to_i
    f = return_hash
    new_data = []
    f.each do |item|
      data = JSON.load(item)
      if data["id"] != id
        new_data << data
      end
    update_db(new_data)
    end
   end

  def search_product
    puts "Enter the Name of the product to be searched"
    n = gets.strip
    new_data = []
    f = return_hash
    f.each do |item|
      data = JSON.load(item)
      if  data["name"] =~ /#{n}/
        new_data << data
      # else
      #   puts "Looks like Item with name '#{n}' does not exists"
      end
    end
    p new_data
  end

  def edit_product
    puts "Enter the product id to be updated"
    i = gets.strip.to_i
    f = return_hash
    new_data = []
    f.each do |item|
       data = JSON.load(item)
       if  data["id"] == i
          puts " Enter the new name"
          n = gets.strip
          puts " Enter the new Price"
          pr = gets.strip.to_i
          data["name"] = n
          data["price"] = pr
          new_data << data
       else
          new_data << data
       end
    end
    update_db(new_data)
  end

  def buy_product
    list_product
    puts "Enter the id of product to Buy it !"
    i = gets.strip.to_i
    new_data = []
    f = return_hash
    f.each do |item|
      data = JSON.load(item)
      if data["id"] == i && data["stock"] > 0
        place_order(data["id"],data["name"])
        data["stock"] -= 1
        puts "order has been placed successfully"
        new_data << data
      elsif  data["id"] == i && data["stock"] < 1
         puts "Out of stock"
         new_data << data
      else
         new_data << data
      end
    end
    update_db(new_data)
  end

  def place_order(id , name )
    puts "Enter the card number !"
    card_no = gets.strip.to_i
    puts "Enter the cvv !"
    cvv = gets.strip.to_i

    File.open("order.txt" , "a") do |file|
          order_details = { id: id , name: name, card: card_no, cvv: cvv }
          file.puts JSON.dump(order_details)
      end
  end

  def update_db(data)
      File.open("data.txt" , "w") do |file|
       data.each do |item|
       file.puts JSON.dump(item)
       end
    end
  end


end







