require './lib/reader'
require './lib/writer'
require './lib/parser'

class Converter
  def initialize (options)
    @reader = FileReader.new(options[:input_file])
    @writer = FileWriter.new(options[:output_file])
    @parser = NginxParser.new
  end
  
  def convert
    total = errors = 0
    
    while line = @reader.read
      total += 1
      row = @parser.parse(line)
      
      if row.nil?
        errors += 1
        row = line
      end
      
      @writer.write(row)
    end
    
    {:total => total, :errors => errors}
  end
end
