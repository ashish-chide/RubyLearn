require_relative 'product'
SEPARATOR ='|'

module  FileOperation
  def to_line(arr)
    line = arr.join(SEPARATOR) << "\n"
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
