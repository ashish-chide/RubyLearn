require 'csv'

class HtmlReader

  def initialize(filename , csvfile)
    @filename = filename
    @csvfile= csvfile
  end

  def read_header
   f = File.open(@filename , "r")
   header_arr = []
   f.each_line do |x|
      y = x.gsub(/","/, ",")
      match_data = /(\<th\>)(.*)(\<\/th\>)/.match(y).to_a
      header_arr  << match_data[2].to_s.split("</th><th>")
    end
   set_header(header_arr)
  end

  def set_header(header_arr)
    if File.zero?(@csvfile)
      File.open(@csvfile,"w") {|f| f.write(to_line(header_arr)) }
      read_row
    else
      read_row
    end
  end

  def read_row
  f = File.open(@filename , "r")
  row_arr = []
  f.each_line do |x|
      y = x.gsub(/(<strong>|<\/strong>|<small>|<\/small>)/,"").gsub(/","/, ",").gsub(/, /, " ")
      match_data = /(\<td\>)(.*)(\<\/td\>)/.match(y).to_a
      row_arr << match_data[2].to_s.split("</td><td>")
    end
  set_row(row_arr)
  end

  def set_row(row_arr)
    row_arr.each_with_index do |row,index|
      next if index == 0
      File.open(@csvfile,"a") {|f| f.write(to_line(row)) }
    end
  end

  def to_line(line)
    a = line.join(",") << "\n"
  end
end

html = HtmlReader.new("vehicle_reports.html", "table.csv")
html.read_header