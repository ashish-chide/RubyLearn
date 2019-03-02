require 'csv'

class FileReader
  def initialize(filename)
    @filename = filename
  end

  def create_class(arg,arr)
    klass = Object.const_set(create_filename, Class.new )
    p "#{klass} class is created"
    dynamic_init(klass,arg,arr)
  end

  def dynamic_init(klass,arg,arr)
    klass.class_eval do
      define_method :initialize do |param = {}|
        arg.each_with_index do |x,index|
          instance_variable_set("@#{x}", param.values[index])
          end
        end
      arg.each do |x|
        define_method "set_#{x}" do |val|
          instance_variable_set("@#{x}", val)
          end
        define_method "get_#{x}" do
          instance_variable_get("@#{x}")
        end
       end
    end
    create_objects(klass, arr,arg)
  end

  def create_objects(klass, arr,arg)
    arr.each_with_index do |x, index|
      next if index == 0
      row = x.split(",")
      hash= {}
      arg.each_with_index do |y|
        hash[y] = row[index]
      end
      p hash
      p a = klass.new(hash)
    end
  end

  def read_header
    f = File.read(@filename)
    arr  = f.split("\r\n")
    arg = arr.first.split(",")
    create_class(arg, arr)
  end

  private
  def create_filename
    class_name = @filename.gsub("s.csv", "")
    arr = class_name.split('_').each { |x| x.capitalize! }
    arr.join("")
  end
end

file_reader = FileReader.new("marathi_books.csv")
file_reader.read_header