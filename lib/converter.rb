require './lib/reader'
require './lib/writer'
require './lib/parser'

class Converter

  attr_reader :last_result

  def initialize (options)
    @reader = FileReader.new(options.input_file)
    @writer = FileWriter.new(options.output_file, {:col_sep => options.csv_separator})
    @parser = NginxParser.new
  end
  
  def convert
    total = errors = 0
    @writer.write(@parser.headers)
    
    while line = @reader.read
      total += 1
      row = @parser.parse(line)
      
      if row.nil?
        errors += 1
        row = [line]
      end
      
      @writer.write(row)
    end
    
    @last_result = {:total => total, :errors => errors}

    self
  end
end
