require_relative 'product'
SEPARATOR ='|'

module  FileOperation
  def to_line(arr)
    line = arr.join(SEPARATOR) << "\n"
  end

  def to_lineh(hash)
    line = hash.values.join(SEPARATOR) << "\n"
  end

  def is_empty(filename , hash)
    if File.zero?(filename)
      line = hash.keys.join(SEPARATOR) << "\n"
      append(line, filename)
    end
  end

  def append(arr, filename)
    f = File.open(filename ,"a+") {|f| f.write(arr) }
  end

  def write(arr, filename)
    f = File.open(filename ,"w") {|f| f.write(arr) }
  end

  def read(filename)
    f = File.open(filename ,"r") { |f| f.each_line {|line| p line} }
  end
end
