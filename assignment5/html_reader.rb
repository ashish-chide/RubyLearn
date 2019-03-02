require 'csv'
# html reader
class HtmlReader
  TD = %r{(\<td\>)(.*)(\<\/td\>)}.freeze
  TH = %r{(\<th\>)(.*)(\<\/th\>)}.freeze
  TAG = %r{(<strong>|<\/strong>|<small>|<\/small>)}.freeze

  def initialize(filename, csvfile)
    @filename = filename
    @csvfile = csvfile
  end

  def read_header
    f = File.open(@filename, 'r')
    header_arr = []
    f.each_line do |x|
      y = x.gsub(/","/, ',')
      match_data = TH.match(y).to_a
      header_arr << match_data[2].to_s.split('</th><th>')
    end
    write_header(header_arr)
  end

  def write_header(header_arr)
    File.open(@csvfile, 'w') do |f|
      f.write(to_line(header_arr)) if File.zero?(@csvfile)
    end
    read_row
  end

  def read_row
    f = File.open(@filename, 'r')
    row_arr = []
    f.each_line do |x|
      y = x.gsub(TAG, '').gsub(/","/, ',').gsub(/, /, ' ')
      match_data = TD.match(y).to_a
      row_arr << match_data[2].to_s.split('</td><td>')
    end
    write_row(row_arr)
  end

  def write_row(row_arr)
    row_arr.each_with_index do |row, index|
      next if index.zero?

      File.open(@csvfile, 'a') { |f| f.write(to_line(row)) }
    end
  end

  def to_line(line)
    line.join(',') << "\n"
  end
end

html = HtmlReader.new('vehicle_reports.html', 'table.csv')
html.read_header
