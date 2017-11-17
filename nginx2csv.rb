require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  
    opts.on('-iFILE', "--input=FILE", "Run verbosely") { |v| options[:input_file] = v }
    opts.on('-oFILE', "--output=FILE", "Run verbosely") { |v| options[:output_file] = v }
  
end.parse!

require './lib/converter'
converter = Converter.new(options)

p converter.convert


